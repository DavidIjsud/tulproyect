

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

    factory ProductCart.fromJson(Map<String, dynamic> json) => ProductCart(
        productsSelected: List<Product>.from(json["productsSelected"].map((x) => Product.fromJson(x))),
        cart: Cart.fromJson(json["cart"]),
    );


    Map<String, dynamic> toJson() => {
        "productsSelected": List<dynamic>.from(productsSelected.map((x) => x.toJson())),
        "cart": cart.toJson(),
    };


    int searchForProductCantidad(int productId) {
      for (int i = 0; i < productsSelected.length; i++) {

        if (productsSelected[i].id == productId) {
          return productsSelected[i].cantidadSolicitado;
        }
        
      }
      return 0;
    }


}