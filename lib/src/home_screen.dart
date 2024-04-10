import 'package:drink_calculator/src/bloc/drink_calculator_bloc.dart';
import 'package:drink_calculator/src/model/drink.dart';
import 'package:drink_calculator/src/widgets/drink_item.dart';
import 'package:drink_calculator/src/widgets/drink_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget addDrink(BuildContext context) {
    return DrinkFormDialog(
      'Dodaj napój',
      'Dodaj',
      (name, alcoholContent, volume, price) {
        context.read<DrinkCalculatorBloc>().add(DrinkAdd(
          drink: Drink(
            id: DateTime.now().millisecondsSinceEpoch,
            name: name,
            alcoholContent: alcoholContent,
            volume: volume,
            price: price,
          ),
        ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.calculate),
            tooltip: 'Oblicz',
            onPressed: () {
              BlocProvider.of<DrinkCalculatorBloc>(context).add(const DrinkCalculate());
            },
          ),
        ],
      ),
      body: BlocConsumer<DrinkCalculatorBloc, DrinkCalculatorState>(
        listener: (context, state) {
          if (state is DrinkFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Theme.of(context).colorScheme.error,
              ),
            );
          }
        },
        builder: (context, state) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.drinks.length,
            itemBuilder: (context, index) {
              final drink = state.drinks[index];
              return DrinkItem(
                drink: drink,
                trailing: 
                SizedBox(
                  width: 150.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(drink.worthIndex.toStringAsFixed(2), style: Theme.of(context).textTheme.headlineMedium,),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          context.read<DrinkCalculatorBloc>().add(DrinkRemove(drink: drink));
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: addDrink,
          );
        },
        tooltip: 'Dodaj napój',
        child: const Icon(Icons.add),
      ),
    );
  }
}