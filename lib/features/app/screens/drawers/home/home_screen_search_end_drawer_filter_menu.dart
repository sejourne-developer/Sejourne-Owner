import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../common/widgets/texts/horizontal_icon_text.dart';
import '../../../../../data/services/exporter.dart';
import '../../search/widgets/drop_down_location_field.dart';
import '../../see_all_properties_or_after_search/see_all_properties_or_after_search.dart';
import 'widgets/home_screen_search_end_drawer_filter_booking_form.dart';

class HomeScreenSearchEndDrawerFilter extends StatelessWidget {
  const HomeScreenSearchEndDrawerFilter({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      height: double.infinity,
      color: dark ? TColors.black : TColors.white,
      child: SingleChildScrollView(
        child: Stack(
          children: [
            /// footer background image
            PositionedDirectional(
              bottom: 10,
              start: 10,
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: TDeviceUtils.getBottomNavigationBarHeight()),
                child: Image.asset(
                  dark
                      ? TImage.drawerDarkBackground
                      : TImage.drawerLightBackground,
                  fit: BoxFit.cover,
                  // height: 800,
                  // width: 100,
                ),
              ),
            ),

            /// upper Circle
            PositionedDirectional(
              top: -300,
              start: -TDeviceUtils.getScreenWidth(context) * 0.29,
              child: TCircularContainer(
                backgroundColor: dark ? TColors.dark : TColors.primary,
                padding: TSizes.defaultSpace,
                child: Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: FittedBox(
                    // height: 56,
                    // width: 72,
                    child: HorizontalIconText(
                      iconColor: THelperFunctions.isDarkMode(context)
                          ? TColors.darkIconColor
                          : TColors.white,
                      titleTextStyle: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .apply(
                              color: THelperFunctions.isDarkMode(context)
                                  ? TColors.darkFontColor
                                  : TColors.white),
                      isSub: false,
                      iconSize: TSizes.iconSm,
                      icon: TImage.filterIcon,
                      title: TTexts.filterLabel.tr,
                    ),
                  ),
                ),
              ),
            ),

            /// footer Circle
            PositionedDirectional(
                bottom: -300,
                start: -TDeviceUtils.getScreenWidth(context) * 0.29,
                child: TCircularContainer(
                  backgroundColor: dark ? TColors.dark : TColors.primary,
                  padding: TSizes.spaceBtwSections,
                  child: Align(
                    alignment: AlignmentDirectional.topCenter,
                    child: Text(
                      TTexts.copyRight.tr,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall!
                          .apply(color: TColors.white),
                    ),
                  ),
                )),

            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),

            Padding(
              padding: TSpacingStyle.paddingWithAppBarHeight2,
              child: Column(
                children: [
                  const SizedBox(
                    height: TSizes.spaceBtwSections * 2,
                  ),

                  /// Location Drop down Field
                  DropDownLocationField(
                    height: 48,
                    iconSize: TSizes.iconXs,
                    hintTextStyle: Theme.of(context).textTheme.labelMedium,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwInputField,
                  ),

                  /// Booking Form
                  const HomeScreenSearchEndDrawerFilterBookingForm(),

                  /// Filter Button
                  TRoundedContainer(
                    width: double.infinity,
                    height: TSizes.defaultSpace * 1.5,
                    isGradient: true,
                    showBorder: false,
                    radius: TSizes.sm,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(padding: EdgeInsets.zero),
                      onPressed: () => Get.to(
                          () => const SeeAllPropertiesOrAfterSearchScreen()),
                      child: Text(
                        "${TTexts.filterLabel.tr} ${TTexts.nowLabel.tr}",
                        style: Theme.of(context).textTheme.labelLarge!.apply(
                            color:
                                dark ? TColors.darkFontColor : TColors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections * 4,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
