import 'package:get/get.dart';
import 'package:khetipati/models/cagetories.dart';
import 'package:khetipati/models/order.dart';
import 'package:khetipati/models/product.dart';
import 'package:khetipati/services/product_services.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();

  ///index for tab
  var index = 2.obs;

  get selectedIndex => index.value;

  var cart = <Order>[].obs;
  var categories = <Category>[].obs;
  var products = <Product>[].obs;
  var isloading = false.obs;

  updateIndex(int i) {
    index.value = i;
  }

  addToCart(Product product) {}

  ///fetch and assign categories
  getAllCategories() async {
    categories.clear();
    isloading.value = true;
    try {
      var categoriesdata = await productrepo.getAllCategories();
      if (categoriesdata.length > 0) {
        categoriesdata.forEach((element) {
          categories.add(Category.fromJson(element));
        });
      }
      isloading.value = false;
    } catch (e) {
      print(e.toString());
    }
  }

  ///fetch products
  fetchProduct() async {
    products.clear();
    isloading.value = true;
    for (var element in productdata) {
      products.add(Product.fromJson(element));
    }
    // var data = await productrepo.getAllProducts();
    print(products.length);
    // print(data);
    // if (data.isBlank) {
    //   getSnackbar(message: "Error loading ");
    // } else {
    //   products.addAll(data);
    // }

    isloading.value = false;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // getAllCategories();
    getAllCategories();
    fetchProduct();
  }

  @override
  void onReady() {
    // TODO: implement onReady

    super.onReady();
  }
}

final homeController = HomeController();
