import 'package:get/get.dart';
import 'package:khetipati/models/cagetories.dart';
import 'package:khetipati/models/cart.dart';
import 'package:khetipati/models/product.dart';
import 'package:khetipati/models/user.dart';
import 'package:khetipati/utils/snackbar.dart';
import 'package:khetipati/utils/storage/auth_storage.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();

  ///index for tab
  var index = 0.obs;

  get selectedIndex => index.value;
  var user = User().obs; 
  var categories = <Category>[].obs;
  var _products = <Product>[].obs;
  var isloading = false.obs;
  var token = "".obs;

  ///fetch products
  fetchProduct() async {
    _products.value = [];
    isloading.value = true;
    // var productfromapi = await productrepo.getAllProducts();

    // print(productfromapi.toString());
    for (var element in productdata) {
      _products.add(Product.fromJson(element));
    }
    isloading.value = false;
  }

  get products => _products;

  ///update tab index
  updateIndex(int i) {
    index.value = i;
  }

  ///gettotal price
  getTotalPrice() {
    double total = 0;
    for (var element in cart) {
      total = total + double.parse(element.price!);
    }

    return total.toString();
  }

 
  ///get user info
  getuser() {
    var user = appStorage.currentUser;
 
    return User.fromJson(user);
  }

  ///fetch and assign categories
  getAllCategories() async {
    categories.clear();
    isloading.value = true;
    try {
      // var categoriesdata = await productrepo.getAllCategories();
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
