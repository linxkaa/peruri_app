import 'package:flutter/material.dart';
import 'package:peruri_app/core/commons/colors_const.dart';
import 'package:peruri_app/presentation/widgets/atoms/text_theme_extension.dart';
import 'package:peruri_app/presentation/widgets/organisms/ui_helper.dart';

class ChipCustom extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final bool isChoosen;
  const ChipCustom({
    super.key,
    required this.onTap,
    required this.title,
    this.isChoosen = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: UIHelper.padding(vertical: 5, horizontal: 20),
        decoration: BoxDecoration(
          color: isChoosen ? ColorConstant.lightBlue : null,
          border: Border.all(color: ColorConstant.lightGrey, width: 0.5),
          borderRadius: UIHelper.borderRadiusCircular(all: 5),
        ),
        child: Text(
          title,
          style: context.textTheme.bodyMedium?.copyWith(
            color: isChoosen ? ColorConstant.primary : null,
          ),
        ),
      ),
    );
  }
}
