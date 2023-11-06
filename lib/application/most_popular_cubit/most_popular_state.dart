part of 'most_popular_cubit.dart';

@freezed
class MostPopularState with _$MostPopularState {
  const MostPopularState._();
  const factory MostPopularState({
    required Option<Either<AppFailure, List<ArticleModel>>> failureOrSucceed,
    required bool isLoading,
  }) = _MostPopularState;

  factory MostPopularState.init() => MostPopularState(
        failureOrSucceed: none(),
        isLoading: false,
      );

  MostPopularState get unmodified => copyWith(isLoading: false, failureOrSucceed: none());
}
