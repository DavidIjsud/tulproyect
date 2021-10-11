import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tul_proyect/blocs/homeBloc/bloc/addnewprooduct_bloc.dart';
import 'package:tul_proyect/pages/cartPage.dart';
import 'package:tul_proyect/pages/homePage.dart';

void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();  
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AddnewprooductBloc>(
          create: (context) => AddnewprooductBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: '/',
        routes: {
          '/': (BuildContext context) => HomePage(),
          'cart' : (BuildContext context) => CartPage(),
        },
      ),
    );
  }
}