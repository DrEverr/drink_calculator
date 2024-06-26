part of 'drink_calculator_bloc.dart';

sealed class DrinkCalculatorEvent extends Equatable {
  const DrinkCalculatorEvent();

  @override
  List<Object> get props => [];
}

class DrinkInit extends DrinkCalculatorEvent {
  const DrinkInit();
}

class DrinkAdd extends DrinkCalculatorEvent {
  final Drink drink;

  const DrinkAdd({required this.drink});
}

class DrinkRemove extends DrinkCalculatorEvent {
  final Drink drink;

  const DrinkRemove({required this.drink});
}

class DrinkUpdate extends DrinkCalculatorEvent {
  final Drink drink;

  const DrinkUpdate({required this.drink});
}

class DrinkCalculate extends DrinkCalculatorEvent {
  const DrinkCalculate();
}

class DrinkClear extends DrinkCalculatorEvent {
  const DrinkClear();
}

class DrinkShow extends DrinkCalculatorEvent {
  const DrinkShow();
}
