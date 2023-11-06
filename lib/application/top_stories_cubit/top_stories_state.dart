part of 'top_stories_cubit.dart';

@freezed
class TopStoriesState with _$TopStoriesState {
  const TopStoriesState._();
  const factory TopStoriesState({
    required Option<Either<AppFailure, List<ArticleModel>>> failureOrSucceed,
    required bool isLoading,
  }) = _TopStoriesState;

  factory TopStoriesState.init() => TopStoriesState(
        failureOrSucceed: none(),
        isLoading: false,
      );

  TopStoriesState get unmodified => copyWith(isLoading: false, failureOrSucceed: none());
}
