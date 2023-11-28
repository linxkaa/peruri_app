import 'package:flutter/material.dart';
import 'package:peruri_app/core/commons/colors_const.dart';
import 'package:peruri_app/presentation/widgets/atoms/text_theme_extension.dart';
import 'package:peruri_app/presentation/widgets/organisms/ui_helper.dart';

class NewsCard extends StatelessWidget {
  final String imgSrc;
  final String title;
  final String desc;
  final VoidCallback onFavoriteTap;
  final bool isFavorited;
  const NewsCard({
    super.key,
    required this.imgSrc,
    required this.title,
    required this.desc,
    required this.onFavoriteTap,
    required this.isFavorited,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: UIHelper.padding(vertical: 20, horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorConstant.grey,
          width: 0.5,
        ),
        borderRadius: UIHelper.borderRadiusCircular(all: 10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                UIHelper.horizontalSpace(10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: context.textTheme.headlineSmall,
                      ),
                      UIHelper.verticalSpace(10),
                      Text(
                        desc,
                        style: context.textTheme.bodySmall?.copyWith(
                          color: ColorConstant.darkGrey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          UIHelper.horizontalSpace(20),
          InkWell(
            onTap: onFavoriteTap,
            child: Padding(
              padding: UIHelper.padding(all: 5),
              child: Icon(
                isFavorited ? Icons.star_outlined : Icons.star_border_outlined,
                color: ColorConstant.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
