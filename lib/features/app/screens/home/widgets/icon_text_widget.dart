import 'package:flutter/material.dart';
import 'package:sejourne_owner/utils/helpers/helper_functions.dart';
import '../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class IconTextWidget extends StatelessWidget {
  const IconTextWidget({
    super.key,
    required this.icon,
    required this.title,
  });

  final String icon, title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TCircularIcon(
          icon: icon,
          showBorder: false,
          padding: TSizes.xs-1,
          backgroundColor:THelperFunctions.isDarkMode(context)?TColors.black: const Color(0xFFEAF7F4),
          height: TSizes.md,
          width: TSizes.md,
        ),
        const SizedBox(
          width: 2,
        ),
        Expanded(
          child: Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context)
                .textTheme
                .labelSmall!
                //.apply(color: TColors.darkGrey),
          ),
        ),
      ],
    );
  }
}
