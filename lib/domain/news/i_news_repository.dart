import 'package:fpdart/fpdart.dart';
import 'package:peruri_app/domain/core/app_failure.dart';
import 'package:peruri_app/infrastructure/common/dtos/article_model.dart';

abstract class INewsRepository {
  Future<Either<AppFailure, List<ArticleModel>>> getTopStories(String section);
  Future<Either<AppFailure, List<ArticleModel>>> getMostPopular();
}
