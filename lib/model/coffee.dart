import 'package:coffee_control/model/size_coffee.dart';
import 'package:coffee_control/model/type_coffee.dart';

class Coffee {

  const Coffee({required this.type, required this.size, required this.dateTime});

  final TypeCoffee type;
  final SizeCoffee size;
  final DateTime dateTime;

}