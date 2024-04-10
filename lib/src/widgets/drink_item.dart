import 'package:drink_calculator/src/model/drink.dart';
import 'package:flutter/material.dart';

class DrinkItem extends StatelessWidget {
  final Drink drink;
  final Widget? trailing;

  const DrinkItem({super.key, required this.drink, this.trailing});
  
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('${drink.name} - ${drink.alcoholContent}%'),
      subtitle: Text('${drink.volume.toString()} L - ${drink.price.toString()} zł'),
      trailing: trailing,
    );
  }
}