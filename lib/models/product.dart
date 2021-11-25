import 'dart:convert';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  Product({
    this.id,
    this.title,
    this.slug,
    this.featureImage,
    this.description,
    this.shortDescription,
    this.productPrice,
    this.discountPrice,
    this.stockQty,
    this.unitIn,
    this.minimumOrder,
    this.warningQty,
    this.metaTitle,
    this.metaDescription,
    this.barcode,
    this.discountPercent,
    this.productImages,
    this.productRating,
    this.averagerating,
  });

  int? id;
  String? title;
  String? slug;
  FeatureImage? featureImage;
  String? description;
  String? shortDescription;
  double? productPrice;
  int? discountPrice;
  int? stockQty;
  String? unitIn;
  int? minimumOrder;
  int? warningQty;
  String? metaTitle;
  String? metaDescription;
  String? barcode;
  double? discountPercent;
  List<ProductImage>? productImages;
  List<ProductRating>? productRating;
  int? averagerating;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        featureImage: FeatureImage.fromJson(json["feature_image"]),
        description: json["description"],
        shortDescription: json["short_description"],
        productPrice: json["product_price"],
        discountPrice:
            json["discount_price"] == null ? null : json["discount_price"],
        stockQty: json["stock_qty"],
        unitIn: json["unit_in"] == null ? null : json["unit_in"],
        minimumOrder: json["minimum_order"],
        warningQty: json["warning_qty"],
        metaTitle: json["meta_title"],
        metaDescription: json["meta_description"],
        barcode: json["barcode"],
        discountPercent: json["discount_percent"].toDouble(),
        productImages: List<ProductImage>.from(
            json["product_images"].map((x) => ProductImage.fromJson(x))),
        productRating: List<ProductRating>.from(
            json["product_rating"].map((x) => ProductRating.fromJson(x))),
        averagerating: json["averagerating"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "feature_image": featureImage!.toJson(),
        "description": description,
        "short_description": shortDescription,
        "product_price": productPrice,
        "discount_price": discountPrice == null ? null : discountPrice,
        "stock_qty": stockQty,
        "unit_in": unitIn == null ? null : unitIn,
        "minimum_order": minimumOrder,
        "warning_qty": warningQty,
        "meta_title": metaTitle,
        "meta_description": metaDescription,
        "barcode": barcode,
        "discount_percent": discountPercent,
        "product_images":
            List<dynamic>.from(productImages!.map((x) => x.toJson())),
        "product_rating":
            List<dynamic>.from(productRating!.map((x) => x.toJson())),
        "averagerating": averagerating,
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

class ProductImage {
  ProductImage({
    this.id,
    this.resizePath,
    this.originalPath,
  });

  int? id;
  String? resizePath;
  String? originalPath;

  factory ProductImage.fromJson(Map<String, dynamic> json) => ProductImage(
        id: json["id"],
        resizePath: json["resize_path"],
        originalPath: json["original_path"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "resize_path": resizePath,
        "original_path": originalPath,
      };
}

class ProductRating {
  ProductRating({
    this.id,
    this.userId,
    this.productId,
    this.rating,
    this.comment,
  });

  int? id;
  int? userId;
  int? productId;
  int? rating;
  String? comment;

  factory ProductRating.fromJson(Map<String, dynamic> json) => ProductRating(
        id: json["id"],
        userId: json["user_id"],
        productId: json["product_id"],
        rating: json["rating"],
        comment: json["comment"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "product_id": productId,
        "rating": rating,
        "comment": comment,
      };
}

//static categories
var categoriesdata = [
  {
    "id": 1,
    "title": "Vegetables",
    "slug": "vegetables",
    "category_icon": "<i class=\"fas fa-carrot\"></i>",
    "description": "<p>cauliflower</p>",
    "meta_title": null,
    "meta_description": null,
    "logo_url":
        "https://aalokimageupload.s3.ap-south-1.amazonaws.com/resize/upload/21/09/1632725988cauliflower-1644626_1920.jpg",
    "banner_url":
        "https://aalokimageupload.s3.ap-south-1.amazonaws.com/resize/upload/21/09/1632725974cauliflower-1644626_1920.jpg",
    "created_at": "2021-09-27T06:59:56.000000Z"
  },
  {
    "id": 2,
    "title": "Leafy green",
    "slug": "leafy-green",
    "category_icon": "<i class=\"fas fa-pepper-hot\"></i>",
    "description": "<p>this is pepper</p>",
    "meta_title": null,
    "meta_description": null,
    "logo_url":
        "https://aalokimageupload.s3.ap-south-1.amazonaws.com/resize/upload/21/09/1632726829bell-peppers-421087_1920.jpg",
    "banner_url":
        "https://aalokimageupload.s3.ap-south-1.amazonaws.com/resize/upload/21/09/1632726819bell-peppers-421087_1920.jpg",
    "created_at": "2021-09-27T07:13:57.000000Z"
  },
  {
    "id": 3,
    "title": "Tuber vegetables",
    "slug": "tuber-vegetables",
    "category_icon": null,
    "description": "<p>dsadsa</p>",
    "meta_title": "dsadas",
    "meta_description": "<p>dsadsadsa</p>",
    "logo_url":
        "https://aalokimageupload.s3.ap-south-1.amazonaws.com/resize/upload/21/09/1632815402240828795_258361855980157_4053599342857628347_n.png",
    "banner_url": null,
    "created_at": "2021-09-28T07:50:04.000000Z"
  }
];
var productdata = [
  {
    "id": 1,
    "title": "Coffee bean",
    "slug": "coffee-bean",
    "feature_image": {
      "thumbnail_image":
          "https://aalokimageupload.s3.ap-south-1.amazonaws.com/upload/21/09/1632914166Dragon%20Ball_%20An%20Artful%20Journey.jpeg",
      "original_image":
          "https://aalokimageupload.s3.ap-south-1.amazonaws.com/upload/21/09/1632914166Dragon%20Ball_%20An%20Artful%20Journey.jpeg"
    },
    "description": "dsadasdas",
    "short_description": "dsadas",
    "product_price": 100,
    "discount_price": 5,
    "stock_qty": 5,
    "unit_in": null,
    "minimum_order": 2,
    "warning_qty": 2,
    "meta_title": "bcbvcbvc",
    "meta_description": "hggfcgfcfg",
    "barcode": "00945678",
    "discount_percent": 5,
    "product_images": [],
    "product_rating": [
      {"id": 1, "user_id": 6, "product_id": 1, "rating": 5, "comment": "good"},
      {"id": 8, "user_id": 5, "product_id": 1, "rating": 5, "comment": "good"},
      {"id": 9, "user_id": 5, "product_id": 1, "rating": 2, "comment": "good"}
    ],
    "averagerating": 4
  },
  {
    "id": 2,
    "title": "Spinach",
    "slug": "spinach",
    "feature_image": {
      "thumbnail_image":
          "https://aalokimageupload.s3.ap-south-1.amazonaws.com/resize/upload/21/09/1632728959spinach-1427360_1920.jpg",
      "original_image":
          "https://aalokimageupload.s3.ap-south-1.amazonaws.com/upload/21/09/1632728959spinach-1427360_1920.jpg"
    },
    "description": "dasdasdasdas",
    "short_description": "dsadas",
    "product_price": 50,
    "discount_price": 10,
    "stock_qty": 50,
    "unit_in": null,
    "minimum_order": 2,
    "warning_qty": 2,
    "meta_title": "dsadasdas",
    "meta_description": "dsadasdasdasdas",
    "barcode": "00945679",
    "discount_percent": 20,
    "product_images": [
      {
        "id": 10,
        "resize_path":
            "https://aalokimageupload.s3.ap-south-1.amazonaws.com/resize/upload/21/09/1632728929240804596_1473759509670780_2323038474764837567_n.png",
        "original_path":
            "https://aalokimageupload.s3.ap-south-1.amazonaws.com/upload/21/09/1632728929240804596_1473759509670780_2323038474764837567_n.png"
      }
    ],
    "product_rating": [],
    "averagerating": 0
  },
  {
    "id": 3,
    "title": "Silverbelt",
    "slug": "silverbelt",
    "feature_image": {
      "thumbnail_image":
          "https://aalokimageupload.s3.ap-south-1.amazonaws.com/resize/upload/21/10/16331931037.jpg",
      "original_image":
          "https://aalokimageupload.s3.ap-south-1.amazonaws.com/upload/21/10/16331931037.jpg"
    },
    "description": "dsadsadas",
    "short_description": "dsadsadsa",
    "product_price": 100,
    "discount_price": 10,
    "stock_qty": 50,
    "unit_in": "KG",
    "minimum_order": 1,
    "warning_qty": 5,
    "meta_title": "dsadasdsa",
    "meta_description": "sadsadasd",
    "barcode": "1321365465",
    "discount_percent": 10,
    "product_images": [],
    "product_rating": [
      {
        "id": 3,
        "user_id": 6,
        "product_id": 3,
        "rating": 5,
        "comment": "average"
      }
    ],
    "averagerating": 5
  },
  {
    "id": 4,
    "title": "pumpkin",
    "slug": "pumpkin",
    "feature_image": {
      "thumbnail_image":
          "https://aalokimageupload.s3.ap-south-1.amazonaws.com/resize/upload/21/10/1633193236Dragon-HD-Wallpaper-1920x1080.jpg",
      "original_image":
          "https://aalokimageupload.s3.ap-south-1.amazonaws.com/upload/21/10/1633193236Dragon-HD-Wallpaper-1920x1080.jpg"
    },
    "description": "dsadsadasdsadsa",
    "short_description": "dsadasdas",
    "product_price": 160,
    "discount_price": 10,
    "stock_qty": 50,
    "unit_in": null,
    "minimum_order": 1,
    "warning_qty": 6,
    "meta_title": "sadsadasfa",
    "meta_description": "dsadasdasda",
    "barcode": "231345646",
    "discount_percent": 6.25,
    "product_images": [],
    "product_rating": [
      {
        "id": 4,
        "user_id": 6,
        "product_id": 4,
        "rating": 5,
        "comment": "average"
      }
    ],
    "averagerating": 5
  },
  {
    "id": 5,
    "title": "Cabbage",
    "slug": "cabbage",
    "feature_image": {
      "thumbnail_image":
          "https://aalokimageupload.s3.ap-south-1.amazonaws.com/resize/upload/21/10/1633193292180289.jpg",
      "original_image":
          "https://aalokimageupload.s3.ap-south-1.amazonaws.com/upload/21/10/1633193292180289.jpg"
    },
    "description": "dsadsadsadsadas",
    "short_description": "dsadsadasdasd",
    "product_price": 150,
    "discount_price": 10,
    "stock_qty": 50,
    "unit_in": "KG",
    "minimum_order": 1,
    "warning_qty": 6,
    "meta_title": "dsadsadasdsadas",
    "meta_description": "dsadasdasdasdas",
    "barcode": "213131",
    "discount_percent": 6.67,
    "product_images": [],
    "product_rating": [
      {"id": 2, "user_id": 6, "product_id": 5, "rating": 5, "comment": "best"}
    ],
    "averagerating": 5
  },
  {
    "id": 6,
    "title": "potato",
    "slug": "potato",
    "feature_image": {
      "thumbnail_image":
          "https://aalokimageupload.s3.ap-south-1.amazonaws.com/resize/upload/21/10/16331933827.jpg",
      "original_image":
          "https://aalokimageupload.s3.ap-south-1.amazonaws.com/upload/21/10/16331933827.jpg"
    },
    "description": "dsadsadasdsa",
    "short_description": "dsadasdsadsa",
    "product_price": 50,
    "discount_price": 10,
    "stock_qty": 50,
    "unit_in": null,
    "minimum_order": 1,
    "warning_qty": 5,
    "meta_title": "dsadsadas",
    "meta_description": "dsadsadsadsadasd",
    "barcode": "45122555",
    "discount_percent": 20,
    "product_images": [],
    "product_rating": [],
    "averagerating": 0
  },
  {
    "id": 7,
    "title": "yam",
    "slug": "yam",
    "feature_image": {
      "thumbnail_image":
          "https://aalokimageupload.s3.ap-south-1.amazonaws.com/resize/upload/21/10/16331934490b273907e2567abd3fb5cd4e4ba92f4c.jpg",
      "original_image":
          "https://aalokimageupload.s3.ap-south-1.amazonaws.com/upload/21/10/16331934490b273907e2567abd3fb5cd4e4ba92f4c.jpg"
    },
    "description": "dsadsadsadasdas",
    "short_description": "fdfafasfas",
    "product_price": 70,
    "discount_price": null,
    "stock_qty": 50,
    "unit_in": "KG",
    "minimum_order": 6,
    "warning_qty": 6,
    "meta_title": "dsadsadasdas",
    "meta_description": "dasfasfasfasfa",
    "barcode": "13136546",
    "discount_percent": 0,
    "product_images": [],
    "product_rating": [],
    "averagerating": 0
  },
  {
    "id": 8,
    "title": "celerary",
    "slug": "celerary",
    "feature_image": {
      "thumbnail_image":
          "https://aalokimageupload.s3.ap-south-1.amazonaws.com/resize/upload/21/10/163319349903bef8043dfe6f29d9802eda54b31084.jpg",
      "original_image":
          "https://aalokimageupload.s3.ap-south-1.amazonaws.com/upload/21/10/163319349903bef8043dfe6f29d9802eda54b31084.jpg"
    },
    "description": "dsadasdasdasdas",
    "short_description": "dsadsadsadas",
    "product_price": 150,
    "discount_price": null,
    "stock_qty": 100,
    "unit_in": "KG",
    "minimum_order": 15,
    "warning_qty": 20,
    "meta_title": "dasdasdasdasd",
    "meta_description": "dsadsadasdsa",
    "barcode": "1313213",
    "discount_percent": 0,
    "product_images": [],
    "product_rating": [],
    "averagerating": 0
  },
  {
    "id": 9,
    "title": "broccoli",
    "slug": "broccoli",
    "feature_image": {
      "thumbnail_image":
          "https://aalokimageupload.s3.ap-south-1.amazonaws.com/resize/upload/21/10/16331935872fe555c6ec110521379d4302073045e2.jpg",
      "original_image":
          "https://aalokimageupload.s3.ap-south-1.amazonaws.com/upload/21/10/16331935872fe555c6ec110521379d4302073045e2.jpg"
    },
    "description": "dsadasdasda",
    "short_description": "dsadasdasdas",
    "product_price": 160,
    "discount_price": null,
    "stock_qty": 200,
    "unit_in": "KG",
    "minimum_order": 2,
    "warning_qty": 15,
    "meta_title": "dsadsadsadsad",
    "meta_description": "dsadsadasdas",
    "barcode": "131365465",
    "discount_percent": 0,
    "product_images": [],
    "product_rating": [
      {
        "id": 6,
        "user_id": 6,
        "product_id": 9,
        "rating": 3,
        "comment": "average"
      },
      {
        "id": 7,
        "user_id": 5,
        "product_id": 9,
        "rating": 3,
        "comment": "average"
      }
    ],
    "averagerating": 3
  },
  {
    "id": 10,
    "title": "garlic",
    "slug": "garlic",
    "feature_image": {
      "thumbnail_image":
          "https://aalokimageupload.s3.ap-south-1.amazonaws.com/resize/upload/21/10/163319364034a8e43bc21f4390471c704d2f21b833.jpg",
      "original_image":
          "https://aalokimageupload.s3.ap-south-1.amazonaws.com/upload/21/10/163319364034a8e43bc21f4390471c704d2f21b833.jpg"
    },
    "description": "dsadasdsadas",
    "short_description": "dsadasdasdas",
    "product_price": 150,
    "discount_price": null,
    "stock_qty": 300,
    "unit_in": "KG",
    "minimum_order": 2,
    "warning_qty": 56,
    "meta_title": "dsadsada",
    "meta_description": "dsadsadasdas",
    "barcode": "1316464",
    "discount_percent": 0,
    "product_images": [],
    "product_rating": [
      {
        "id": 5,
        "user_id": 6,
        "product_id": 10,
        "rating": 4,
        "comment": "average"
      }
    ],
    "averagerating": 4
  }
];
