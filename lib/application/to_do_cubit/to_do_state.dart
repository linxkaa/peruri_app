part of 'to_do_cubit.dart';

@freezed
class ToDoState with _$ToDoState {
  const ToDoState._();
  const factory ToDoState({
    required ToDoEntity entity,
    required bool showError,
  }) = _ToDoState;

  factory ToDoState.initial() => ToDoState(
        showError: false,
        entity: ToDoEntity.empty(),
      );

  ToDoState get unmodified => copyWith(
        entity: entity.copyWith(id: 0),
      );

  String? get showTextError => showError ? entity.textErrorMsg : null;

  bool get newToDo => entity.id == 0;
}
