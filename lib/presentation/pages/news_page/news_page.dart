import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peruri_app/application/most_popular_cubit/most_popular_cubit.dart';
import 'package:peruri_app/core/commons/colors_const.dart';
import 'package:peruri_app/core/injection/injection.dart';
import 'package:peruri_app/core/routes/app_router.gr.dart';
import 'package:peruri_app/presentation/pages/news_page/widgets/headline_text.dart';
import 'package:peruri_app/presentation/widgets/atoms/text_theme_extension.dart';
import 'package:peruri_app/presentation/widgets/molecules/platform_app_bar.dart';
import 'package:peruri_app/presentation/widgets/organisms/news_card.dart';
import 'package:peruri_app/presentation/widgets/organisms/ui_helper.dart';

@RoutePage()
class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MostPopularCubit>()..getMostPopular(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: const PlatformAppBar(
              elevation: 0,
              title: Text('News App'),
            ),
            body: SingleChildScrollView(
              padding: UIHelper.padding(vertical: 10, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeadlineText(
                    title: 'Top Stories',
                    desc: 'Top stories from all time',
                  ),
                  UIHelper.verticalSpace(10),
                  InkWell(
                    onTap: () {
                      AutoRouter.of(context).push(const TopStoriesCategoriesRoute());
                    },
                    child: Container(
                      padding: UIHelper.padding(vertical: 10, horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: ColorConstant.primary),
                        borderRadius: UIHelper.borderRadiusCircular(all: 8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Go To Categories Section',
                            style: context.textTheme.labelSmall?.copyWith(
                              color: ColorConstant.primary,
                            ),
                          ),
                          Icon(
                            Icons.double_arrow_sharp,
                            size: UIHelper.setSp(20),
                            color: ColorConstant.primary,
                          ),
                        ],
                      ),
                    ),
                  ),
                  UIHelper.verticalSpace(20),
                  BlocBuilder<MostPopularCubit, MostPopularState>(
                    builder: (context, state) {
                      return state.failureOrSucceed.fold(
                        () => state.isLoading ? Center(child: UIHelper.loading()) : const SizedBox.shrink(),
                        (response) => response.fold(
                          (failure) => failure.when(
                            fromServerSide: (val) => Text(val),
                          ),
                          (response) => Column(
                            children: [
                              HeadlineText(
                                title: 'Most Popular Articles',
                                desc: 'Top articles from last week',
                                onTap: () {
                                  AutoRouter.of(context).push(MostPopularRoute(listArticles: response));
                                },
                              ),
                              UIHelper.verticalSpace(10),
                              Column(
                                children: List.generate(
                                  response.length.clamp(0, 3),
                                  (index) {
                                    final data = response[index];
                                    return Padding(
                                      padding: UIHelper.padding(bottom: 10),
                                      child: NewsCard(
                                        imgSrc: data.multimediaConverted,
                                        title: data.title,
                                        desc: '${data.byline} \u2022 ${data.publishedDateConverted}',
                                        onFavoriteTap: () {},
                                        isFavorited: false,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
