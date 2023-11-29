import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:peruri_app/core/commons/constans.dart';

part 'counter_cubit.freezed.dart';
part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState.init());

  /// Add 1 to the current state.
  void increment() {
    int index = Random().nextInt(7);

    emit(state.copyWith(value: state.value + 1, color: Constants.chooseColor[index]));
  }

  /// Subtract 1 from the current state.
  void decrement() => emit(state.copyWith(value: state.value - 1));
}
