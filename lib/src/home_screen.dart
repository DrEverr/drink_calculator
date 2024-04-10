import 'package:drink_calculator/src/bloc/drink_calculator_bloc.dart';
import 'package:drink_calculator/src/model/drink.dart';
import 'package:drink_calculator/src/widgets/drink_item.dart';
import 'package:drink_calculator/src/widgets/new_drink.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      body: BlocBuilder<DrinkCalculatorBloc, DrinkCalculatorState>(
        builder: (context, state) {
          if (state is DrinkFailure) {
            return Center(
              child: Text(
                'Błąd: ${state.message}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            );
          }
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
            builder: (context) {
              return NewDrinkDialog(
                (name, alcoholContent, volume, price) {
                  context.read<DrinkCalculatorBloc>().add(DrinkAdd(
                    drink: Drink(
                      name: name,
                      alcoholContent: alcoholContent,
                      volume: volume,
                      price: price,
                    ),
                  ));
                },
              );
            },
          );
        },
        tooltip: 'Dodaj napój',
        child: const Icon(Icons.add),
      ),
    );
  }
}