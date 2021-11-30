import 'package:get/get.dart';
import 'package:khetipati/models/product.dart';

class CartController extends GetxController {
//for cart products
  final _products = {}.obs;
//add product to cart
  void addProduct(Product product) {
    if (_products.containsKey(product)) {
      _products[product] += 1;
    } else {
      _products[product] = 1;
    }
  }

//delete product from cart
  void deleteProduct(Product product) {
    if (_products.containsKey(product)) {
      _products.removeWhere((key, value) => key == product);
    }
  }

//remove product from cat
  void removeProduct(Product product) {
    if (_products.containsKey(product) && _products[product] == 1) {
      _products.removeWhere((key, value) => key == product);
    } else {
      _products[product] -= 1;
    }
  }

//check product in cart
  bool checkProductinCart(Product product) {
    if (_products.containsKey(product)) {
      return true;
    } else {
      return false;
    }
  }

  //get products
  get products => _products;

  ///get total
  get total => _products.entries
      .map((e) => e.key.productPrice * e.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);
}
