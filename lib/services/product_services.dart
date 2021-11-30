import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:khetipati/models/product.dart';
import 'package:khetipati/utils/snackbar.dart';
import 'package:khetipati/utils/storage/auth_storage.dart';
import 'package:http/http.dart' as http;

class ProductApi extends GetConnect {
  static const base = "http://192.168.10.149:8000/";
  static const productapi = base + "productapi";

  static const categoryapi = base + "categoryapi/";

  ///getall categories
  getAllCategories() async {
    String token = AppStorage.token;

    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    try {
      var response = await http.get(Uri.parse(categoryapi + "allcategories"),
          headers: headers);
      // print(response.body);
      var data = jsonDecode(response.body);
      var status = data["status"];
      var categoriesdata = data["data"];
      if (status == "success") {
        // print(categoriesdata);

        return categoriesdata;
      }
    } on PlatformException catch (e) {
      getSnackbar(message: e.message.toString());
    }
  }

  ///get product by category
  getCategorybyid(int id) async {
    String token = AppStorage.token;
    print(token);
    // List<Product> productlist = [];
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    var response = await get(categoryapi + "categorybyid/1", headers: headers);

    var rawdata = response.body;
    var data = rawdata["data"];
    data.forEach((element) {});
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
  getAllProducts() async {
    String token = AppStorage.token;
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
    Response response =
        await get(base + "/productbyslug/" + slug, headers: headers);
    print(response.body);
  }

//get product by price
  getProductByPrice() async {
    String api = "";
    String token = AppStorage.token;
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    Response response =
        await get(base + "productapi/productbyprice", headers: headers);
    print(response.body);
  }

  ///filterProduct
  filterProduct(String filterby) async {
    String api = "";
    String token = AppStorage.token;
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    Response response =
        await get(base + "/productbyslug/" + "product-2", headers: headers);
    print(response.body);
  }

  ///submit Rating
  submitRating(String rating) async {
    String api = "";
    String token = AppStorage.token;
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    var response =
        await get(base + "/productbyslug/" + "product-2", headers: headers);
    print(response.body);
  }

  ///Order Submit
  orderSubmit(String token) async {
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var body = {
      "total_amount": "500",
      "shippingprice": "100",
      "additionanote": "You are alloted first order",
      "shipping_id": "1",
      "orderstaus_id": "1",
      "products": "[{product_id:1,price:500,quantity:2}]"
    };

    var response = await http.post(
        Uri.parse("http://192.168.10.149:8000/orderapi/ordersubmit"),
        body: body,
        headers: headers);

    print(response.body);
  }

  //get order
  getOrderById(int id) async {
    String id = "id";
    String token = AppStorage.token;
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var response =
        await get(base + "orderapi/getorderbyid/1", headers: headers);
    print(response.body);
  }

  //get order by code
  getOrderByCode() async {
    String code = "26573";
    String token = AppStorage.token;
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var response =
        await get(base + "orderapi/getorderbycode/265732", headers: headers);
    print(response.body);
  }

// get order by id
  getOrderbyUserid() async {
    String userid = "1";
    String token = AppStorage.token;
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var response =
        await get(base + "orderapi/getorderbyuserid/1", headers: headers);
    print(response.body);
  }

  // contact submit
  contactSubmit(String name, String email, String phone, String subject,
      String message, int seen) async {
    String submitapi = base + "cmsapi/contactSubmit";
    var body = {
      "name": name,
      "email": email,
      "phone": phone,
      "subject": subject,
      "message": message,
      "seen": seen
    };
    var response = await http.post(Uri.parse(submitapi), body: body);
    print(response.body);
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      if (result["status"] == "success" &&
          result["message"] == "Successfully Created") {
        getSnackbar(message: "Data submitted successfully");
      } else {
        getSnackbar(
            bgColor: Colors.red.shade800, message: "Error posting data");
      }
    }
    // response type {
//   "status": "success",
//   "message": "Successfully Created"
// }
  }
}

final productrepo = ProductApi();
