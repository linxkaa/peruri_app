import 'package:flutter/material.dart';
import 'package:peruri_app/core/commons/colors_const.dart';
import 'package:peruri_app/presentation/widgets/atoms/text_theme_extension.dart';
import 'package:peruri_app/presentation/widgets/organisms/ui_helper.dart';

class RequiredText extends StatelessWidget {
  const RequiredText({
    Key? key,
    required this.title,
    this.required = true,
    this.color,
  }) : super(key: key);

  final String? title;
  final bool required;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text.rich(
          TextSpan(
            style: color != null
                ? context.textTheme.bodyLarge?.copyWith(
                    color: color,
                  )
                : context.textTheme.bodyLarge?.copyWith(
                    color: ColorConstant.black,
                  ),
            children: [
              TextSpan(
                text: title,
              ),
              TextSpan(text: required ? " *" : "", style: const TextStyle(color: Colors.red)),
            ],
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        UIHelper.verticalSpace(5),
      ],
    );
  }
}
