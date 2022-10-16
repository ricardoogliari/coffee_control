import 'package:coffee_control/controller/coffees_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListCoffees extends StatelessWidget {
  const ListCoffees({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Coffee")),
      body: Consumer<CoffeesModel>(
        builder: (context, model, child) => ListView.separated(
          itemCount: model.coffees.length,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) => ListTile(
            leading: Text(model.hourCoffee(index)),
            title: Text(model.coffees[index].type.name),
            subtitle: Text("${model.coffees[index].size.size}ml"),
          ),
        ),
      )
    );
  }
}
