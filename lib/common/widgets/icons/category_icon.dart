import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/circular_container.dart';
import 'dotted_circle_border_icon.dart';

class CategoryIconButton extends StatelessWidget {
  const CategoryIconButton({
    super.key,
    required this.category,
    required this.index,
    required this.selectedIndex,
    this.onPressed,
    this.spaceBetweenIconAndText = TSizes.sm,
    this.textStyle,
    required this.icon,
    this.isMultiple = true,  this.selectedItems, this.selected=false,
  });

  final String category, icon;
  final int index, selectedIndex;
  final double spaceBetweenIconAndText;
  final VoidCallback? onPressed;
  final TextStyle? textStyle;
  final bool isMultiple,selected;
  final List<int>? selectedItems;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return InkWell(
        onTap: onPressed,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                    height: 56,
                    width: 56,
                    child: DottedCircleBorderIcon(
                      icon: icon,
                      padding: 0,
                    )),
                SizedBox(
                  height: spaceBetweenIconAndText,
                ),
                SizedBox(
                  width: 56,
                  child: Text(
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    category,
                    style: textStyle ?? Theme.of(context).textTheme.labelSmall,
                  ),
                )
              ],
            ),
            isMultiple
                ? selected? PositionedDirectional(
                    end: 1,
                    child: TCircularContainer(
                      height: TSizes.md,
                      width: TSizes.md,
                      backgroundColor: TColors.primary,
                      radius: 100,
                      child: Icon(
                        Icons.done,
                        size: TSizes.iconXs,
                        color: dark ? TColors.darkFontColor : TColors.white,
                      ),
                    )):const SizedBox()
                : selectedIndex == index
                    ? PositionedDirectional(
                        end: 1,
                        child: TCircularContainer(
                          height: TSizes.md,
                          width: TSizes.md,
                          backgroundColor: TColors.primary,
                          radius: 100,
                          child: Icon(
                            Icons.done,
                            size: TSizes.iconXs,
                            color: dark ? TColors.darkFontColor : TColors.white,
                          ),
                        ))
                    : const SizedBox(),
          ],
        ));
  }
}
