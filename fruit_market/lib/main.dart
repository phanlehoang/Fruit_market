import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

import 'package:provider/provider.dart';

import 'mvvm/viewmodels/card_view_model.dart';
import 'mvvm/viewmodels/change_scr.dart';
import 'mvvm/views/screens/home.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ChangeScrNotifier()),
        ChangeNotifierProvider(create: (context) => CardProvider())
      ],
      child: GetMaterialApp(
        title: 'Fruit Market',
        theme: ThemeData(
            primaryColor: Colors.green,
            visualDensity: VisualDensity.adaptivePlatformDensity
        ),
        home: Home(),
        // home: Home_phone(),
        debugShowCheckedModeBanner: false,

      ),
    );
  }
}

