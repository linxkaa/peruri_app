import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peruri_app/application/top_stories_cubit/top_stories_cubit.dart';
import 'package:peruri_app/core/commons/colors_const.dart';
import 'package:peruri_app/core/injection/injection.dart';
import 'package:peruri_app/presentation/widgets/atoms/text_theme_extension.dart';
import 'package:peruri_app/presentation/widgets/molecules/platform_app_bar.dart';
import 'package:peruri_app/presentation/widgets/organisms/news_card.dart';
import 'package:peruri_app/presentation/widgets/organisms/ui_helper.dart';

@RoutePage()
class TopStoriesPage extends StatelessWidget {
  final String section;
  const TopStoriesPage({
    super.key,
    required this.section,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<TopStoriesCubit>()..getTopStories(section),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: PlatformAppBar(
              elevation: 0,
              title: const Text('Top Stories'),
              leading: IconButton(
                onPressed: () {
                  AutoRouter.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
              ),
            ),
            body: SingleChildScrollView(
              padding: UIHelper.padding(vertical: 10, horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'SECTION:',
                        style: context.textTheme.headlineSmall?.copyWith(
                          color: ColorConstant.grey,
                        ),
                      ),
                      Text(
                        section.toUpperCase(),
                        style: context.textTheme.headlineSmall?.copyWith(
                          color: ColorConstant.primary,
                        ),
                      ),
                    ],
                  ),
                  UIHelper.verticalSpace(20),
                  BlocBuilder<TopStoriesCubit, TopStoriesState>(
                    builder: (context, state) {
                      return state.failureOrSucceed.fold(
                        () => state.isLoading ? UIHelper.loading() : const SizedBox.shrink(),
                        (response) => response.fold(
                          (failure) => failure.when(
                            fromServerSide: (val) => Text(val),
                          ),
                          (data) => Column(
                            children: List.generate(
                              data.length.clamp(0, 3),
                              (index) {
                                final _data = data[index];
                                return Padding(
                                  padding: UIHelper.padding(bottom: 10),
                                  child: NewsCard(
                                    imgSrc: _data.multimediaConverted,
                                    title: _data.title,
                                    desc: '${_data.byline} \u2022 ${_data.publishedDateConverted}',
                                    onFavoriteTap: () {},
                                    isFavorited: false,
                                  ),
                                );
                              },
                            ),
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
