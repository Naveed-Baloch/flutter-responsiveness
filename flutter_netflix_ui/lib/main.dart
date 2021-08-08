import 'package:flutter/material.dart';
import 'package:flutter_netflix_ui/provider/app_bar_controller.dart';
import 'package:provider/provider.dart';
import './screeens/screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Netflix UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: Colors.black),
      home: ChangeNotifierProvider.value(
        value: AppBarController(),
        child: NavScreen(),
      ),
    );
  }
}
