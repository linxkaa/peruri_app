import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:peruri_app/core/commons/colors_const.dart';
import 'package:peruri_app/core/commons/constans.dart';
import 'package:peruri_app/core/routes/app_router.gr.dart';
import 'package:peruri_app/presentation/widgets/atoms/text_theme_extension.dart';
import 'package:peruri_app/presentation/widgets/molecules/chip.dart';
import 'package:peruri_app/presentation/widgets/molecules/platform_app_bar.dart';
import 'package:peruri_app/presentation/widgets/organism/ui_helper.dart';

@RoutePage()
class TopStoriesCategoriesPage extends StatelessWidget {
  const TopStoriesCategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'CHOOSE TYPE',
              style: context.textTheme.headlineSmall?.copyWith(
                color: ColorConstant.green,
              ),
            ),
            UIHelper.verticalSpace(10),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: Constants.chooseSectionForStories
                  .map(
                    (e) => ChipCustom(
                        onTap: () {
                          AutoRouter.of(context).push(TopStoriesRoute(section: e));
                        },
                        title: e),
                  )
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
