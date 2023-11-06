import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:peruri_app/domain/core/app_failure.dart';
import 'package:peruri_app/domain/news/i_news_repository.dart';
import 'package:peruri_app/infrastructure/common/dtos/article_model.dart';
import 'package:peruri_app/infrastructure/news/data_source/news_data_source.dart';

@LazySingleton(as: INewsRepository)
class NewsRepository implements INewsRepository {
  final NewsDataSource _dataSource;

  NewsRepository(this._dataSource);

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
