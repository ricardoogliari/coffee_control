import 'package:coffee_control/controller/coffees_model.dart';
import 'package:coffee_control/controller/input_coffee_model.dart';
import 'package:coffee_control/screens/input_coffee.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CoffeesModel()),
        ChangeNotifierProvider(create: (context) => InputCoffeeModel()),
      ],
      child: const MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const InputCoffee()
    );
  }
}