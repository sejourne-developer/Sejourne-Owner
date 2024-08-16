import 'package:lottie/lottie.dart';
import '../../../../data/services/exporter.dart';
import '../../../../features/app/screens/home/widgets/icon_text_widget.dart';
import '../../../../features/app/screens/property_details/property_details_screen.dart';
import '../../../../features/messages/screens/chat/widgets/expanded_section.dart';
import '../../../../utils/local_storage/storage_utility.dart';
import '../../../../utils/popups/bookings_popups/booking_details_popup.dart';
import '../../../../utils/popups/general_popups/login_popup_container.dart';
import '../../../../utils/popups/home_popups/popup_expand_property_slider/popup_expand_property_slider.dart';
import '../../icons/circular_icon.dart';
import '../../texts/horizontal_icon_text.dart';

class PropertyWidget extends StatelessWidget {
  const PropertyWidget({
    super.key,
    required this.propertyImage,
    required this.index,
    required this.isFav,
    required this.com,
    this.onPressed,
    this.margin = const EdgeInsetsDirectional.only(start: TSizes.sm),  this.isSlidable=false,
    required this.isApproved,
  });

  final String propertyImage;
  final Rx<bool> isFav, com,isApproved;
  final int index;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry margin;
  final bool isSlidable;

  @override
  Widget build(BuildContext context) {
    final token = TLocalStorage().readData('TOKEN');
    final dark = THelperFunctions.isDarkMode(context);
    Rx<bool> isExpanded = false.obs;
    return Column(
      children: [
        TRoundedContainer(
          onPressed: isSlidable
              ? () => isExpanded.value = !isExpanded.value
              : () => Get.to(() => const PropertyDetailScreen()),
          height: 140,
          showBorder: true,
          isGradient: false,
          padding: EdgeInsets.zero,
          margin: margin,
          shadow: TShadowStyle.containerShadow,
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: ClipRRect(
                  borderRadius: const BorderRadiusDirectional.only(
                      topStart: Radius.circular(TSizes.md - 2),
                      bottomStart: Radius.circular(TSizes.md)),
                  child: Stack(
                    children: [
                      Image(
                        image: AssetImage(propertyImage),
                        fit: BoxFit.cover,
                        height: double.infinity,
                        width: TDeviceUtils.getScreenWidth(context) * 0.50,
                      ),
                      Positioned(
                          left: TSizes.sm,
                          top: TSizes.sm,
                          child: TRoundedContainer(
                            isGradient: true,
                            showBorder: false,
                            padding: const EdgeInsets.all(TSizes.xs),
                            child: Text(
                              '1BR, Apartment',
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .apply(color: TColors.white),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              Expanded(
                  flex: 6,
                  child: Padding(
                    padding: const EdgeInsets.all(TSizes.sm),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(TTexts.offerLabel,
                            style: Theme.of(context).textTheme.bodySmall),
                        Row(
                          children: [
                            const TCircularIcon(
                              icon: TImage.moneyIcon,
                              padding: 2,
                              showBorder: false,
                              height: TSizes.md,
                              width: TSizes.md,
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            RichText(
                              text: TextSpan(
                                text: 'د.إ13,000 ',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: TColors.darkGrey,
                                    fontSize: 10),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: '/Night',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall!
                                      //.apply(color: TColors.black),
                                      ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: TSizes.defaultSpace,
                            ),
                            const Expanded(
                              child: IconTextWidget(
                                title: 'JLT, Dubai',
                                icon: TImage.locationIcon,
                              ),
                            ),
                          ],
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: IconTextWidget(
                                title: '1 Beds',
                                icon: TImage.bedRoomsIcon,
                              ),
                            ),
                            Expanded(
                              child: IconTextWidget(
                                title: '1 Baths',
                                icon: TImage.bathIcon,
                              ),
                            ),
                            Expanded(
                              child: IconTextWidget(
                                title: '289 Sqft',
                                icon: TImage.mapIcon,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                    onTap: () => showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return const PopupExpandPropertySlider(
                                            banners: [
                                              TImage.prop1,
                                              TImage.prop2,
                                              TImage.prop3,
                                              TImage.prop4,
                                              TImage.prop5,
                                              TImage.prop6,
                                              TImage.prop7,
                                              TImage.prop8,
                                              TImage.prop9,
                                              TImage.prop10,
                                              TImage.prop11,
                                              TImage.prop12,
                                              TImage.prop13,
                                              TImage.prop14,
                                              TImage.prop15,
                                              TImage.prop16,
                                              TImage.property,
                                              TImage.property1,
                                              TImage.property2,
                                              TImage.property3,
                                              TImage.property4,
                                              TImage.property5,
                                              TImage.property6,
                                            ],
                                          );
                                        }),
                                    child: SvgPicture.asset(
                                      TImage.expandIcon,
                                      width: TSizes.lg,
                                      height: TSizes.lg,
                                      colorFilter: ColorFilter.mode(
                                          dark
                                              ? TColors.darkIconColor
                                              : TColors.lightIconColor,
                                          BlendMode.srcIn),
                                    )),
                                const SizedBox(
                                  width: TSizes.sm,
                                ),
                                GestureDetector(
                                    onTap: () =>token != null? isFav.value = !isFav.value:showDialog(
                                      context: context,
                                      builder: (context)=>const LoginPopUpContainer()
                                    ),
                                    child: Obx(
                                      () => isFav.value
                                          ? SizedBox(
                                              width: TSizes.lg,
                                              height: TSizes.lg,
                                              child: Lottie.asset(
                                                  TImage.animatedHeart,
                                                  fit: BoxFit.contain,
                                                  repeat: false),
                                            )
                                          : SizedBox(
                                              width: TSizes.lg,
                                              height: TSizes.lg,
                                              child: SvgPicture.asset(
                                                TImage.wishListIcon,
                                                // width: TSizes.lg,
                                                // height: TSizes.lg,
                                                colorFilter: ColorFilter.mode(
                                                    dark
                                                        ? TColors.darkIconColor
                                                        : TColors.lightIconColor,
                                                    BlendMode.srcIn),
                                              ),
                                            ),
                                    )),
                                const SizedBox(
                                  width: TSizes.sm,
                                ),
                                GestureDetector(
                                    onTap: () => com.value = !com.value,
                                    child: Obx(
                                      () => SvgPicture.asset(
                                        com.value
                                            ? TImage.filledAddIcon
                                            : TImage.addIcon,
                                        width: TSizes.lg,
                                        height: TSizes.lg,
                                        colorFilter: ColorFilter.mode(
                                          dark
                                              ? com.value
                                                  ? TColors.accent
                                                  : TColors.darkIconColor
                                              : com.value
                                                  ? TColors.accent
                                                  : TColors.lightIconColor,
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                    )),
                              ],
                            ),
                            Obx(() => isApproved.value
                                ? HorizontalIconText(
                              icon: TImage.approvedIcon,
                              title: "Approved",
                              isSub: false,
                              titleTextStyle: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .apply(color: TColors.green),
                              iconColor: TColors.green,
                            )
                                : HorizontalIconText(
                              icon: TImage.pendingIcon,
                              title: "Pending",
                              isSub: false,
                              titleTextStyle: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .apply(color: Colors.red),
                              iconColor: Colors.red,
                            ))
                          ],
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ),
        isSlidable?  Obx(
            ()=> ExpandedSection(
            expand: isExpanded.value,
            child: SizedBox(
              height: TDeviceUtils.getScreenHeight()*1.25,
              child: const BookingDetailsPopup(
                showBorder: false,
                ignoreAppBar: true,
                radius: 0,
                physics: NeverScrollableScrollPhysics(),
                margin: EdgeInsets.zero,
              ),
            ),
          ),
        ):const SizedBox()
      ],
    );
  }
}
