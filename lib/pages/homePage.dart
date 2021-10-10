import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tul_proyect/widgets/widgetProduct.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  

  @override
  Widget build(BuildContext context) {
    CollectionReference  _products =  FirebaseFirestore.instance.collection('products');
    return Scaffold(
        appBar: AppBar(
          title: Text("Productos"),
          centerTitle: true,
          actions: [
              IconButton(
                onPressed: (){

                }, 
                icon: Icon(Icons.shopping_cart)
              )
          ],
        ),
        body: FutureBuilder<QuerySnapshot>(
          future :_products.get(),
          builder: ( _ , AsyncSnapshot<QuerySnapshot> asyncSnapshot ) {
               
             
                    if( asyncSnapshot.hasData ){
                      return   ListView.builder(
                              itemCount:  asyncSnapshot.data!.docs.length, 
                              itemBuilder: ( _ , i ) {
                                  return WidgetProduct(
                                     id:  asyncSnapshot.data!.docs[i].get('id'),
                                     nombre: asyncSnapshot.data!.docs[i].get('nombre'),
                                     sku: asyncSnapshot.data!.docs[i].get('sku'), 
                                     descripcion: asyncSnapshot.data!.docs[i].get('descripcion')
                                  );
                              }
                            );
                    }
               
                   return Center( child :  CircularProgressIndicator() );
          }
        )
      
    );
  }
}