import 'package:drink_calculator/src/data/database.dart';
import 'package:equatable/equatable.dart';

class Drink implements Equatable {
  final int id;
  final String name;
  final double alcoholContent;
  final double volume;
  final String volumeUnit;
  final double price;
  final String priceUnit;

  Drink({
    this.id = 0,
    required this.name,
    required this.alcoholContent,
    required this.volume,
    this.volumeUnit = 'l',
    required this.price,
    this.priceUnit = 'zł',
  });

  double get volumeInLiters => volumeUnit == 'ml' ? volume / 1000 : volume;
  double get priceInZlotys => priceUnit == '€' ? price * 4.2 : price;
  double get worthIndex => (alcoholContent * volumeInLiters) / priceInZlotys;

  Drink copyWith({
    String? name,
    double? alcoholContent,
    double? volume,
    String? volumeUnit,
    double? price,
    String? priceUnit,
  }) {
    return Drink(
      id: id,
      name: name ?? this.name,
      alcoholContent: alcoholContent ?? this.alcoholContent,
      volume: volume ?? this.volume,
      volumeUnit: volumeUnit ?? this.volumeUnit,
      price: price ?? this.price,
      priceUnit: priceUnit ?? this.priceUnit,
    );
  }

  Drink fromDrinkRow(DrinkRow drinkRow) {
    return Drink(
      id: drinkRow.id,
      name: drinkRow.name,
      alcoholContent: drinkRow.alcoholContent,
      volume: drinkRow.volume,
      volumeUnit: drinkRow.volumeUnit,
      price: drinkRow.price,
      priceUnit: drinkRow.priceUnit,
    );
  }

  DrinkRow toDrinkRow() {
    return DrinkRowCompanion(
      name: name,
      alcoholContent: alcoholContent,
      volume: volume,
      volumeUnit: volumeUnit,
      price: price,
      priceUnit: priceUnit,
    );
  }

  @override
  List<Object?> get props => [name, alcoholContent, volume, volumeUnit, price, priceUnit];
  
  @override
  bool get stringify => true;

  @override
  String toString() {
    return '$name $volume$volumeUnit $alcoholContent %, $price $priceUnit => $worthIndex';
  }
}