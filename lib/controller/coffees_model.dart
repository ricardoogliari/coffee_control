import 'dart:collection';

import 'package:coffee_control/model/coffee.dart';
import 'package:flutter/material.dart';

class CoffeesModel extends ChangeNotifier{

  final List<Coffee> _coffees = [];
  UnmodifiableListView<Coffee> get coffees => UnmodifiableListView(_coffees);


  void add(Coffee item) {
    _coffees.add(item);
    notifyListeners();
  }

  void clear(){
    _coffees.clear();
    notifyListeners();
  }

  String lastCoffee(){
    DateTime lastDateTime = _coffees.last.dateTime;
    int hour = lastDateTime.hour;
    int minute = lastDateTime.minute;
    String hourStr = hour < 10 ?  "0$hour" : "$hour";
    String minuteStr = minute < 10 ?  "0$minute" : "$minute";
    return "$hourStr:$minuteStr";
  }

  String hourCoffee(int index){
    DateTime lastDateTime = _coffees[index].dateTime;
    int hour = lastDateTime.hour;
    int minute = lastDateTime.minute;
    String hourStr = hour < 10 ?  "0$hour" : "$hour";
    String minuteStr = minute < 10 ?  "0$minute" : "$minute";
    return "$hourStr:$minuteStr";
  }

  String totalQtdCoffee(){
    int total = 0;
    for (var element in _coffees) { total += element.size.size; }

    return "${total}ml";
  }

}