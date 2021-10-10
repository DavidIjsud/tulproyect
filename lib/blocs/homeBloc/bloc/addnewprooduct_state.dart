part of 'addnewprooduct_bloc.dart';

@immutable
abstract class AddnewprooductState {}

class AddnewprooductInitial extends AddnewprooductState {

    final  ProductCart productCart;
    
    AddnewprooductInitial( { required this.productCart } );

}
