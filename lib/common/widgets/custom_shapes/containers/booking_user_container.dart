import '../../../../data/services/exporter.dart';
import '../../images/dotted_border_circle_image.dart';
import '../../texts/horizontal_icon_text.dart';
import 'status_container.dart';

class BookingUserContainer extends StatelessWidget {
  const BookingUserContainer({
    super.key,
    required this.propertyImage,
    required this.index,
  });

  final String propertyImage;
  final int index;

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(HomeController());
    // final dark = THelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        TRoundedContainer(
          margin: const EdgeInsetsDirectional.only(top: TSizes.sm),
          constraints: BoxConstraints(
              minHeight: TDeviceUtils.getScreenHeight() * 0.10,
              maxHeight: TDeviceUtils.getScreenHeight() * 0.18),
          shadow: TShadowStyle.containerShadow,
          padding: const EdgeInsetsDirectional.only(start: TSizes.sm),
          //height: TDeviceUtils.getScreenHeight() * 0.14,
          child: Row(
            // mainAxisSize: MainAxisSize.min,
            children: [
              /// User Picture
              FittedBox(
                child: TDottedBorderCircleImage(
                  imageSize: 72,
                  borderWidth: 1,
                  image: propertyImage,
                  status: false,
                ),
              ),

              /// Property details
              Flexible(
                flex: 8,
                fit: FlexFit.tight,
                child: Padding(
                  padding: const EdgeInsets.all(TSizes.sm),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Property Name
                      Text(
                          maxLines: 2,
                          "Catalin Pustai",
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.labelLarge!),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 15,
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
                                      title: 'Studio (806) at Dubai Arch (JLT)',
                                      isSub: false,
                                      titleTextStyle: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
                                    )),
                                const SizedBox(
                                  height: TSizes.sm,
                                ),
                                Row(
                                  children: [
                                    FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: HorizontalIconText(
                                        icon: TImage.checkIn,
                                        iconSize: TSizes.sm,
                                        //isSub: false,
                                        maxLine: 1,
                                        titleTextStyle: Theme.of(context)
                                            .textTheme
                                            .labelSmall,
                                        subTitleTextStyle: Theme.of(context)
                                            .textTheme
                                            .labelSmall,
                                        title: "CheckIn",
                                        subTitle: "17.06.2024",
                                      ),
                                    ),
                                    const SizedBox(
                                      width: TSizes.sm,
                                    ),
                                    HorizontalIconText(
                                      titleTextStyle: Theme.of(context)
                                          .textTheme
                                          .labelSmall,
                                      subTitleTextStyle: Theme.of(context)
                                          .textTheme
                                          .labelSmall,
                                      icon: TImage.checkOut,
                                      iconSize: TSizes.sm,
                                      title: "CheckOut",
                                      subTitle: "26.06.2024",
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: TSizes.sm,
                                ),

                                Row(
                                  children: [
                                    HorizontalIconText(
                                      titleTextStyle: Theme.of(context)
                                          .textTheme
                                          .labelSmall,
                                      subTitleTextStyle: Theme.of(context)
                                          .textTheme
                                          .labelSmall,
                                      icon: TImage.priceIcon,
                                      iconSize: TSizes.sm,
                                      title: "Price",
                                      subTitle: "950 / Night",
                                    ),
                                    const SizedBox(
                                      width: TSizes.sm,
                                    ),
                                    HorizontalIconText(
                                      titleTextStyle: Theme.of(context)
                                          .textTheme
                                          .labelSmall,
                                      subTitleTextStyle: Theme.of(context)
                                          .textTheme
                                          .labelSmall,
                                      icon: TImage.revenue,
                                      iconSize: TSizes.sm,
                                      title: "Revenue",
                                      subTitle: "48,400",
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
                                    icon: TImage.nights,
                                    title: "Nights",
                                    subTitle: "9",
                                  ),
                                ),
                              ],
                            ),
                          ),

                          /// Three Dot Icon
                          const Expanded(
                            child: Icon(
                              Icons.more_vert_outlined,
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
        ),
        const PositionedDirectional(
          //top: -10,
          end: 16,
          child: StatusContainer(label: "Booking #  SJ1052124"),
        ),
      ],
    );
  }
}
