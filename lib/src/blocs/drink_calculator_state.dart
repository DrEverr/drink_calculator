part of 'drink_calculator_bloc.dart';

sealed class DrinkCalculatorState extends Equatable {
  final List<Drink> drinks;

  const DrinkCalculatorState({required this.drinks});
  
  @override
  List<Object> get props => [drinks];
}

final class DrinkInitial extends DrinkCalculatorState {
  const DrinkInitial({required super.drinks});
}

final class DrinkLoading extends DrinkCalculatorState {
  const DrinkLoading({required super.drinks});
}

final class DrinkSuccess extends DrinkCalculatorState {
  const DrinkSuccess({required super.drinks});
}

final class DrinkFailure extends DrinkCalculatorState {
  final String message;

  const DrinkFailure({required this.message, required super.drinks});

  @override
  List<Object> get props => [];
}
