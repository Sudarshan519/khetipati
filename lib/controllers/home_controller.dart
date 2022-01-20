import 'package:flutter/widgets.dart';
import 'package:geocoder/geocoder.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:khetipati/controllers/auth_controller.dart';
import 'package:khetipati/models/cagetories.dart';
import 'package:khetipati/models/cart.dart';
import 'package:khetipati/models/product.dart';
import 'package:khetipati/models/user.dart';
import 'package:khetipati/services/app_service.dart';
import 'package:khetipati/services/user_services.dart';
import 'package:khetipati/utils/snackbar.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();

  ///index for tab
  var index = 0.obs;
  RxInt count = 0.obs;
  get selectedIndex => index.value;
  var user = User().obs;
  var cart = <CartModel>[].obs;
  var categories = <Category>[].obs;
  final _products = <Product>[].obs;
  var isloading = false.obs;
  var isproductloading = false.obs;

  TextEditingController address = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController fullname = TextEditingController();

  ///update tab index
  updateIndex(int i) {
    index.value = i;
  }

  ///get user info
  getuserdata() async {
    try {
      isloading(true);
      var data = await userrepo.getuserInfo(authController.token.value);

      if (data != null) {
        user.value = data;
        print(user.value.email);
        isloading(false);
      }
    } catch (e) {
      // TODO

    }
    // print(user.value);
    // userInfo.value = userFromJson(data);
  }

  ///fetch and assign categories
  getAllCategories() async {
    categories.clear();
    var list = [];
    isloading.value = true;
    try {
      var list =
          await AppServices().getAllCategories(authController.token.value);
      if (list.isNotEmpty) {
        isloading.value = true;
        categories.addAll(list);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  ///fetch products
  fetchProduct() async {
    _products.value = [];

    isproductloading.value = true;
    try {
      var list = await AppServices().getAllProducts(authController.token.value);

      if (list.isNotEmpty) {
        _products.addAll(list);
      }
      isproductloading.value = false;
    } catch (e) {
      getSnackbar(message: "Error on fetching data");
      isproductloading.value = false;
      print(e.toString());
    }

    isproductloading.value = false;
  }

  get products => _products;

  ///get order by user id
  getOrder() async {
    print("fetching order");
    try {
      var list = await AppServices().getOrderbyUserid(
          user.value.id.toString(), authController.token.value);

      if (list.isNotEmpty) {
        _products.addAll(list);
      }
      isproductloading.value = false;
    } catch (e) {
      getSnackbar(message: "Error on fetching data");
      isproductloading.value = false;
      print(e.toString());
    }
  }

  @override
  void onInit() {
    fetchAll();
    getuserdata();
    super.onInit();
  }

//fetch filed
  fetchAll() {
    getAllCategories();
    fetchProduct();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void getProductByCategories(int id) async {
    // await productrepo.getCategorybyid(id);
  }

  // void submitOrder(products) {
  //   Order(
  //       totalAmount: 533, additionalnote: "additionalnote", products: products);
  //   AppServices().orderSubmit(authController.token.value);
  // }

  void increment() {
    count++;
    update();
  }

  void decrement() {
    count--;
    update();
  }

  submitShippinhAddress() async {
    await AppServices()
        .shippingAddressSubmit(authController.token.value, address.text);
  }

  mapTapped(LatLng location) async {
    final coordinates = Coordinates(location.latitude, location.longitude);
    var data = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = data.first;
    print(
        '${first.subLocality},${first.locality}, ${first.adminArea},${first.countryName}');
    address.text =
        "${first.subLocality},${first.locality}, ${first.adminArea},${first.countryName}";
    return first;
  }

  // selectedLocation() async {
  //   await mapTapped;
  //   // address.text = selectedLocation();
  // }
}
