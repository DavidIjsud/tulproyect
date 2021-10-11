import 'package:flutter/material.dart';

class WidgetProductCart extends StatefulWidget {

  final String nombre;
  final int cantidad ;

  WidgetProductCart({Key? key, required this.nombre, required this.cantidad  }) : super(key: key);

  @override
  _WidgetProductCartState createState() => _WidgetProductCartState();
}

class _WidgetProductCartState extends State<WidgetProductCart> {
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
                        Text('Producto: ${ widget.nombre }'),
                        Text('Cantidad: ${ widget.cantidad }'),
                      ],
                    ),
                 ),
                 Column(
                    children: [
                        IconButton(onPressed: (){}, icon:  Icon( Icons.add ) ), 
                        SizedBox( height: 10, ),
                        IconButton(onPressed: (){}, icon:  Icon( Icons.remove ) ), 
                        SizedBox(),
                        IconButton(onPressed: (){}, icon:  Icon( Icons.delete ) ), 
                    ],
                 ),
                 
             ],
          )
        ),
      ),
    );
  }
}