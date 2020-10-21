import 'package:get/state_manager.dart';

import 'package:cart_using_getx/models/product.dart';

class CartController extends GetxController{

  var cartItems= List<product>().obs;
  int get count=> cartItems.length;
  double get totalPrice => cartItems.fold(0, (sum,item ) => sum+item.price);
  addToCart(product product){
    cartItems.add(product);
  }
}