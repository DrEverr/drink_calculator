import 'dart:developer';

import 'package:drink_calculator/src/bloc/drink_calculator_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(
    BlocProvider(
      create: (context) => DrinkCalculatorBloc(),
      child: const DrinkCalculatorApp(),
    )
  );
}

class MyBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    log(event.toString());
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    log(transition.toString());
    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log(error.toString());
    super.onError(bloc, error, stackTrace);
  }
}
