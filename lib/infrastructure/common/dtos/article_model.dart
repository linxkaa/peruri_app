import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:peruri_app/core/commons/constans.dart';

part 'article_model.freezed.dart';
part 'article_model.g.dart';

@freezed
class ArticleModel with _$ArticleModel {
  const ArticleModel._();
  factory ArticleModel({
    @JsonKey(name: 'short_url') required String id,
    required String title,
    required String byline,
    @JsonKey(fromJson: multimediaFromJson) required List<String> multimedia,
    required String publishedDate,
  }) = _ArticleModel;

  factory ArticleModel.fromMostPopular(Map<String, dynamic> json) => ArticleModel(
        id: json['id'].toString(),
        title: json['title'],
        byline: json['byline'],
        multimedia: (json['media'] as List).isEmpty ? [] : [json['media'][0]['media-metadata'][0]['url']],
        publishedDate: json['published_date'],
      );

  String get publishedDateConverted {
    if (publishedDate.contains('T')) {
      return publishedDate.split('T')[0];
    }
    return publishedDate;
  }

  String get multimediaConverted => multimedia.isEmpty
      ? Constants.dummyImg
      : multimedia[0].contains('https://static01.nyt.com/')
          ? multimedia[0]
          : 'https://static01.nyt.com/' + multimedia[0];

  factory ArticleModel.fromJson(Map<String, dynamic> json) => _$ArticleModelFromJson(json);
}

bool isListOfStrings(List<dynamic> list) {
  return list.every((element) => element is String);
}

List<String> multimediaFromJson(dynamic type) {
  if (isListOfStrings(type)) {
    return type;
  } else {
    List<Map<String, dynamic>> _type = type.cast<Map<String, dynamic>>();
    return _type.map((e) => e['url'] as String).toList();
  }
}
