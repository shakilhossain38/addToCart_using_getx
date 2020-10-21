import 'package:get/state_manager.dart';
import 'package:cart_using_getx/models/product.dart';

class ShoppingController extends GetxController {
 var products= List<product>().obs;
 @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchProducts();
  }
  void fetchProducts() async{
   await Future.delayed(Duration(seconds: 1));
   var productResult = [
     product(
         id: 1,
         price: 30,
         productDescription: 'some description about product',
         productImage: 'abd',
         productName: 'FirstProd'),
     product(
         id: 2,
         price: 40,
         productDescription: 'some description about product',
         productImage: 'abd',
         productName: 'SecProd'),
     product(
         id: 3,
         price: 49.5,
         productDescription: 'some description about product',
         productImage: 'abd',
         productName: 'ThirdProd'),
   ];

   products.value = productResult;

  }

}