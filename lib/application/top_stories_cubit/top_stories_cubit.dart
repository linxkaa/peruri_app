import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:peruri_app/domain/core/app_failure.dart';
import 'package:peruri_app/domain/news/i_news_repository.dart';
import 'package:peruri_app/infrastructure/common/dtos/article_model.dart';

part 'top_stories_cubit.freezed.dart';
part 'top_stories_state.dart';

@injectable
class TopStoriesCubit extends Cubit<TopStoriesState> {
  final INewsRepository _repository;
  TopStoriesCubit(this._repository) : super(TopStoriesState.init());

  void getTopStories(String section) async {
    emit(state.unmodified.copyWith(isLoading: true));
    Either<AppFailure, List<ArticleModel>> response = await _repository.getTopStories(section);
    emit(state.unmodified.copyWith(failureOrSucceed: optionOf(response)));
  }
}
