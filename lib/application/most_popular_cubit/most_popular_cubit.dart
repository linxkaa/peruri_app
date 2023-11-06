import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:peruri_app/domain/core/app_failure.dart';
import 'package:peruri_app/domain/news/home/i_home_repository.dart';
import 'package:peruri_app/infrastructure/common/dtos/article_model.dart';

part 'most_popular_cubit.freezed.dart';
part 'most_popular_state.dart';

@injectable
class MostPopularCubit extends Cubit<MostPopularState> {
  final IHomeRepository _repository;
  MostPopularCubit(this._repository) : super(MostPopularState.init());

  void getMostPopular() async {
    emit(state.unmodified.copyWith(isLoading: true));
    Either<AppFailure, List<ArticleModel>> response = await _repository.getMostPopular();
    emit(state.unmodified.copyWith(failureOrSucceed: optionOf(response)));
  }
}
