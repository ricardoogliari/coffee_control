import 'package:coffee_control/controller/coffees_model.dart';
import 'package:coffee_control/controller/input_coffee_model.dart';
import 'package:coffee_control/model/coffee.dart';
import 'package:coffee_control/model/size_coffee.dart';
import 'package:coffee_control/model/type_coffee.dart';
import 'package:coffee_control/screens/list_coffees.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InputCoffee extends StatefulWidget {
  const InputCoffee({Key? key}) : super(key: key);

  @override
  State<InputCoffee> createState() => _InputCoffeeState();
}

class _InputCoffeeState extends State<InputCoffee> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Coffee")),
      body: Column(
        children: [
          Card(
            child: Consumer<CoffeesModel>(
                builder: (context, model, child) {
                  if (model.coffees.isNotEmpty){
                    return ListTile(
                      title: Text("${model.coffees.length} coffee(s)"),
                      subtitle: Text(model.totalQtdCoffee()),
                      leading: Text(model.lastCoffee()),
                    );
                  } else {
                    return const ListTile(
                      title: Text("No coffees at this moment! Let's go!"),
                    );
                  }
                },
            ),
          ),
          Expanded(
            child: Card(
              child: Consumer<InputCoffeeModel>(
                builder: (context, model, child) => Stepper(
                  currentStep: model.index,
                  controlsBuilder: (BuildContext context, ControlsDetails details) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 24.0, bottom: 0),
                      child: Row(
                        children: [
                          OutlinedButton(
                            onPressed: details.onStepContinue,
                            child: Text(model.index == 0 ? 'NEXT' : 'SAVE'),
                          ),
                          const SizedBox(width: 10),
                          if (model.index > 0) OutlinedButton(
                            onPressed: details.onStepCancel,
                            child: const Text('CANCEL'),
                          )
                        ],
                      ),
                    );
                  },
                  onStepCancel: () {
                    if (model.index > 0) {
                      model.previousStep();
                    }
                  },
                  onStepContinue: () {
                    if (model.index == 0) {
                      if (model.typeCoffeeSelected != null) {
                        model.nextStep();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(selectTypeSnack);
                      }
                    } else {
                      if (model.sizeCoffeeSelected != null) {
                        Provider.of<CoffeesModel>(context, listen: false).add(
                            Coffee(
                                type: model.typeCoffeeSelected ?? TypeCoffee(name: ""),
                                size: model.sizeCoffeeSelected ?? SizeCoffee(size: 10),
                                dateTime: DateTime.now()
                            )
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(selectSizeSnack);
                      }
                    }
                  },
                  steps: <Step>[
                    Step(
                      title: const Text("Select the coffee's type!"),
                      content: Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: coffeeTypes(model),
                      ),
                    ),
                    Step(
                      title: const Text("Select the coffee's size!"),
                      content: Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: coffeeSizes(model),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ListCoffees()),
                        );
                      },
                      child: const Text("View")),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Provider.of<CoffeesModel>(context, listen: false).clear();
                      },
                      child: const Text("Clear")),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> coffeeTypes(InputCoffeeModel model) {
    return model.coffeeTypes.map((element) => FilterChip(
      label: Text(element.name),
      selected: element.selected,
      onSelected: (value) {
        model.selectTypeOfCoffe(element);
      },
    )).toList();
  }

  List<Widget> coffeeSizes(InputCoffeeModel model) {
    return model.sizeCoffees.map((element) => FilterChip(
      label: Text("${element.size}ml"),
      selected: element.selected,
      onSelected: (value) {
        model.selectSizeOfCoffe(element);
      },
    )).toList();
  }

  var selectTypeSnack = const SnackBar(
    content: Text("Select the coffee's type!"),
    duration: Duration(seconds: 3),
  );

  var selectSizeSnack = const SnackBar(
    content: Text("Select the coffee's size!"),
    duration: Duration(seconds: 3),
  );

}
