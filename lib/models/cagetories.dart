// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

CategoryrResp categoryrRespFromJson(String str) =>
    CategoryrResp.fromJson(json.decode(str));

String categoryrRespToJson(CategoryrResp data) => json.encode(data.toJson());

class CategoryrResp {
  CategoryrResp({
    required this.status,
    required this.message,
    required this.data,
  });

  String status;
  String message;
  List<Category> data;

  factory CategoryrResp.fromJson(Map<String, dynamic> json) => CategoryrResp(
        status: json["status"],
        message: json["message"],
        data:
            List<Category>.from(json["data"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

String categoryToJson(Category data) => json.encode(data.toJson());

class Category {
  Category({
    required this.id,
    required this.title,
    required this.slug,
    required this.categoryIcon,
    required this.description,
    this.metaTitle,
    this.metaDescription,
    required this.logoUrl,
    required this.bannerUrl,
    required this.createdAt,
  });

  int id;
  String title;
  String slug;
  String categoryIcon;
  String description;
  dynamic metaTitle;
  dynamic metaDescription;
  String logoUrl;
  String bannerUrl;
  String createdAt;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        title: json["title"] ?? "",
        slug: json["slug"] ?? "",
        categoryIcon: json["category_icon"] ?? "",
        description: json["description"] ?? "",
        metaTitle: json["meta_title"] ?? "",
        metaDescription: json["meta_description"] ?? "",
        logoUrl: json["logo_url"] ?? "",
        bannerUrl: json["banner_url"] ?? "",
        createdAt: (json["created_at"] ?? ""),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "category_icon": categoryIcon,
        "description": description,
        "meta_title": metaTitle,
        "meta_description": metaDescription,
        "logo_url": logoUrl,
        "banner_url": bannerUrl,
        "created_at": createdAt,
      };
}


// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

// import 'dart:convert';

// Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

// String categoryToJson(Category data) => json.encode(data.toJson());

// class Category {
//   Category({
//     required this.status,
//     required this.message,
//     required this.data,
//   });

//   String status;
//   String message;
//   List<Datum> data;

//   factory Category.fromJson(Map<String, dynamic> json) => Category(
//         status: json["status"],
//         message: json["message"],
//         data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "status": status,
//         "message": message,
//         "data": List<dynamic>.from(data.map((x) => x.toJson())),
//       };
// }

// class Datum {
//   Datum({
//     required this.id,
//     required this.title,
//     required this.slug,
//     required this.categoryIcon,
//     required this.description,
//     required this.metaTitle,
//     required this.metaDescription,
//     required this.logoUrl,
//     required this.bannerUrl,
//     required this.createdAt,
//   });

//   int id;
//   String title;
//   String slug;
//   String categoryIcon;
//   String description;
//   String metaTitle;
//   String metaDescription;
//   String logoUrl;
//   String bannerUrl;
//   DateTime createdAt;

//   factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//         id: json["id"],
//         title: json["title"],
//         slug: json["slug"],
//         categoryIcon:
//             json["category_icon"] == null ? null : json["category_icon"],
//         description: json["description"],
//         metaTitle: json["meta_title"] == null ? null : json["meta_title"],
//         metaDescription:
//             json["meta_description"] == null ? null : json["meta_description"],
//         logoUrl: json["logo_url"],
//         bannerUrl: json["banner_url"] == null ? null : json["banner_url"],
//         createdAt: DateTime.parse(json["created_at"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "title": title,
//         "slug": slug,
//         "category_icon": categoryIcon == null ? null : categoryIcon,
//         "description": description,
//         "meta_title": metaTitle == null ? null : metaTitle,
//         "meta_description": metaDescription == null ? null : metaDescription,
//         "logo_url": logoUrl,
//         "banner_url": bannerUrl == null ? null : bannerUrl,
//         "created_at": createdAt.toIso8601String(),
//       };
// }
