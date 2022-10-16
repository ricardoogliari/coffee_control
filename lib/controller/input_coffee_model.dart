import 'package:coffee_control/model/size_coffee.dart';
import 'package:coffee_control/model/type_coffee.dart';
import 'package:flutter/material.dart';

class InputCoffeeModel extends ChangeNotifier{

  int _index = 0;
  int get index => _index;

  TypeCoffee? _typeCoffeeSelected;
  TypeCoffee? get typeCoffeeSelected => _typeCoffeeSelected;

  SizeCoffee? _sizeCoffeeSelected;
  SizeCoffee? get sizeCoffeeSelected => _sizeCoffeeSelected;

  final List<TypeCoffee> _coffeeTypes = [
    TypeCoffee(name: "Americano"),
    TypeCoffee(name: "Árabe"),
    TypeCoffee(name: "Café com Leite"),
    TypeCoffee(name: "Café Latte"),
    TypeCoffee(name: "Cappuccino"),
    TypeCoffee(name: "Caribenho"),
    TypeCoffee(name: "Cortado"),
    TypeCoffee(name: "Duplo"),
    TypeCoffee(name: "Espresso"),
    TypeCoffee(name: "Espresso Panna"),
    TypeCoffee(name: "Hawaiano"),
    TypeCoffee(name: "Irlandês"),
    TypeCoffee(name: "Lágrima"),
    TypeCoffee(name: "Macchiato"),
    TypeCoffee(name: "Mocha"),
    TypeCoffee(name: "Pingado"),
  ];
  List<TypeCoffee> get coffeeTypes => _coffeeTypes;

  final List<SizeCoffee> _sizeCoffees = [
    SizeCoffee(size: 10),
    SizeCoffee(size: 20),
    SizeCoffee(size: 30),
    SizeCoffee(size: 40),
    SizeCoffee(size: 50),
    SizeCoffee(size: 60),
    SizeCoffee(size: 70),
    SizeCoffee(size: 80),
    SizeCoffee(size: 90),
    SizeCoffee(size: 100),
  ];
  List<SizeCoffee> get sizeCoffees => _sizeCoffees;

  void nextStep(){
    _index++;
    notifyListeners();
  }

  void previousStep(){
    _index--;
    notifyListeners();
  }

  void selectTypeOfCoffe(TypeCoffee selectedCoffee){
    _typeCoffeeSelected = selectedCoffee;
    for (var element in _coffeeTypes) {
      element.selected = element == selectedCoffee;
    }
    notifyListeners();
  }

  void selectSizeOfCoffe(SizeCoffee selectedCoffee){
    _sizeCoffeeSelected = selectedCoffee;
    for (var element in _sizeCoffees) {
      element.selected = element == selectedCoffee;
    }
    notifyListeners();
  }

}