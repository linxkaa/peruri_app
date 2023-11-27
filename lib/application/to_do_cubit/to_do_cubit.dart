import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:peruri_app/domain/to_do/to_do_entity.dart';

part 'to_do_cubit.freezed.dart';
part 'to_do_state.dart';

class ToDoCubit extends HydratedCubit<ToDoState> {
  late TextEditingController textController;

  void onControllerChange() {
    inputText(textController.text);
  }

  ToDoCubit() : super(ToDoState.initial()) {
    textController = TextEditingController()..addListener(onControllerChange);
  }

  void submit() {
    if (state.entity.failureOption.isNone()) {
      if (state.newToDo) {
        saveToHistories();
      } else {
        updateHistories();
      }
    } else {
      emit(state.unmodified.copyWith(showError: true));
    }
  }

  void restoreHistory(int id) {
    final entity = state.entity.restoreHistory(id);

    textController.removeListener(onControllerChange);

    textController.value = TextEditingValue(text: entity.text);

    textController.addListener(onControllerChange);

    emit(
      state.unmodified.copyWith.entity(
        text: entity.text,
        id: entity.id,
      ),
    );
  }

  void inputText(String val) {
    emit(state.copyWith.entity(text: val));
  }

  void removeHistory(int id) {
    emit(state.unmodified.copyWith.entity(histories: state.entity.removeHistory(id)));
  }

  void saveToHistories() {
    emit(
      state.unmodified.copyWith.entity(
        histories: state.entity.newHistories,
        text: textController.text,
      ),
    );
  }

  void updateHistories() {
    emit(
      state.unmodified.copyWith.entity(
        histories: state.entity.updateHistory(
          id: state.entity.id,
          text: state.entity.text,
        ),
      ),
    );
  }

  @override
  ToDoState? fromJson(Map<String, dynamic> json) {
    return ToDoState(
      entity: ToDoEntity.fromJson(json).copyWith(text: '', id: 0),
      showError: false,
    );
  }

  @override
  Map<String, dynamic>? toJson(ToDoState state) {
    return state.entity.toJson();
  }
}
