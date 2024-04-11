import 'package:bloc/bloc.dart';
import 'package:drink_calculator/src/data/providers/database.dart';
import 'package:drink_calculator/src/models/drink.dart';
import 'package:equatable/equatable.dart';

part 'drink_calculator_event.dart';
part 'drink_calculator_state.dart';

class DrinkCalculatorBloc extends Bloc<DrinkCalculatorEvent, DrinkCalculatorState> {
  DrinkCalculatorBloc() :super(const DrinkInitial(drinks: [])){
    on<DrinkInit>(_onDrinkInit);
    on<DrinkAdd>(_onDrinkAdded);
    on<DrinkRemove>(_onDrinkRemoved);
    on<DrinkUpdate>(_onDrinkUpdated);
    on<DrinkCalculate>(_onDrinkCalculate);
    on<DrinkClear>(_onDrinkClear);
    on<DrinkShow>(_onDrinkShow);
  }

  void _onDrinkShow(DrinkShow event, Emitter<DrinkCalculatorState> emit) async {
    emit(DrinkLoading(drinks: state.drinks));
    try {
      final List<Drink> drinks = (await AppDatabase.instance.drinksDao.getAllDrinks()).map((row) => Drink.fromData(row)).toList();
      emit(DrinkSuccess(drinks: drinks));
    } catch (e) {
      emit(DrinkFailure(message: e.toString(), drinks: state.drinks));
    }
  }

  void _onDrinkInit(DrinkInit event, Emitter<DrinkCalculatorState> emit) async {
    add(const DrinkShow());
  }

  void _onDrinkAdded(DrinkAdd event, Emitter<DrinkCalculatorState> emit) async {
    AppDatabase.instance.drinksDao.insertDrink(event.drink.toCompanion());
    add(const DrinkShow());
  }

  void _onDrinkRemoved(DrinkRemove event, Emitter<DrinkCalculatorState> emit) async {
    AppDatabase.instance.drinksDao.deleteDrink(event.drink.toCompanion());
    add(const DrinkShow());
  }

  void _onDrinkUpdated(DrinkUpdate event, Emitter<DrinkCalculatorState> emit) async {
    AppDatabase.instance.drinksDao.updateDrink(event.drink.toCompanion());
    add(const DrinkShow());
  }

  void _onDrinkCalculate(DrinkCalculate event, Emitter<DrinkCalculatorState> emit) async {
    emit(DrinkLoading(drinks: state.drinks));
    try {
      final List<Drink> drinks = (await AppDatabase.instance.drinksDao.getAllDrinks()).map((row) => Drink.fromData(row)).toList();
      drinks.sort((a, b) => b.worthIndex.compareTo(a.worthIndex));
      emit(DrinkSuccess(drinks: drinks));
    } catch (e) {
      emit(DrinkFailure(message: e.toString(), drinks: state.drinks));
    }
  }

  void _onDrinkClear(DrinkClear event, Emitter<DrinkCalculatorState> emit) async {
    AppDatabase.instance.drinksDao.deleteAllDrinks();
    add(const DrinkShow());
  }
}
