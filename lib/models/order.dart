import 'dart:convert';

import 'product.dart';

Order orderFromJson(String str) => Order.fromJson(json.decode(str));

String orderToJson(Order data) => json.encode(data.toJson());

class Order {
  Order({
    required this.totalAmount,
    // required this.orderstatusId,
    // required this.shippingId,
    // required this.paymenttypeId,
    required this.additionalnote,
    // required this.shippingprice,
    required this.products,
  });

  int totalAmount;
  // int orderstatusId;
  // int shippingId;
  // int paymenttypeId;
  String additionalnote;
  // int shippingprice;
  List<Product> products;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        totalAmount: json["total_amount"],
        // orderstatusId: json["orderstatus_id"],
        // shippingId: json["shipping_id"],
        // paymenttypeId: json["paymenttype_id"],
        additionalnote: json["additionalnote"],
        // shippingprice: json["shippingprice"],
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total_amount": totalAmount,
        // "orderstatus_id": orderstatusId,
        // "shipping_id": shippingId,
        // "paymenttype_id": paymenttypeId,
        "additionalnote": additionalnote,
        // "shippingprice": shippingprice,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

// class Product {
//   Product({
//     required this.productId,
//     required this.price,
//     required this.quantity,
//   });

//   int productId;
//   int price;
//   int quantity;

//   factory Product.fromJson(Map<String, dynamic> json) => Product(
//         productId: json["product_id"],
//         price: json["price"],
//         quantity: json["quantity"],
//       );

//   Map<String, dynamic> toJson() => {
//         "product_id": productId,
//         "price": price,
//         "quantity": quantity,
//       };
// }
