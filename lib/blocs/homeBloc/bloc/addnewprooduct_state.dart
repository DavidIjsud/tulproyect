part of 'addnewprooduct_bloc.dart';


class NewProductState  {

    final  ProductCart productCart;
    
    NewProductState( { required this.productCart } );

    NewProductState copyWith( { ProductCart? productCart } ) {
        return NewProductState(
            productCart: productCart ?? this.productCart
        );
    }

}
