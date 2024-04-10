import 'package:bloc/bloc.dart';
import 'package:drink_calculator/src/data/database.dart';
import 'package:drink_calculator/src/models/drink.dart';
import 'package:equatable/equatable.dart';

part 'drink_calculator_event.dart';
part 'drink_calculator_state.dart';

class DrinkCalculatorBloc extends Bloc<DrinkCalculatorEvent, DrinkCalculatorState> {
  DrinkCalculatorBloc({required this.drinksStream}) : super(const DrinkInitial(drinks: [])) {
    on<DrinkAdd>(_onDrinkAdded);
    on<DrinkRemove>(_onDrinkRemoved);
    on<DrinkUpdate>(_onDrinkUpdated);
    on<DrinkCalculate>(_onDrinkCalculate);
  }

  final Stream<List<DrinkRow>> drinksStream;

  void _onDrinkAdded(DrinkAdd event, Emitter<DrinkCalculatorState> emit) {
    
    emit(DrinkSuccess(drinks: drinks));
  }

  void _onDrinkRemoved(DrinkRemove event, Emitter<DrinkCalculatorState> emit) {
    final List<Drink> drinks = List.from(state.drinks)..remove(event.drink);
    emit(DrinkSuccess(drinks: drinks));
  }

  void _onDrinkUpdated(DrinkUpdate event, Emitter<DrinkCalculatorState> emit) {
    try {
      final List<Drink> drinks = List.from(state.drinks)..[state.drinks.indexWhere((drink) => drink.id == event.drink.id)] = event.drink;
      emit(DrinkSuccess(drinks: drinks));
    } catch (e) {
      emit(DrinkFailure(message: e.toString(), drinks: state.drinks));
    }
  }

  void _onDrinkCalculate(DrinkCalculate event, Emitter<DrinkCalculatorState> emit) {
    final List<Drink> drinks = List.from(state.drinks)..sort((a, b) => b.worthIndex.compareTo(a.worthIndex));
    emit(DrinkSuccess(drinks: drinks));
  }
}