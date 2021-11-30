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

//remove product from cat
  void removeProduct(Product product) {
    if (_products.containsKey(product) && _products[product] == 1) {
      _products.removeWhere((key, value) => key == product);
    } else {
      _products[product] -= 1;
    }
  }

  void removeFromCart(Product product) {
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
    _products.remove(product);
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
