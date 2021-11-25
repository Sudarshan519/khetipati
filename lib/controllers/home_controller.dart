import 'package:get/get.dart';
import 'package:khetipati/models/cagetories.dart';
import 'package:khetipati/models/cart.dart';
import 'package:khetipati/models/product.dart';
import 'package:khetipati/models/user.dart';
import 'package:khetipati/services/product_services.dart';
import 'package:khetipati/utils/snackbar.dart';
import 'package:khetipati/utils/storage/auth_storage.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();

  ///index for tab
  var index = 2.obs;

  get selectedIndex => index.value;
  var user = User().obs;
  var cart = <CartModel>[].obs;
  var categories = <Category>[].obs;
  var products = <Product>[].obs;
  var isloading = false.obs;

  ///update tab index
  updateIndex(int i) {
    index.value = i;
  }

  ///gettotal price
  getTotalPrice() {
    double total = 0;
    cart.forEach((element) {
      total = total + double.parse(element.price!);
    });
    print(total);
    return total.toString();
  }

  ///cart
  addToCart(CartModel product) {
    if (cart.contains(product)) {
      print(cart.indexOf(product));
      int index = cart.indexOf(product);
      cart[index].quantity =
          ((int.parse(cart[index].quantity!)) + 1).toString();
      getSnackbar(message: "Item quantity ${cart[index].quantity!}");
    } else {
      cart.add(product);
    }
    cart.add(product);
    print(cart.toJson());
  }

  removeFromCart(CartModel product) {
    // int index = cart.indexOf(product);
    // // print(int.parse(cart[index].quantity!) > 1);
    // if (int.parse(cart[index].quantity!) > 1) {
    //   cart[index].quantity =
    //       ((int.parse(cart[index].quantity!)) - 1).toString();
    //   getSnackbar(message: "Item quantity ${cart[index].quantity!}");
    // } else {
    //   cart.remove(cart[index]);
    //   getSnackbar(message: "Item removed");
    // }
    // cart.removeWhere((element) => product == element);
    // print(cart.length);
    cart.remove(product);
  }

  removeProduct(CartModel product) {
    cart.removeWhere((element) => product == element);
  }

  ///get user info
  getuser() {
    var user = AuthStorage.currentUser;

    // print(user!.firstname.toString());
    return User.fromJson(user);
  }

  ///fetch and assign categories
  getAllCategories() async {
    categories.clear();
    isloading.value = true;
    try {
      var categoriesdata = await productrepo.getAllCategories();
      if (categoriesdata.isNotEmpty) {
        for (var element in categoriesdata) {
          categories.add(Category.fromJson(element));
        }
      }
      isloading.value = false;
    } catch (e) {
      print(e.toString());
    }
  }

  ///fetch products
  fetchProduct() async {
    products.value = [];
    isloading.value = true;
    var productfromapi = await productrepo.getAllProducts();

    print(productfromapi.toString());
    for (var element in productfromapi) {
      products.add(Product.fromJson(element));
    }
    isloading.value = false;
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
    // TODO: implement onReady

    super.onReady();
  }

  void getProductByCategories(int id) async {
    // await productrepo.getCategorybyid(id);
  }
}

final homeController = HomeController();
