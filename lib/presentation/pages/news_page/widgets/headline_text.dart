import 'package:flutter/material.dart';
import 'package:peruri_app/core/commons/colors_const.dart';
import 'package:peruri_app/presentation/widgets/atoms/text_theme_extension.dart';
import 'package:peruri_app/presentation/widgets/organisms/ui_helper.dart';

class HeadlineText extends StatelessWidget {
  final VoidCallback? onTap;
  final String title;
  final String desc;
  const HeadlineText({super.key, this.onTap, required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: context.textTheme.displaySmall,
            ),
            const Spacer(),
            if (onTap != null)
              InkWell(
                onTap: onTap,
                child: Text(
                  'See All',
                  style: context.textTheme.headlineMedium?.copyWith(
                    color: ColorConstant.primary,
                  ),
                ),
              ),
          ],
        ),
        UIHelper.verticalSpace(5),
        Text(
          desc,
          style: context.textTheme.labelMedium?.copyWith(
            color: ColorConstant.grey,
          ),
        ),
      ],
    );
  }
}
