import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:khetipati/models/cagetories.dart';
import 'package:khetipati/models/order.dart';
import 'package:khetipati/models/product.dart';
import 'package:khetipati/models/user.dart';
import 'package:khetipati/utils/snackbar.dart';

class AppServices extends GetConnect {
  static const base = "http://192.168.10.67:8080/";
  static const productapi = base + "productapi/";

  static const categoryapi = base + "categoryapi/";
  static const userapi = base + "useapi/";
  static const contactapi = base + "cms/";
  static const orderapi = base + "orderapi/";

  ///login
  Future loginWithEmailandPassword(String email, String password) async {
    var body = {"email": "admin@gmail.com", "password": "testing1234"};

    try {
      var response =
          await http.post(Uri.parse(base + "userapi/login"), body: body);
      // print(response.body);
      var result = jsonDecode(response.body);
      var user = jsonDecode(response.body);
      print(user);
      if (response.statusCode == 200) {
        User currentuser = User.fromJson(user!["user"]);
        var token = user["token"];

        return [
          currentuser,
          token,
        ];
      } else {
        getSnackbar(
            message: "Incorrect Username or Password", bgColor: Colors.red);
        return null;
      }
    } catch (e) {
      getSnackbar(message: "Problem connecting server", bgColor: Colors.red);
    }
  }

  ///getall categories
  Future getAllCategories(String token) async {
    List<Category> categorylist = [];
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    try {
      var response = await http
          .get(Uri.parse(base + "categoryapi/allcategories"), headers: headers);

      if (response.body.isNotEmpty) {
        var responsedata = json.decode(response.body);

        var data = responsedata['data'];

        var categories = data['categories'];
        categories.forEach((v) {
          categorylist.add(Category.fromJson(v));
        });

        return categorylist;
      }
    } on PlatformException catch (e) {
      getSnackbar(message: e.message.toString());
    }
  }

  //getAllProduct
  Future getAllProducts(String token) async {
    List<Product> productlist = [];
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    try {
      var response = await http.get(Uri.parse(base + "productapi/allproduct"),
          headers: headers);

      var data = jsonDecode(response.body);
      print(data);
      var products = data["data"];
      print(data);
      if (data.isNotEmpty) {
        products.forEach((v) {
          print(v);
          productlist.add(Product.fromJson(v));
        });
      } else {}
      print(productlist.length);
      return productlist;
    } catch (e) {
      print(e);
      return productlist;
    }
  }

  getOrderbyUserid(String id, String token) async {
    List<Order> orderlist = [];
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var response = await http
        .get(Uri.parse(base + "orderapi/getorderbyuserid/6"), headers: headers);
    var data = json.decode(response.body)['data'];
    print(data['singleOrder']);
    // if (data.isNotEmpty) {
    //   data.forEach((v) {
    //     print(v);
    //     orderlist.add(Order.fromJson(v));
    //   });
    //   print(orderlist.length);
    // } else {}
    print(response.body);
  }

  ///Order Submit
  Future orderSubmit(String token, List orderitems, String total) async {
    var headers = {
      'contentType': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var products = [
      {"product_id": "1", "price": "500", "quantity": "2"},
      {"product_id": "2", "price": "500", "quantity": "2"}
    ];
    var body = {
      "total_amount": total,
      "orderstatus_id": "1",
      "shipping_id": "1",
      "paymenttype_id": "1",
      "additionalnote": " You are alloted first order",
      "shippingprice": "111",
      "products": json.encode(orderitems)
    };
    // print(order);

    var response = await http.post(Uri.parse(base + "orderapi/ordersubmit"),
        body: body, headers: headers);
    print(response.body);
  }

  // contact submit
  Future contactSubmit(String name, String email, String phone, String subject,
      String message, String seen) async {
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
        return result;
      } else {
        getSnackbar(
            bgColor: Colors.red.shade800, message: "Error posting data");
      }
    }
  }

  ///submit Rating
  Future submitRating(String rating, String token) async {
    var headers = {
      'Authorization': 'Bearer $token',
    };
    var body = {
      "product_id": "1",
      "comment": "sdlksjkld",
      "rating": rating,
    };
    var response = await http.post(
        Uri.parse(
          base + "orderapi/ratingsubmit",
        ),
        body: body,
        headers: headers);
    print(response.body);
  }
}
