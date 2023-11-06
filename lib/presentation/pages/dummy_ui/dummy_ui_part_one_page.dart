import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:peruri_app/core/commons/assets_path.dart';
import 'package:peruri_app/core/commons/colors_const.dart';
import 'package:peruri_app/core/commons/constans.dart';
import 'package:peruri_app/core/routes/app_router.gr.dart';
import 'package:peruri_app/presentation/pages/dummy_ui/widgets/dummy_ui_container_card.dart';
import 'package:peruri_app/presentation/widgets/atoms/text_theme_extension.dart';
import 'package:peruri_app/presentation/widgets/molecules/action_text.dart';
import 'package:peruri_app/presentation/widgets/organism/news_card.dart';
import 'package:peruri_app/presentation/widgets/organism/text_form_field.dart';
import 'package:peruri_app/presentation/widgets/organism/ui_helper.dart';

@RoutePage()
class DummyUIPartOnePage extends StatelessWidget {
  const DummyUIPartOnePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dummy UI'),
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
            ActionText(
              flex: 1,
              needDivider: false,
              title: "Next",
              desc: "Tab Bar, GridView, ListView",
              onTap: () {
                AutoRouter.of(context).push(const DummyUIPartTwoRoute());
              },
            ),
            UIHelper.verticalSpace(10),
            Text(
              'CONTAINER AND TEXT',
              style: context.textTheme.headlineSmall?.copyWith(
                color: ColorConstant.green,
              ),
            ),
            UIHelper.verticalSpace(10),
            NewsCard(
              imgSrc: Constants.dummyImg,
              title: 'How can I be Flutter Developer Expert?',
              desc: 'Jill Lepore \u2022 23 May 2023',
              onFavoriteTap: () {},
              isFavorited: true,
            ),
            UIHelper.verticalSpace(30),
            Text(
              'COLUMN',
              style: context.textTheme.headlineSmall?.copyWith(
                color: ColorConstant.green,
              ),
            ),
            UIHelper.verticalSpace(10),
            Column(
              children: [
                NewsCard(
                  imgSrc: Constants.dummyImg,
                  title: 'How can I be Flutter Developer Expert 1?',
                  desc: 'Jill Lepore \u2022 23 May 2023',
                  onFavoriteTap: () {},
                  isFavorited: true,
                ),
                UIHelper.verticalSpace(10),
                NewsCard(
                  imgSrc: Constants.dummyImg,
                  title: 'How can I be Flutter Developer Expert 2?',
                  desc: 'Jill Lepore \u2022 23 May 2023',
                  onFavoriteTap: () {},
                  isFavorited: true,
                )
              ],
            ),
            UIHelper.verticalSpace(30),
            Text(
              'ROW',
              style: context.textTheme.headlineSmall?.copyWith(
                color: ColorConstant.green,
              ),
            ),
            UIHelper.verticalSpace(10),
            Row(
              children: [
                DummyUIContainerCard(
                  imgSrc: Constants.dummyImg,
                  title: '1st Container',
                ),
                UIHelper.horizontalSpace(5),
                DummyUIContainerCard(
                  imgSrc: Constants.dummyImg,
                  title: '2nd Container',
                ),
                UIHelper.horizontalSpace(5),
                DummyUIContainerCard(
                  imgSrc: Constants.dummyImg,
                  title: '3rd Container',
                )
              ],
            ),
            UIHelper.verticalSpace(30),
            Text(
              'BUTTON',
              style: context.textTheme.headlineSmall?.copyWith(
                color: ColorConstant.green,
              ),
            ),
            UIHelper.verticalSpace(10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'SUBMIT',
                ),
              ),
            ),
            UIHelper.verticalSpace(30),
            Text(
              'INPUT',
              style: context.textTheme.headlineSmall?.copyWith(
                color: ColorConstant.green,
              ),
            ),
            UIHelper.verticalSpace(10),
            TextFormFieldCustom(
              title: 'Email',
              hintText: 'Enter your email..',
              preffixIcon: SvgPicture.asset(
                AssetsPath.emailIcon,
                width: UIHelper.setSp(15),
              ),
            ),
            UIHelper.verticalSpace(30),
            Text(
              'IMAGE ASSETS, SIZED BOX, AND EXPANDED',
              style: context.textTheme.headlineSmall?.copyWith(
                color: ColorConstant.green,
              ),
            ),
            UIHelper.verticalSpace(10),
            Row(
              children: [
                Expanded(
                  child: DummyUIContainerCard(
                    imgSrc: Constants.dummyImg,
                    title: '1st Container',
                  ),
                ),
                UIHelper.horizontalSpace(20),
                DummyUIContainerCard(
                  imgSrc: Constants.dummyImg,
                  title: '3rd Container',
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
