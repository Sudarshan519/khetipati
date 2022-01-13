import 'package:get/state_manager.dart';
import 'package:khetipati/constant/colors.dart';
import 'package:khetipati/models/product.dart';
import 'package:khetipati/utils/snackbar.dart';

class WishlistController extends GetxController {
  final _wishlistProducts = {}.obs;

  void addToWishlist(Product product) {
    if (_wishlistProducts.containsKey(product)) {
      _wishlistProducts[product] += 1;
    } else {
      _wishlistProducts[product] = 1;
    }
    getSnackbar(
        message: 'product added to wishlist', bgColor: AppColors.mainGreen);
  }

  void removeFromWishlist(Product product) {
    _wishlistProducts.remove(product);
  }

  get wishlistProducts => _wishlistProducts;
}
