import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import '../../../../../common/widgets/layouts/rating_indicator.dart';
import '../../../../../common/widgets/texts/horizontal_icon_text.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class UserReviewsCard extends StatelessWidget {
  const UserReviewsCard(
      {super.key,
      required this.userName,
      required this.reviewComment,
      required this.cleanliness,
      required this.accuracy,
      required this.checkIn,
      required this.communication,
      required this.location,
      required this.value,
      required this.rating});

  final String userName,
      reviewComment,
      cleanliness,
      accuracy,
      checkIn,
      communication,
      location,
      value;

  final double rating;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage(TImage.user1),
                ),
                const SizedBox(
                  width: TSizes.spaceBtwItems,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Row(
                      children: [
                        const TRatingBarIndicator(rating: 3.5),
                        const SizedBox(
                          width: TSizes.sm,
                        ),
                        Text(
                          "$rating ${TTexts.startsLabel.tr}",
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Text(
              '01 Nov, 2023',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
         ReadMoreText(
          reviewComment,
          trimLines: 2,
          trimExpandedText: ' ${TTexts.lessLabel.tr}',
          trimCollapsedText: ' ${TTexts.showMoreLabel.tr}',
          trimMode: TrimMode.Line,
          moreStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: TColors.primary,
          ),
          lessStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: TColors.primary,
          ),
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: HorizontalIconText(
                icon: TImage.cleanlinessIcon,
                title: TTexts.cleanlinessLabel.tr,
                subTitle: cleanliness,
                titleTextStyle: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .apply(color: TColors.darkFontColor),
                subTitleTextStyle: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            Expanded(
              child: HorizontalIconText(
                icon: TImage.accuracyIcon,
                title: TTexts.accuracyLabel.tr,
                subTitle: accuracy,
                titleTextStyle: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .apply(color: TColors.darkFontColor),
                subTitleTextStyle: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            Expanded(
              child: HorizontalIconText(
                icon: TImage.checkInIcon,
                title: TTexts.checkInTitle.tr,
                subTitle: checkIn,
                titleTextStyle: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .apply(color: TColors.darkFontColor),
                subTitleTextStyle: Theme.of(context).textTheme.displayLarge,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: TSizes.sm,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: HorizontalIconText(
                icon: TImage.communicationIcon,
                title: TTexts.communicationLabel.tr,
                subTitle: communication,
                titleTextStyle: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .apply(color: TColors.darkFontColor),
                subTitleTextStyle: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            Expanded(
              child: HorizontalIconText(
                icon: TImage.locationIcon,
                title: TTexts.locationLabel.tr,
                subTitle: location,
                titleTextStyle: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .apply(color: TColors.darkFontColor),
                subTitleTextStyle: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            Expanded(
              child: HorizontalIconText(
                icon: TImage.valueIcon,
                title: TTexts.valueLabel.tr,
                subTitle: value,
                titleTextStyle: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .apply(color: TColors.darkFontColor),
                subTitleTextStyle: Theme.of(context).textTheme.displayLarge,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwSections,
        ),
      ],
    );
  }
}
