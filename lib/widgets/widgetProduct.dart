import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:tul_proyect/blocs/homeBloc/bloc/addnewprooduct_bloc.dart';

class WidgetProduct extends StatefulWidget {

  final int id ;
  final String nombre;
  final String sku;
  final String descripcion; 

  const WidgetProduct(
     {Key? key, 
     required this.id , 
     required this.nombre , 
     required this.sku , 
     required this.descripcion  
     }) : super(key: key);

  @override
  _WidgetProductState createState() => _WidgetProductState();
}

class _WidgetProductState extends State<WidgetProduct> {
  @override
  Widget build(BuildContext context) {

      AddnewprooductBloc bloc = context.read<AddnewprooductBloc>();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
                 Expanded(
                   child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('id: ${widget.id}'),
                        Text('nombre: ${widget.nombre}'),
                        Text('sku: ${widget.sku}'),
                        Text('descripcion: ${widget.descripcion}', overflow: TextOverflow.ellipsis , ),
                      ],
                    ),
                 ),
                 Column(
                    children: [
                        IconButton(onPressed: (){

                            bloc.add( AddNewProductEvent (
                              id: widget.id,
                              nombre: widget.nombre,
                              sku: widget.sku,
                              descripcion: widget.descripcion,
                            )) ;  

                        }, icon:  Icon( Icons.add ) ), 
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black38),
                            borderRadius: BorderRadius.circular(5)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric( horizontal: 10 ),
                            child: BlocBuilder< AddnewprooductBloc , NewProductState >(
                                 builder: ( _ , state ) {
                                    return Text(state.productCart.searchForProductCantidad( widget.id ).toString());
                                 },
                              ),
                          )),
                        IconButton(onPressed: (){
                            bloc.add(  RemoveProductEvent( id: widget.id )  );
                        }, icon:  Icon( Icons.remove ) ), 
                    ],
                 ),
                 
             ],
          )
        ),
      ),
    );
  }
}