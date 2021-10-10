

import 'package:flutter/material.dart';

class WidgetProduct extends StatelessWidget {

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
  Widget build(BuildContext context) {
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
                        Text('id: $id'),
                        Text('nombre: $nombre'),
                        Text('sku: $sku'),
                        Text('descripcion: $descripcion', overflow: TextOverflow.ellipsis , ),
                      ],
                    ),
                 ),
                 IconButton(onPressed: (){}, icon:  Icon( Icons.add ) ) 
             ],
          )
        ),
      ),
    );
  }

}