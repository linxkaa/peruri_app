import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'to_do_history_entity.freezed.dart';
part 'to_do_history_entity.g.dart';

@freezed
class ToDoHistoryEntity with _$ToDoHistoryEntity {
  const ToDoHistoryEntity._();
  const factory ToDoHistoryEntity({
    required int id,
    required String text,
  }) = _ToDoHistoryEntity;

  factory ToDoHistoryEntity.newEntity({
    required String text,
  }) =>
      ToDoHistoryEntity(
        id: Random().nextInt(1000),
        text: text,
      );

  factory ToDoHistoryEntity.empty() => const ToDoHistoryEntity(
        id: 0,
        text: '',
      );

  factory ToDoHistoryEntity.fromJson(Map<String, dynamic> json) => _$ToDoHistoryEntityFromJson(json);
}
