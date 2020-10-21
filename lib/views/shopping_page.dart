import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:cart_using_getx/controller/cart_controller.dart';
import 'package:cart_using_getx/controller/shopping_controller.dart';

class ShoppingPage extends StatelessWidget {
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal,
        floatingActionButton: FloatingActionButton.extended(
            onPressed: (){},
            backgroundColor: Colors.amber,
            icon: Icon(Icons.add_shopping_cart,
            color: Colors.black,
            ),


            label: GetX<CartController>(
              builder: (controller) {
                return Text(controller.count.toString(), style: TextStyle(fontSize: 24.0, color: Colors.white),);
              }
            ),


        ),
        body: SafeArea(

          child: Column(
            children: <Widget>[
              Expanded(
                child: GetX<ShoppingController>(builder: (controller) {
                  return ListView.builder(
                      itemCount: controller.products.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.all(12.0),
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          '${controller.products[index]
                                              .productName}',
                                          style: TextStyle(fontSize: 24.0),
                                        ),
                                        Text(
                                            '${controller.products[index]
                                                .productDescription}'),
                                      ],
                                    ),
                                    Text(
                                        '\$${controller.products[index]
                                            .price}'),
                                  ],
                                ),
                                RaisedButton(
                                  onPressed: () {
                                    cartController.addToCart(
                                        controller.products[index]);
                                  },
                                  color: Colors.blue,
                                  textColor: Colors.white,
                                  child: Text("Add to cart"),
                                )
                              ],
                            ),
                          ),
                        );
                      });
                }),
              ),
              GetX<CartController>(
                  builder: (controller) {
                    return Text(
                      "Total : \$ ${controller.totalPrice}",
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    );
                  }
              ),
              SizedBox(
                height: 100.06,
              )
            ],
          ),
        ));
  }
}
