import 'package:get/get.dart';
import 'package:khetipati/models/product.dart';

class CartController extends GetxController {
//add a dict to store products in cart
  final _products = {}.obs;

  void addProduct(Product product) {
    if (_products.containsKey(product)) {
      _products[product] += 1;
    } else {
      _products[product] = 1;
    }
  }

  void removeProduct(Product product) {
    if (_products.containsKey(product) && _products[product] == 1) {
      _products.removeWhere((key, value) => key == product);
    } else {
      _products[product] -= 1;
    }
  }

  get products => _products;
  get total => _products.entries
      .map((e) => e.key.productPrice * e.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);
}
