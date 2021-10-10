import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tul_proyect/pages/homePage.dart';

void main()  {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();  
    return MaterialApp(
      title: 'Material App',
      home: HomePage()
    );
  }
}