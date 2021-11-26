import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khetipati/controllers/cart_controller.dart';
import 'package:khetipati/models/product.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);
  final CartController cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      CartProducts(),
      CartTotal(),
    ]));
  }
}

class CartProducts extends StatelessWidget {
  final CartController controller = Get.find();

  CartProducts({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () => controller.products.isBlank
            ? const Center(
                child: Text("No cart items"),
              )
            : ListView.separated(
                itemCount: controller.products.length,
                itemBuilder: (_, int index) {
                  return CartProductCard(
                    controller: controller,
                    product: controller.products.keys.toList()[index],
                    index: index,
                    quantity: controller.products.values.toList()[index],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Container(
                    width: double.infinity,
                    height: 1,
                    margin: const EdgeInsets.all(20),
                    color: Colors.grey,
                  );
                },
              ),
      ),
    );
  }
}

class CartProductCard extends StatelessWidget {
  const CartProductCard(
      {Key? key,
      required this.controller,
      required this.product,
      required this.quantity,
      required this.index})
      : super(key: key);
  final CartController controller;
  final Product product;
  final int quantity;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Flexible(
              child: Image.network(
            product.featureImage!.originalImage.toString(),
            width: 80,
          )),
          Text(product.title.toString()),
          Column(children: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                controller.addProduct(product);
              },
            ),
            Text(quantity.toString()),
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {
                controller.removeProduct(product);
              },
            ),
          ])
        ],
      ),
    );
  }
}

class CartTotal extends StatelessWidget {
  CartTotal({Key? key}) : super(key: key);
  final CartController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Total",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              "${controller.total}",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
