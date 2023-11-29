import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:peruri_app/domain/calculator/history_entity.dart';
import 'package:peruri_app/domain/core/form_failure.dart';
import 'package:peruri_app/domain/core/form_validator.dart';

part 'calculator_entity.freezed.dart';

@freezed
class CalculatorEntity with _$CalculatorEntity {
  const CalculatorEntity._();
  const factory CalculatorEntity({
    required double value,
    required String leftForm,
    required String rightForm,
    required CalculatorType type,
    required List<HistoryEntity> histories,
  }) = _CalculatorEntity;

  factory CalculatorEntity.empty() => const CalculatorEntity(
        value: 0,
        leftForm: "",
        rightForm: "",
        type: CalculatorType.none(),
        histories: [],
      );

  Option<FormFailure> get failureOption {
    return FormValidator.emptyValidator(leftForm)
        .andThen(() => type == const CalculatorType.pangkat() ? right(unit) : FormValidator.emptyValidator(rightForm))
        .andThen(() => FormValidator.customValidator(validator: rightFormCannotBeDividedBy0))
        .fold(
          (failure) => some(failure),
          (_) => none(),
        );
  }

  String? get emptyLeftErrorMessages {
    return FormValidator.emptyValidator(leftForm).fold(
      (failure) => failure.maybeMap(
        orElse: () => null,
        empty: (_) => "Left form must not be empty",
      ),
      (data) => null,
    );
  }

  String? get emptyRightErrorMessages {
    return FormValidator.emptyValidator(rightForm).fold(
      (failure) => failure.maybeMap(
        orElse: () => null,
        empty: (_) => "Right form must not be empty",
      ),
      (data) => zeroRightErrorMsg,
    );
  }

  String? get zeroRightErrorMsg => FormValidator.customValidator(validator: rightFormCannotBeDividedBy0).fold(
        (failure) => failure.maybeWhen(
          orElse: () => null,
          costumError: () => 'Cannot be divided by zero',
        ),
        (r) => null,
      );

  bool get rightFormCannotBeDividedBy0 => int.parse(rightForm) == 0 && type == const CalculatorType.divide();

  HistoryEntity restoreHistory(int id) {
    final history = histories.firstWhere((element) => element.id == id);

    return history;
  }

  List<HistoryEntity> removeHistory(int id) {
    final newHistories = [...histories];

    newHistories.removeWhere((element) => element.id == id);

    return newHistories;
  }

  // * For converting value in History table & re-apply to the left & right form
  String get convertValue {
    RegExp regex = RegExp(r'([.]*0)(?!.*\d)');

    final valueSplitted = value.toString().split('.');

    if (valueSplitted[1].length == 1) {
      return value.toString().replaceAll(regex, '');
    }

    return value.toStringAsFixed(2).replaceAll(regex, '');
  }

  bool get isAlreadyExistInHistories {
    var newHistories = [...histories];

    var isFound = newHistories.any(
      (element) => element.leftValue == leftForm && element.type == type && element.rightValue == rightForm,
    );

    return isFound;
  }

  List<HistoryEntity> get newHistories {
    final calculationHistory = HistoryEntity.newEntity(
      leftValue: leftForm,
      rightValue: rightForm,
      type: type,
    );

    if (!isAlreadyExistInHistories) {
      final newHistories = [...histories, calculationHistory];
      return newHistories;
    }

    return histories;
  }

  double get addMethod {
    return double.parse(leftForm) + double.parse(rightForm);
  }

  double get powMethod {
    return double.parse(leftForm) * double.parse(leftForm);
  }
}

@freezed
class CalculatorType with _$CalculatorType {
  const factory CalculatorType.none() = _None;
  const factory CalculatorType.add() = _Add;
  const factory CalculatorType.substract() = _Substract;
  const factory CalculatorType.multiply() = _Multiply;
  const factory CalculatorType.divide() = _Divide;
  const factory CalculatorType.pangkat() = _Pangkat;
}
