import 'package:injectable/injectable.dart';
import 'package:peruri_app/core/commons/api_path_constant.dart';
import 'package:peruri_app/infrastructure/common/dtos/article_model.dart';
import 'package:peruri_app/infrastructure/core/api_helper.dart';

@injectable
class HomeDataSource {
  final ApiHelper _helper;

  HomeDataSource(this._helper);

  Future<List<ArticleModel>> getTopStories(String section) async {
    final response = await _helper.get(path: ApiPathConstant.topStories(section));
    final rawList = response.data as List;
    final list = List.generate(rawList.length.clamp(0, 20), (i) => ArticleModel.fromJson(rawList[i]));
    return list;
  }

  Future<List<ArticleModel>> getMostPopular() async {
    final response = await _helper.get(path: ApiPathConstant.mostPopular);
    final rawList = response.data as List;
    final list = List.generate(rawList.length.clamp(0, 20), (i) => ArticleModel.fromMostPopular(rawList[i]));
    return list;
  }
}
