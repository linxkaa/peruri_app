import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:peruri_app/core/commons/constans.dart';
import 'package:peruri_app/presentation/pages/dummy_ui/widgets/dummy_ui_container_card.dart';
import 'package:peruri_app/presentation/widgets/atoms/text_theme_extension.dart';
import 'package:peruri_app/presentation/widgets/molecules/platform_app_bar.dart';
import 'package:peruri_app/presentation/widgets/organisms/news_card.dart';
import 'package:peruri_app/presentation/widgets/organisms/ui_helper.dart';

@RoutePage()
class DummyUIPartTwoPage extends StatefulWidget {
  const DummyUIPartTwoPage({super.key});

  @override
  State<DummyUIPartTwoPage> createState() => _DummyUIPartTwoPageState();
}

class _DummyUIPartTwoPageState extends State<DummyUIPartTwoPage> with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    controller = TabController(vsync: this, length: 2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PlatformAppBar(
        title: const Text('Dummy UI'),
        leading: IconButton(
          onPressed: () {
            AutoRouter.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        bottom: TabBar(
          controller: controller,
          //source code lanjutan
          tabs: <Widget>[
            Padding(
              padding: UIHelper.padding(bottom: 5),
              child: Text(
                'ListView',
                style: context.textTheme.headlineSmall,
              ),
            ),
            Padding(
              padding: UIHelper.padding(bottom: 5),
              child: Text(
                'GridView',
                style: context.textTheme.headlineSmall,
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          ListView.builder(
            itemBuilder: (context, index) => Padding(
              padding: UIHelper.padding(vertical: 10, horizontal: 15),
              child: NewsCard(
                imgSrc: Constants.dummyImg,
                title: 'How can I be Flutter Developer Expert 1?',
                desc: 'Jill Lepore \u2022 23 May 2023',
                onFavoriteTap: () {},
                isFavorited: true,
              ),
            ),
            itemCount: 10,
          ),
          Padding(
            padding: UIHelper.padding(vertical: 10, horizontal: 15),
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1.3,
              children: List.generate(9, (index) {
                return DummyUIContainerCard(
                  imgSrc: Constants.dummyImg,
                  title: '2nd Container',
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
