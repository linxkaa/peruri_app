import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:peruri_app/domain/core/form_failure.dart';
import 'package:peruri_app/domain/core/form_validator.dart';
import 'package:peruri_app/domain/to_do/to_do_history_entity.dart';

part 'to_do_entity.freezed.dart';
part 'to_do_entity.g.dart';

@freezed
class ToDoEntity with _$ToDoEntity {
  const ToDoEntity._();
  const factory ToDoEntity({
    required String text,
    required int id,
    required List<ToDoHistoryEntity> histories,
  }) = _ToDoEntity;

  factory ToDoEntity.empty() => const ToDoEntity(
        text: '',
        id: 0,
        histories: [],
      );

  Option<FormFailure> get failureOption {
    return FormValidator.emptyValidator(text).fold(
      (failure) => some(failure),
      (_) => none(),
    );
  }

  String? get textErrorMsg {
    return FormValidator.emptyValidator(text).fold(
      (failure) => failure.maybeWhen(
        orElse: () => null,
        empty: () => "To do must not be empty",
      ),
      (data) => null,
    );
  }

  List<ToDoHistoryEntity> updateHistory({
    required int id,
    required String text,
  }) {
    final newModel = [...histories];
    final newEntity = newModel.singleWhere((element) => element.id == id);
    final index = newModel.indexOf(newEntity);
    newModel[index] = newModel[index].copyWith(text: text);
    return newModel;
  }

  List<ToDoHistoryEntity> removeHistory(int id) {
    final newHistories = [...histories];

    newHistories.removeWhere((element) => element.id == id);

    return newHistories;
  }

  List<ToDoHistoryEntity> get newHistories {
    final calculationHistory = ToDoHistoryEntity.newEntity(
      text: text,
    );

    final newHistories = [...histories, calculationHistory];

    return newHistories;
  }

  ToDoHistoryEntity restoreHistory(int id) {
    final history = histories.firstWhere((element) => element.id == id);

    return history;
  }

  factory ToDoEntity.fromJson(Map<String, dynamic> json) => _$ToDoEntityFromJson(json);
}
