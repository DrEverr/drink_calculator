import 'package:drink_calculator/src/blocs/drink_calculator_bloc.dart';
import 'package:drink_calculator/src/models/drink.dart';
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
      (name, alcoholContent, volume, volumeUnit, price, priceUnit) {
        context.read<DrinkCalculatorBloc>().add(DrinkAdd(
          drink: Drink(
            id: DateTime.now().millisecondsSinceEpoch,
            name: name,
            alcoholContent: alcoholContent,
            volume: volume,
            volumeUnit: volumeUnit,
            price: price,
            priceUnit: priceUnit,
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
            icon: const Icon(Icons.help),
            tooltip: 'Pomoc',
            onPressed: () {
              Navigator.of(context).pushNamed('/help');
            },
          ),
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
          if (state is DrinkLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Napoje: ${state.drinks.length}',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Wartość',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete_forever),
                          color: Theme.of(context).colorScheme.error,
                          iconSize: 32.0,
                          tooltip: 'Wyczyść',
                          onPressed: () {
                            BlocProvider.of<DrinkCalculatorBloc>(context).add(const DrinkClear());
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded (
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.drinks.length,
                  itemBuilder: (context, index) {
                    final drink = state.drinks[index];
                    return DrinkItem(drink: drink, tileColor: index.isEven ? Theme.of(context).colorScheme.secondary.withAlpha(0x10) : null);
                  },
                ),
              ),
            ],
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