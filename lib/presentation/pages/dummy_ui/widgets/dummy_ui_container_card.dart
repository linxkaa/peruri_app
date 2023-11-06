import 'package:flutter/material.dart';
import 'package:peruri_app/core/commons/colors_const.dart';
import 'package:peruri_app/presentation/widgets/atoms/text_theme_extension.dart';
import 'package:peruri_app/presentation/widgets/organism/ui_helper.dart';

class DummyUIContainerCard extends StatelessWidget {
  final String title;
  final String imgSrc;
  const DummyUIContainerCard({super.key, required this.title, required this.imgSrc});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: UIHelper.padding(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorConstant.grey,
          width: 0.5,
        ),
        borderRadius: UIHelper.borderRadiusCircular(all: 10),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: UIHelper.borderRadiusCircular(all: 10),
            child: Image.network(
              imgSrc,
              width: UIHelper.setSp(70),
              height: UIHelper.setSp(70),
              fit: BoxFit.cover,
            ),
          ),
          UIHelper.verticalSpace(5),
          Text(
            title,
            style: context.textTheme.bodySmall?.copyWith(
              color: ColorConstant.grey,
            ),
          )
        ],
      ),
    );
  }
}
