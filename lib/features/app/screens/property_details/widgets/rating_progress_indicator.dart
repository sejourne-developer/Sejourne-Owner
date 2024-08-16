import '../../../../../common/widgets/layouts/rating_indicator.dart';
import '../../../../../common/widgets/texts/horizontal_icon_text.dart';
import '../../../../../data/services/exporter.dart';
import 'progress_indicator_and_rating.dart';

class OverallPropertyRating extends StatelessWidget {
  const OverallPropertyRating({
    super.key,
    required this.rating,
    required this.reviews,
    required this.cleanliness,
    required this.accuracy,
    required this.checkIn,
    required this.communication,
    required this.location,
    required this.value,
    required this.apartmentLocation,
  });

  final String rating,
      reviews,
      cleanliness,
      accuracy,
      checkIn,
      communication,
      location,
      value,
      apartmentLocation;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      padding: const EdgeInsetsDirectional.symmetric(vertical:TSizes.md,horizontal: TSizes.sm),
      radius: TSizes.sm,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: rating,
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            TextSpan(
                              text: "/5",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .apply(color: TColors.grey),
                            ),
                          ],
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "${TTexts.basedOn.tr} $reviews ${TTexts.reviewsLabel.tr}",
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .apply(color: TColors.grey),
                        ),
                      ),
                      const TRatingBarIndicator(
                        rating: 3.5,
                      ),
                    ],
                  )),
              Expanded(
                flex: 5,
                child: Column(
                  children: [
                    TRatingProgressIndicator(
                      text: '5 ${TTexts.startsLabel.tr}',
                      value: 1.0,
                    ),
                    TRatingProgressIndicator(
                      text: '4 ${TTexts.startsLabel.tr}',
                      value: 0.8,
                    ),
                    TRatingProgressIndicator(
                      text: '3 ${TTexts.startsLabel.tr}',
                      value: 0.6,
                    ),
                    TRatingProgressIndicator(
                      text: '2 ${TTexts.startsLabel.tr}',
                      value: 0.4,
                    ),
                    TRatingProgressIndicator(
                      text: '1 ${TTexts.startsLabel.tr}',
                      value: 0.2,
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: TSizes.md,
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
                  subTitleTextStyle:
                      Theme.of(context).textTheme.displayLarge,
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
                  subTitleTextStyle:
                      Theme.of(context).textTheme.displayLarge,
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
                  subTitleTextStyle:
                      Theme.of(context).textTheme.displayLarge,
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
                  subTitleTextStyle:
                      Theme.of(context).textTheme.displayLarge,
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
                  subTitleTextStyle:
                      Theme.of(context).textTheme.displayLarge,
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
                  subTitleTextStyle:
                      Theme.of(context).textTheme.displayLarge,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
