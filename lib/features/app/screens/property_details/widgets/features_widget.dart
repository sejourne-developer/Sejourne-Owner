import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../common/widgets/texts/horizontal_icon_text.dart';

class FeaturesWidget extends StatelessWidget {
  const FeaturesWidget({super.key, this.popup = false});

  final bool popup;

  @override
  Widget build(BuildContext context) {
    return Row(
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
                  isSub: false,
                  spaceBetween: TSizes.sm,
                  icon: TImage.city,
                  title: TTexts.citySkylineViewLabel.tr,
                ),
              ),
              const SizedBox(
                height: TSizes.xs,
              ),
               FittedBox(
                child: HorizontalIconText(
                  isSub: false,
                  spaceBetween: TSizes.sm,
                  icon: TImage.wifi,
                  title: TTexts.wifiLabel.tr,
                ),
              ),
              const SizedBox(
                height: TSizes.xs,
              ),
               FittedBox(
                child: HorizontalIconText(
                  isSub: false,
                  spaceBetween: TSizes.sm,
                  icon: TImage.parking,
                  title: TTexts.freeParkingLabel.tr,
                ),
              ),
              const SizedBox(
                height: TSizes.xs,
              ),
              popup
                  ? const SizedBox()
                  :  FittedBox(
                      child: HorizontalIconText(
                        isSub: false,
                        spaceBetween: TSizes.sm,
                        icon: TImage.washer,
                        title: TTexts.washerLabel.tr,
                      ),
                    ),
              const SizedBox(
                height: TSizes.xs,
              ),
              popup
                  ? const SizedBox()
                  :  FittedBox(
                      child: HorizontalIconText(
                        isSub: false,
                        spaceBetween: TSizes.sm,
                        icon: TImage.kitchen,
                        title: TTexts.kitchenLabel.tr,
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
                  isSub: false,
                  spaceBetween: TSizes.sm,
                  icon: TImage.workSpace,
                  title: TTexts.dedicatedWorkspaceLabel.tr,
                ),
              ),
              const SizedBox(
                height: TSizes.xs,
              ),
               FittedBox(
                child: HorizontalIconText(
                  isSub: false,
                  spaceBetween: TSizes.sm,
                  icon: TImage.tv,
                  title: "55\" ${TTexts.tvLabel.tr}",
                ),
              ),
              const SizedBox(
                height: TSizes.xs,
              ),
               FittedBox(
                child: HorizontalIconText(
                  isSub: false,
                  spaceBetween: TSizes.sm,
                  icon: TImage.ac,
                  title: TTexts.airConditioningLabel.tr,
                ),
              ),
              const SizedBox(
                height: TSizes.xs,
              ),
              popup
                  ? const SizedBox()
                  :  FittedBox(
                      child: HorizontalIconText(
                        isSub: false,
                        spaceBetween: TSizes.sm,
                        icon: TImage.drying,
                        title: TTexts.dryingLabel.tr,
                      ),
                    ),
            ],
          ),
        ),
      ],
    );
  }
}
