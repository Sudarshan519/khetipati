import 'dart:math';

import 'package:get/get.dart';
import 'package:khetipati/controllers/auth_controller.dart';
import 'package:khetipati/models/cagetories.dart';
import 'package:khetipati/models/cart.dart';
import 'package:khetipati/models/product.dart';
import 'package:khetipati/models/user.dart';
import 'package:khetipati/services/app_service.dart';
import 'package:khetipati/utils/snackbar.dart';
import 'package:khetipati/utils/storage/app_storage.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();

  ///index for tab
  var index = 0.obs;

  get selectedIndex => index.value;
  var user = User().obs;
  var cart = <CartModel>[].obs;
  var categories = <Category>[].obs;
  final _products = <Product>[].obs;
  var isloading = false.obs;
  var isproductloading = false.obs;

  ///update tab index
  updateIndex(int i) {
    index.value = i;
  }

  ///get user info
  getuser() {
    var user = AppStorage.getData("user");

    // print(user!.firstname.toString());
    return User.fromJson(user);
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
        categories.addAll(list);
      } else {
        categoriesdata.forEach((element) {
          categories.add(Category.fromJson(element));
        });
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

      if (list.isNotEmpty && list != null) {
        _products.addAll(list);
      } else {
        productdata.forEach((element) {
          _products.add(Product.fromJson(element));
        });
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

  // void submitOrder() {
  //   AppServices().orderSubmit(authController.token.value);
  // }
}
