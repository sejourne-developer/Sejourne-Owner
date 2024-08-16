import '../../../../../common/widgets/custom_shapes/containers/status_container.dart';
import '../../../../../data/services/exporter.dart';
import '../../../../../common/widgets/texts/horizontal_icon_text.dart';
import '../../../../../utils/popups/bookings_popups/booking_details_popup.dart';
import '../../booking_wizard_form/booking_wizard_form.dart';
import '../../write_review/write_review_screen.dart';

class BookingPropertyDetails extends StatelessWidget {
  const BookingPropertyDetails(
      {super.key,
      required this.image,
      required this.title,
      required this.status,
      required this.time,
      required this.location,
      required this.checkInCheckOutDate,
      required this.nights,
      required this.price,
      required this.cleaningFee,
      required this.paidAmount});

  final String image,
      title,
      status,
      time,
      location,
      checkInCheckOutDate,
      nights,
      price,
      cleaningFee,
      paidAmount;

  @override
  Widget build(BuildContext context) {
    List<String> label = [TTexts.writeReview.tr, TTexts.bookAgain.tr, TTexts.overviewLabel.tr];
    List<String> icons = [
      TImage.feedBackIcon,
      TImage.searchBookingIcon,
      TImage.statusAddIcon
    ];
    return TRoundedContainer(
      constraints: BoxConstraints(
          minHeight: TDeviceUtils.getScreenHeight() * 0.10,
          maxHeight: TDeviceUtils.getScreenHeight() * 0.18),
      shadow: TShadowStyle.containerShadow,
      //height: TDeviceUtils.getScreenHeight() * 0.14,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// Property image
          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius: const BorderRadiusDirectional.only(
                  topStart: Radius.circular(TSizes.md - 2),
                  bottomStart: Radius.circular(TSizes.md)),
              child: GestureDetector(
                onTap: () => showDialog(
                  context: context,
                  //barrierColor: Colors.transparent,
                  builder: (BuildContext context) =>
                      const BookingDetailsPopup(
                        margin: EdgeInsetsDirectional.symmetric(horizontal: TSizes.md,vertical: TSizes.spaceBtwSections),
                      ),
                ),
                child: Image(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                  height: double.maxFinite,
                  // width:
                  //     TDeviceUtils.getScreenWidth(context) * 0.50,
                ),
              ),
            ),
          ),

          /// Property details
          Flexible(
            flex: 8,
            fit: FlexFit.tight,
            child: Padding(
              padding: const EdgeInsets.all(TSizes.sm),
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// Property Name
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                            maxLines: 2,
                            title,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.labelLarge!),
                      ),
                      Row(
                        children: [
                          /// Status Container for paid label
                          StatusContainer(
                            label: status,
                          ),
                          const SizedBox(
                            width: TSizes.xs,
                          ),

                          /// time
                          Text(time,
                              style: Theme.of(context).textTheme.displayMedium),
                        ],
                      ),
                    ],
                  ),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 10,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// Location for apartment
                            FittedBox(
                                fit: BoxFit.scaleDown,
                                child: HorizontalIconText(
                                  icon: TImage.locationIcon,
                                  iconSize: TSizes.iconXs,
                                  title: location,
                                  isSub: false,
                                  titleTextStyle:
                                      Theme.of(context).textTheme.labelMedium,
                                )),
                            const SizedBox(
                              height: TSizes.sm,
                            ),
                            Row(
                              children: [
                                HorizontalIconText(
                                  icon: TImage.checkIn,
                                  iconSize: TSizes.sm,
                                  isSub: false,
                                  maxLine: 1,
                                  titleTextStyle:
                                      Theme.of(context).textTheme.labelSmall,
                                  title: checkInCheckOutDate,
                                ),
                                const SizedBox(
                                  width: TSizes.sm,
                                ),
                                HorizontalIconText(
                                  titleTextStyle:
                                      Theme.of(context).textTheme.labelSmall,
                                  subTitleTextStyle:
                                      Theme.of(context).textTheme.labelSmall,
                                  icon: TImage.nights,
                                  iconSize: TSizes.sm,
                                  title: TTexts.nightLabel.tr,
                                  subTitle: nights,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: TSizes.sm,
                            ),

                            Row(
                              children: [
                                HorizontalIconText(
                                  titleTextStyle:
                                      Theme.of(context).textTheme.labelSmall,
                                  subTitleTextStyle:
                                      Theme.of(context).textTheme.labelSmall,
                                  icon: TImage.priceIcon,
                                  iconSize: TSizes.sm,
                                  title: TTexts.priceLabel.tr,
                                  subTitle: "$price / ${TTexts.nightLabel.tr}",
                                ),
                                const SizedBox(
                                  width: TSizes.sm,
                                ),
                                HorizontalIconText(
                                  titleTextStyle:
                                      Theme.of(context).textTheme.labelSmall,
                                  subTitleTextStyle:
                                      Theme.of(context).textTheme.labelSmall,
                                  icon: TImage.fee,
                                  iconSize: TSizes.sm,
                                  title: TTexts.cleaningFeeLabel.tr,
                                  subTitle: cleaningFee,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: TSizes.sm,
                            ),

                            FittedBox(
                              child: HorizontalIconText(
                                titleTextStyle:
                                    Theme.of(context).textTheme.labelSmall,
                                subTitleTextStyle:
                                    Theme.of(context).textTheme.labelSmall,
                                icon: TImage.priceIcon,
                                title:TTexts.paidAmountLabel.tr,
                                subTitle: paidAmount,
                              ),
                            ),
                          ],
                        ),
                      ),

                      /// Three Dot Icon
                      Expanded(
                        flex: 1,
                        child: PopupMenuButton(

                          shape: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Get.isDarkMode
                                    ? TColors.darkPrimaryBorderColor
                                    : TColors.lightPrimaryBorderColor,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(TSizes.md),
                                bottomLeft: Radius.circular(TSizes.md),
                                bottomRight: Radius.circular(TSizes.md),
                                topRight: Radius.circular(0),
                              )),

                          color: Get.isDarkMode
                              ? TColors.darkContainer
                              : TColors.white,
                          itemBuilder: (context) {
                            return List.generate(
                              3,
                              (index) {
                                return PopupMenuItem(
                                  onTap: () => index == 0
                                      ? Get.to(() => const WriteReviewScreen())
                                      : index == 1
                                          ? Get.to(
                                              () => const BookingWizardForm())
                                          : showDialog(
                                              context: context,
                                              builder: (BuildContext context) =>
                                                  const BookingDetailsPopup(
                                                    margin: EdgeInsetsDirectional.symmetric(horizontal: TSizes.sm,vertical: TSizes.spaceBtwSections),
                                                  ),
                                            ),
                                  child: GestureDetector(

                                    child: HorizontalIconText(
                                      icon: icons[index],
                                      title: label[index],
                                      isSub: false,
                                    ),
                                  ),
                                );
                              },
                            );
                          },

                          /// Three dot icon
                          child: Icon(
                            Icons.more_vert_outlined,
                            color: Get.isDarkMode
                                ? TColors.darkIconColor
                                : TColors.secondaryAccent,
                            size: TSizes.iconLg,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
