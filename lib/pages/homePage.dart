import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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
        body: Center(
           child:  Text("xxx") ,
        ),
    );
  }
}