import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:khetipati/models/cagetories.dart';
import 'package:khetipati/models/order.dart';
import 'package:khetipati/models/product.dart';
import 'package:khetipati/screens/login/login.dart';
import 'package:khetipati/utils/snackbar.dart';

class AppServices extends GetConnect {
  static const base = "http://192.168.10.67:8080/";
  static const productapi = base + "productapi/";

  static const categoryapi = base + "categoryapi/";
  static const userapi = base + "useapi/";
  static const contactapi = base + "cms/";
  static const orderapi = base + "orderapi/";

  ///login
  Future loginWithEmailandPassword() async {
    var body = {"email": "sudarshan@gmail.com", "password": "testing1234"};

    try {
      var response = await http.post(
          Uri.parse("http://192.168.10.67:8080/userapi/login"),
          body: body);

      var result = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return result;
      } else {
        getSnackbar(
            message: "Incorrect Username or Password", bgColor: Colors.red);
        return null;
      }
    } catch (e) {
      getSnackbar(message: "Problem connecting server", bgColor: Colors.red);
    }
  }

  Future register(String email, String password, String passwordConfirm,
      String firstname, String lastname, String phone) async {
    var body = {
      "email": email,
      "password": password,
      "password_confirm": passwordConfirm,
      "firstname": firstname,
      "lastname": lastname,
      "phone": phone,
    };

    var response = await http.post(
        Uri.parse("http://192.168.10.67:8080/userapi/register"),
        body: body);
    print(response.body);
    var data = jsonDecode(response.body);
    if (response.statusCode == 201) {
      getSnackbar(message: 'Registration success');
      Get.to(() => LoginPage());
      return data;
    } else {
      getSnackbar(message: data["message"], bgColor: Colors.red);
    }
    return data;
  }

  Future forgetpassword(String email) async {
    var body = {"email": email};

    var response = await http.post(Uri.parse(base + 'userapi/recoverypassword'),
        body: body);
    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      getSnackbar(message: data["message"]);
    } else {
      getSnackbar(message: data["message"], bgColor: Colors.red);
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
      var response = await http.get(
          Uri.parse("http://192.168.10.67:8080/categoryapi/allcategories"),
          headers: headers);

      if (response.body.isNotEmpty) {
        var responsedata = json.decode(response.body);

        var data = responsedata['data'];

        var categories = data['categories'];
        categories.forEach((v) {
          categorylist.add(Category.fromJson(v));
        });

        return categorylist;
      } else {
        return categoriesdata;
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
      var response = await http.get(
          Uri.parse("http://192.168.10.67:8080/productapi/allproduct"),
          headers: headers);

      var data = jsonDecode(response.body);
      var products = data["data"];
      print(data);
      if (data.isNotEmpty) {
        products.forEach((v) {
          print(v);
          productlist.add(Product.fromJson(v));
        });
      } else {
        return productdata;
      }
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
    var response = await get(
        "http://192.168.10.67:8080/orderapi/getorderbyuserid/${id}}",
        headers: headers);
    var data = Order.fromJson(response.body);

    // if (data.isNotEmpty) {
    //   data.forEach((v) {
    //     print(v);
    //     orderlist.add(Order.fromJson(v));
    //   });
    //   print(orderlist.length);
    // } else {}
    print(response.body['data']);
    return data;
  }

  getOrderbyCode(String token) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var response = await get(
        "http://192.168.10.67:8080/orderapi/getorderbycode/945602",
        headers: headers);
    //  http.get(
    //     Uri.parse("http://192.168.10.67:8080/orderapi/getorderbycode/945602"),
    //     headers: headers);
    var data = Order.fromJson(response.body);
    // print(data);
    return data;
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
    if (response.statusCode == 200) {
      getSnackbar(message: 'Order successful');
    } else {
      getSnackbar(message: 'Order unsuccesful', bgColor: Colors.red);
    }
  }

  // contact submit
  Future contactSubmit(String name, String email, String phone, String subject,
      String message, String seen) async {
    String submitapi = "http://192.168.10.67:8080/cmsapi/contactSubmit";
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
          "http://192.168.10.67:8080/orderapi/ratingsubmit",
        ),
        body: body,
        headers: headers);
    print(response.body);
  }

  Future shippingAddressSubmit(String token, String address) async {
    var headers = {
      'Authorization': 'Bearer $token',
    };
    var body = {
      "address": address,
      "phone": "234324",
      "region": "ktm",
      "area": "baneshowe",
      "city": "Kathmandu",
      "landmark": "1",
      "specialnote": "sdlksjkld",
      "name": "Asdfsadas",
    };

    var response = await http.post(
        Uri.parse("http://192.168.10.67:8080/orderapi/shippingaddresssubmit"),
        headers: headers,
        body: body);
    print(response.body);

    if (response.statusCode == 200) {
      getSnackbar(message: 'Address Saved');
    } else {
      getSnackbar(message: 'Invalid field', bgColor: Colors.red);
    }
  }
}
