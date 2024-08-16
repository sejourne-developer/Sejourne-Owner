import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../common/widgets/texts/horizontal_icon_text.dart';

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FittedBox(
                child: HorizontalIconText(
                  icon: TImage.priceIcon,
                  title: TTexts.priceLabel.tr,
                  subTitle: "350.00AED/${TTexts.nightLabel.tr}",
                ),
              ),
              const SizedBox(
                height: TSizes.xs,
              ),
              FittedBox(
                child: HorizontalIconText(
                  icon: TImage.hash,
                  title: TTexts.iDLabel.tr,
                  subTitle: "5178",
                ),
              ),
              const SizedBox(
                height: TSizes.xs,
              ),
              FittedBox(
                child: HorizontalIconText(
                  icon: TImage.moneyIcon,
                  title: TTexts.guestTitle.tr,
                  subTitle: "2",
                ),
              ),
              const SizedBox(
                height: TSizes.xs,
              ),
              FittedBox(
                child: HorizontalIconText(
                  icon: TImage.bedRoomsIcon,
                  title: TTexts.bedRoomLabel.tr,
                  subTitle: "1",
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FittedBox(
                child: HorizontalIconText(
                  icon: TImage.bathIcon2,
                  title: TTexts.bathroomsLabel.tr,
                  subTitle: "1",
                ),
              ),
              const SizedBox(
                height: TSizes.xs,
              ),
              FittedBox(
                child: HorizontalIconText(
                  icon: TImage.city,
                  title: TTexts.typeLabel.tr,
                  subTitle: "${TTexts.apartmentLabel.tr}, ${TTexts.studioLabel.tr}",
                ),
              ),
              const SizedBox(
                height: TSizes.xs,
              ),
              FittedBox(
                child: HorizontalIconText(
                  icon: TImage.guests,
                  title: TTexts.allowAdditionalGuestsLabel.tr,
                  subTitle: TTexts.noLabel.tr,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
