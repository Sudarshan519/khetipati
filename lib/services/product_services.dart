import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:khetipati/models/cagetories.dart';
import 'package:khetipati/models/product.dart';
import 'package:khetipati/utils/snackbar.dart';
import 'package:http/http.dart' as http;

class ProductApi extends GetConnect {
  static const base = "http://192.168.10.149:8000/";
  static const productapi = base + "productapi";

  static const categoryapi = base + "categoryapi/";

  ///getall categories
  getAllCategories(String token) async {
    List<Category> categorieslist = [];
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    try {
      var response = await http.get(Uri.parse(categoryapi + "allcategories"),
          headers: headers);
      print(response.body);
      var data = jsonDecode(response.body);
      var status = data["status"];
      var categoriesdata = data["data"];
      if (status == "success") {
        print(categoriesdata);

        return categoriesdata;
      }
    } on PlatformException catch (e) {
      getSnackbar(message: e.message.toString());
    }
  }

  ///get product by category
  getCategorybyid(int id, String token) async {
    print(token);
    List<Product> productlist = [];
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    var response = await get(categoryapi + "categorybyid/1", headers: headers);

    var rawdata = response.body;
    var data = rawdata["data"];
    data.forEach((element) {
      print(element);
    });
  }

// fetch product by id
  getProductById(String id, String token) async {
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final Response response = await get(base + "/user", headers: headers);
    print(response.body);
    var data = response.body;
    Product product = Product.fromJson(data);
    print(product);
    return product;
  }

  //getAllProduct
  getAllProducts(String token) async {
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    var response = await http.get(
        Uri.parse("http://192.168.10.149:8000/productapi/allproduct"),
        headers: headers);

    List<Product> productlist = [];
    var rawdata = jsonDecode(response.body);
    var data = rawdata["data"];
    // print(data);
    // if (data != null) {
    //   data.forEach((v) {
    //     productlist.add(Product.fromJson(v));
    //   });
    // }
    print(productlist.length);
    return data;
  }

  ///getproduct by slug
  getProductBySlug() async {
    String slug = "product-2";
    String token =
        "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xOTIuMTY4LjEwLjE0OTo4MDAwXC91c2VyYXBpXC9sb2dpbiIsImlhdCI6MTYzNzQ5MDkwNSwiZXhwIjoxNjM3NDk0NTA1LCJuYmYiOjE2Mzc0OTA5MDUsImp0aSI6IldueHpHaHRUT0Z4VFpIaTYiLCJzdWIiOjEsInBydiI6ImY3MjMwN2M4YTZjMzRhODExNGJlZTcxODQwYzIxYjNhNDVkYTNhN2YifQ.NFzIMEifwFEREInEAnOazi8JEOgeybGXfy3Xw0pT1nA";
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final Response response =
        await get(base + "/productbyslug/" + "product-2", headers: headers);
    print(response.body);
  }

  ///filterProduct
  filterProduct(String filterby) {}

  ///submit Rating
  submitRating(String rating) {}

  ///Order Submit
  orderSubmit() {}
}

final productrepo = ProductApi();
