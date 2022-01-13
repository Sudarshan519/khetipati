import 'dart:convert';

Order orderFromJson(String str) => Order.fromJson(json.decode(str));

String orderToJson(Order data) => json.encode(data.toJson());

class Order {
  Order({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  Data? data;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  Data({
    this.singleOrder,
  });

  SingleOrder? singleOrder;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        singleOrder: SingleOrder.fromJson(json["singleOrder"]),
      );

  Map<String, dynamic> toJson() => {
        "singleOrder": singleOrder?.toJson(),
      };
}

class SingleOrder {
  SingleOrder({
    this.orderCode,
    this.userId,
    this.totalamount,
    this.tax,
    this.vat,
    this.orderstatusId,
    this.shippingId,
    this.paymenttypeId,
    this.additionalnote,
    this.orderDetails,
    this.userDetails,
  });

  int? orderCode;
  int? userId;
  int? totalamount;
  dynamic tax;
  dynamic vat;
  int? orderstatusId;
  int? shippingId;
  int? paymenttypeId;
  String? additionalnote;
  List<OrderDetail>? orderDetails;
  UserDetails? userDetails;

  factory SingleOrder.fromJson(Map<String, dynamic> json) => SingleOrder(
        orderCode: json["order_code"],
        userId: json["user_id"],
        totalamount: json["totalamount"],
        tax: json["tax"],
        vat: json["vat"],
        orderstatusId: json["orderstatus_id"],
        shippingId: json["shipping_id"],
        paymenttypeId: json["paymenttype_id"],
        additionalnote: json["additionalnote"],
        orderDetails: List<OrderDetail>.from(
            json["orderDetails"].map((x) => OrderDetail.fromJson(x))),
        userDetails: UserDetails.fromJson(json["userDetails"]),
      );

  Map<String, dynamic> toJson() => {
        "order_code": orderCode,
        "user_id": userId,
        "totalamount": totalamount,
        "tax": tax,
        "vat": vat,
        "orderstatus_id": orderstatusId,
        "shipping_id": shippingId,
        "paymenttype_id": paymenttypeId,
        "additionalnote": additionalnote,
        "orderDetails":
            List<dynamic>.from(orderDetails!.map((x) => x.toJson())),
        "userDetails": userDetails?.toJson(),
      };
}

class OrderDetail {
  OrderDetail({
    this.id,
    this.price,
    this.quantity,
    this.attribute,
    this.product,
  });

  int? id;
  int? price;
  int? quantity;
  dynamic attribute;
  OrderProduct? product;

  factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
        id: json["id"],
        price: json["price"],
        quantity: json["quantity"],
        attribute: json["attribute"],
        product: OrderProduct.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "price": price,
        "quantity": quantity,
        "attribute": attribute,
        "product": product?.toJson(),
      };
}

class OrderProduct {
  OrderProduct({
    this.id,
    this.title,
    this.slug,
    this.featureImage,
    this.description,
    this.shortDescription,
    this.productPrice,
    this.discountPrice,
  });

  int? id;
  String? title;
  String? slug;
  FeatureImage? featureImage;
  String? description;
  String? shortDescription;
  int? productPrice;
  int? discountPrice;

  factory OrderProduct.fromJson(Map<String, dynamic> json) => OrderProduct(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        featureImage: FeatureImage.fromJson(json["feature_image"]),
        description: json["description"],
        shortDescription: json["short_description"],
        productPrice: json["product_price"],
        discountPrice: json["discount_price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "feature_image": featureImage?.toJson(),
        "description": description,
        "short_description": shortDescription,
        "product_price": productPrice,
        "discount_price": discountPrice,
      };
}

class FeatureImage {
  FeatureImage({
    this.thumbnailImage,
    this.originalImage,
  });

  String? thumbnailImage;
  String? originalImage;

  factory FeatureImage.fromJson(Map<String, dynamic> json) => FeatureImage(
        thumbnailImage: json["thumbnail_image"],
        originalImage: json["original_image"],
      );

  Map<String, dynamic> toJson() => {
        "thumbnail_image": thumbnailImage,
        "original_image": originalImage,
      };
}

class UserDetails {
  UserDetails({
    this.firstname,
    this.lastname,
    this.email,
    this.phone,
    this.image,
  });

  String? firstname;
  String? lastname;
  String? email;
  String? phone;
  dynamic image;

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        phone: json["phone"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "phone": phone,
        "image": image,
      };
}
