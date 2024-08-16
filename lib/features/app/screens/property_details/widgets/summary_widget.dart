import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import 'package:get/get.dart';

import '../../../../../utils/helpers/helper_functions.dart';


class Summary extends StatelessWidget {
  const Summary({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  TRoundedContainer(
      isGradient: false,
      showBorder: true,
      borderColor: TColors.grey,
      child: Row(
        children: [
          /// Apartment Button
          Expanded(
            flex: 2,
            child: IconTitleSubTitle(
              icon: TImage.houseIcon,
              title: TTexts.apartmentLabel.tr,
              subTitle: TTexts.studioLabel.tr,
            ),
          ),

          Expanded(
            flex: 2,
            child: IconTitleSubTitle(
              icon: TImage.guests,
              title: TTexts.accommodationLabel.tr,
              subTitle: '2 ${TTexts.guestTitle.tr}',
            ),
          ),

          Expanded(
            flex: 2,
            child: IconTitleSubTitle(
              icon: TImage.bedRoomsIcon,
              title: '${TTexts.studioLabel.tr} ${TTexts.bedRoomLabel.tr}',
              subTitle: '1 ${TTexts.bedRoomLabel.tr}',
            ),
          ),

          Expanded(
            flex: 2,
            child: IconTitleSubTitle(
              showBorder: false,
              icon: TImage.bathIcon2,
              title: TTexts.bathroomsLabel.tr,
              subTitle: '1 ${TTexts.fullLabel.tr}',
            ),
          ),
        ],
      ),
    );
  }
}

class IconTitleSubTitle extends StatelessWidget {
  const IconTitleSubTitle({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
    this.showBorder = true,
  });

  final String icon, title, subTitle;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(TSizes.sm),
      decoration: BoxDecoration(
          border: showBorder
              ? BorderDirectional(
                  end: BorderSide(
                      color: THelperFunctions.isDarkMode(context)
                          ? TColors.darkPrimaryBorderColor
                          : TColors.grey,
                      width: 1))
              : null),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            height: TSizes.iconMd,
            width: TSizes.iconMd,
          ),
          const SizedBox(height: TSizes.xs,),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              subTitle,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
        ],
      ),
    );
  }
}
