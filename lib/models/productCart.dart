

import 'package:tul_proyect/models/cart.dart';
import 'package:tul_proyect/models/products.dart';

class ProductCart {

     final List<Product> productsSelected;
     final Cart cart;

      ProductCart({  required this.productsSelected, required  this.cart}); 
      
      ProductCart copyWith({List<Product>? productsSelected, Cart? cart}) {
        return ProductCart(
          productsSelected: productsSelected ?? this.productsSelected,
          cart: cart ?? this.cart,
        );
      }

      factory ProductCart.fromJson(Map<String, dynamic> json) {
        return ProductCart(
          productsSelected: json['productsSelected'],
          cart: json['cart'],
        );
      }

      Map<String, dynamic> toJson() {
        return {
          'productsSelected': productsSelected,
          'cart': cart,
        };
      }


}