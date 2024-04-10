import 'package:drink_calculator/src/blocs/drink_calculator_bloc.dart';
import 'package:drink_calculator/src/models/drink.dart';
import 'package:drink_calculator/src/widgets/drink_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrinkItem extends StatelessWidget {
  final Drink drink;
  final Widget? trailing;

  const DrinkItem({super.key, required this.drink, this.trailing});

  Widget editDrink(BuildContext context) {
    return DrinkFormDialog(
      'Edytuj napój',
      'Zapisz',
      (name, alcoholContent, volume, volumeUnit, price, priceUnit) {
        context.read<DrinkCalculatorBloc>().add(DrinkUpdate(
          drink: drink.copyWith(
            name: name,
            alcoholContent: alcoholContent,
            volume: volume,
            volumeUnit: volumeUnit,
            price: price,
            priceUnit: priceUnit,
          ),
        ));
      },
      drink: drink,
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showDialog(
        context: context,
        barrierDismissible: false,
        builder: editDrink,
      ),
      child: ListTile(
        title: Text('${drink.name} - ${drink.alcoholContent}%'),
        subtitle: Text('${drink.volume.toStringAsFixed(2)} ${drink.volumeUnit} - ${drink.price.toStringAsFixed(2)} ${drink.priceUnit}'),
        trailing: SizedBox(
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
      ),
    );
  }
}