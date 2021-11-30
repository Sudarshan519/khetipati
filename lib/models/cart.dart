class CartModel {
  String? productName;

  String productId;
  String price;
  String? quantity;
  CartModel({
    this.productName,
    required this.price,
    this.quantity,
    required this.productId,
  });
}
