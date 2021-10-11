import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tul_proyect/blocs/homeBloc/bloc/addnewprooduct_bloc.dart';

class WidgetProductCart extends StatefulWidget {

  final String nombre;
  final int cantidad ;
  final int idProducto ;
  final String sku;
  final String descripcion;

  WidgetProductCart({Key? key,
   required this.nombre,
   required this.cantidad,
   required this.idProducto , 
   required this.sku ,
   required this.descripcion  
    }) : super(key: key);

  @override
  _WidgetProductCartState createState() => _WidgetProductCartState();
}

class _WidgetProductCartState extends State<WidgetProductCart> {
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
                        Text('Producto: ${ widget.nombre }'),
                        Text('Cantidad: ${ widget.cantidad }'),
                      ],
                    ),
                 ),
                 Column(
                    children: [
                        IconButton(onPressed: (){

                          bloc.add( AddNewProductEvent (
                              id: widget.idProducto,
                              nombre: widget.nombre,
                              sku: widget.sku,
                              descripcion: widget.descripcion,
                            )) ;                            

                        }, icon:  Icon( Icons.add ) ), 
                        SizedBox( height: 10, ),
                        IconButton(onPressed: (){

                          bloc.add(
                            RemoveProductEvent (
                              id: widget.idProducto,
                             )
                          );    

                        }, icon:  Icon( Icons.remove ) ), 
                        SizedBox(),
                        IconButton(onPressed: (){

                              bloc.add(
                                  DeleteProductEvent (
                                    id: widget.idProducto,
                                  )
                              );

                        }, icon:  Icon( Icons.delete ) ), 
                    ],
                 ),
                 
             ],
          )
        ),
      ),
    );
  }
}