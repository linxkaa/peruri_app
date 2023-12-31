import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:peruri_app/infrastructure/common/dtos/article_model.dart';
import 'package:peruri_app/presentation/widgets/molecules/platform_app_bar.dart';
import 'package:peruri_app/presentation/widgets/organisms/news_card.dart';
import 'package:peruri_app/presentation/widgets/organisms/ui_helper.dart';

@RoutePage()
class MostPopularPage extends StatelessWidget {
  final List<ArticleModel> listArticles;
  const MostPopularPage({
    super.key,
    required this.listArticles,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PlatformAppBar(
        elevation: 0,
        title: const Text('Most Popular Articles'),
        leading: IconButton(
          onPressed: () {
            AutoRouter.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: SingleChildScrollView(
        padding: UIHelper.padding(horizontal: 20),
        child: Column(
          children: listArticles
              .map(
                (data) => Padding(
                  padding: UIHelper.padding(bottom: 10),
                  child: NewsCard(
                    imgSrc: data.multimediaConverted,
                    title: data.title,
                    desc: '${data.byline} \u2022 ${data.publishedDateConverted}',
                    onFavoriteTap: () {},
                    isFavorited: false,
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
