part of 'calculator_cubit.dart';

@freezed
class CalculatorState with _$CalculatorState {
  const factory CalculatorState({
    required CalculatorEntity model,
    required bool showError,
    required bool isPressed,
  }) = _CalculatorState;

  const CalculatorState._();

  factory CalculatorState.empty() => CalculatorState(
        isPressed: false,
        model: CalculatorEntity.empty(),
        showError: false,
      );

  CalculatorState get unmodified => copyWith(
        isPressed: false,
      );

  bool choosenType(CalculatorType type) {
    return type == model.type;
  }

  bool get typeNotChoosen => model.type == const CalculatorType.none();

  String get displayValue => !isPressed ? '...' : model.convertValue;

  String? get showErrorMsg {
    if (!showError) return null;

    if (model.emptyLeftErrorMessages == null) {
      return model.emptyRightErrorMessages;
    }

    return model.emptyLeftErrorMessages;
  }

  String equationText(CalculatorType type) {
    return type.when(
      none: () => '',
      divide: () => '/',
      add: () => '+',
      substract: () => '-',
      multiply: () => 'x',
      pangkat: () => '^',
    );
  }

  String historyText(HistoryEntity entity) {
    final equation = equationText(entity.type);
    return '${entity.leftValue} $equation ${entity.rightValue}';
  }
}
