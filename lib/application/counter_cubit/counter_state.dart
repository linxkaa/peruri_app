part of 'counter_cubit.dart';

@freezed
class CounterState with _$CounterState {
  const factory CounterState({
    required int value,
    required Color color,
  }) = _CounterState;

  const CounterState._();

  factory CounterState.init() => const CounterState(
        value: 0,
        color: Colors.white,
      );
}
