import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tul_proyect/blocs/homeBloc/bloc/addnewprooduct_bloc.dart';
import 'package:tul_proyect/widgets/widgetProductCart.dart';

class CartPage extends StatefulWidget {
  CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        centerTitle: true,
      ),
      body: BlocBuilder<AddnewprooductBloc, NewProductState >(
        bloc: BlocProvider.of< AddnewprooductBloc >(context),
        builder:  ( _ , state ) {

            if( state.productCart.productsSelected.length == 0  ){
                return Center(
                  child: Text('No hay productos en el carrito'),
                );
            }

            return ListView.builder(
              itemCount: state.productCart.productsSelected.length,
              itemBuilder: ( _ , i ) {
                  return WidgetProductCart(
                      nombre:  state.productCart.productsSelected[i].nombre,
                      cantidad:  state.productCart.productsSelected[i].cantidadSolicitado,
                  );
              },
            );

        }
      )
    );
  }
}

//WidgetProductCart()