import 'package:equatable/equatable.dart';

class Drink implements Equatable {
  final String name;
  final double alcoholContent;
  final double volume;
  final String volumeUnit;
  final double price;
  final String priceUnit;

  Drink({
    required this.name,
    required this.alcoholContent,
    required this.volume,
    this.volumeUnit = 'l',
    required this.price,
    this.priceUnit = 'zł',
  });

  double get worthIndex => (alcoholContent * volume) / price;

  Drink copyWith({
    String? name,
    double? alcoholContent,
    double? volume,
    String? volumeUnit,
    double? price,
    String? priceUnit,
  }) {
    return Drink(
      name: name ?? this.name,
      alcoholContent: alcoholContent ?? this.alcoholContent,
      volume: volume ?? this.volume,
      volumeUnit: volumeUnit ?? this.volumeUnit,
      price: price ?? this.price,
      priceUnit: priceUnit ?? this.priceUnit,
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