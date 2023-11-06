import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:peruri_app/domain/core/app_failure.dart';
import 'package:peruri_app/domain/news/home/i_home_repository.dart';
import 'package:peruri_app/infrastructure/common/dtos/article_model.dart';
import 'package:peruri_app/infrastructure/news/data_source/home_data_source.dart';

@LazySingleton(as: IHomeRepository)
class HomeRepository implements IHomeRepository {
  final HomeDataSource _dataSource;

  HomeRepository(this._dataSource);

  @override
  Future<Either<AppFailure, List<ArticleModel>>> getTopStories(String section) async {
    try {
      final response = await _dataSource.getTopStories(section);
      return right(response);
    } catch (e) {
      return left(AppFailure.fromServerSide(e.toString()));
    }
  }

  @override
  Future<Either<AppFailure, List<ArticleModel>>> getMostPopular() async {
    try {
      final response = await _dataSource.getMostPopular();
      return right(response);
    } catch (e) {
      return left(AppFailure.fromServerSide(e.toString()));
    }
  }
}
