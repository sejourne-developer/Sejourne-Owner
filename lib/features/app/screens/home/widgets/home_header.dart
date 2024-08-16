import 'package:sejourne_owner/features/app/controllers/home/home_controller.dart';
import 'package:sejourne_owner/utils/popups/general_popups/calender_popup.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../data/services/exporter.dart';
import '../../../../notifications/screens/notification/notification.dart';
import '../../../controllers/drawers/drawer_controller.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(MyDrawerController());
    Get.put(HomeController());
    var dark = THelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        TRoundedContainer(
          margin: const EdgeInsets.only(
              top: TSizes.appBarHeight, right: TSizes.sm, left: TSizes.sm),
          padding: const EdgeInsets.symmetric(
              horizontal: TSizes.md, vertical: TSizes.sm),
          gradient: dark ? TColors.darkLinerGradient : TColors.linerGradient,
          isGradient: true,
          height: 110,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Menu Icon
                  TCircularIcon(
                    icon: TImage.menuIcon,
                    onPressed: () {
                      MyDrawerController.instance.homeScaffoldKey.currentState
                          ?.openDrawer();
                      //controller.toggleDrawer();
                    },
                  ),
                  const SizedBox(
                    width: TSizes.md,
                  ),

                  /// Location And Drop Down Menu Column
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Location Label
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text("Month",
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .apply(
                                    color: dark
                                        ? TColors.darkFontColor
                                        : TColors.white)),
                      ),

                      /// Locations menu in bottom sheet
                      InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CalenderPopUpForm(
                                  headIcon: TImage.searchBookingIcon,
                                  title: "Month",
                                  dateRangePickerSelectionMode: DateRangePickerSelectionMode.single,
                                  dateRangePickerView:
                                      DateRangePickerView.year,
                                  subTitle: "Please select month",
                                  buttonText: "search",
                                  onPressed: () => Get.back(),
                                );
                              });
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            /// Icon
                            SvgPicture.asset(
                              TImage.searchBookingIcon,
                              width: TSizes.iconXs,
                              height: TSizes.iconXs,
                              colorFilter: ColorFilter.mode(
                                  dark ? TColors.darkIconColor : TColors.white,
                                  BlendMode.srcIn),
                            ),
                            const SizedBox(
                              width: TSizes.xs,
                            ),
                            Text(
                              HomeController.instance.selectedMonth.value,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .apply(
                                      color: dark
                                          ? TColors.darkFontColor
                                          : TColors.white),
                              maxLines: 1,
                            ),
                            const SizedBox(
                              width: TSizes.xs,
                            ),
                            SvgPicture.asset(
                              TImage.arrowDownIcon,
                              height: TSizes.iconSm,
                              width: TSizes.iconSm,
                              colorFilter: ColorFilter.mode(
                                  dark ? TColors.darkIconColor : TColors.white,
                                  BlendMode.srcIn),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              /// notification Icons
              TCircularIcon(
                icon: TImage.notificationIcon,
                onPressed: () => Get.to(() => const NotificationScreen()),
              ),
            ],
          ),
        ),
        Container(
          margin:
              const EdgeInsetsDirectional.only(top: TSizes.appBarHeight * 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TRoundedContainer(
                margin:
                    const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
                padding: const EdgeInsetsDirectional.all(TSizes.sm),
                height: 100,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Earnings",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          "Total earning 232,000 AED",
                          style: Theme.of(context).textTheme.labelSmall!.apply(
                              color: Get.isDarkMode
                                  ? TColors.darkFontColor
                                  : TColors.grey2),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text.rich(TextSpan(children: [
                          TextSpan(
                            text: "33,500",
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .apply(
                                    color: Get.isDarkMode
                                        ? TColors.darkFontColor
                                        : TColors.primary),
                          ),
                          TextSpan(
                            text: "AED",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(
                                    color: Get.isDarkMode
                                        ? TColors.darkFontColor
                                        : TColors.primary),
                          ),
                        ])),
                        SvgPicture.asset(
                          height: TSizes.iconMd,
                          TImage.moneyIcon3,
                          colorFilter: ColorFilter.mode(
                              Get.isDarkMode
                                  ? TColors.darkIconColor
                                  : TColors.primary,
                              BlendMode.srcIn),
                        ),
                      ],
                    ),
                    Text(
                      "Revenue April 2024",
                      style: Theme.of(context).textTheme.labelMedium!.apply(
                          color: Get.isDarkMode
                              ? TColors.darkFontColor
                              : TColors.grey2),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: TSizes.sm,
              ),
              SizedBox(
                height: 80,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: TSizes.defaultSpace),
                  child: Row(
                    children: [
                      Expanded(
                          child: TRoundedContainer(
                        padding: const EdgeInsetsDirectional.all(TSizes.sm),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Properties",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "4",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .apply(
                                          color: Get.isDarkMode
                                              ? TColors.darkFontColor
                                              : TColors.primary),
                                ),
                                SvgPicture.asset(
                                  height: TSizes.iconMd,
                                  TImage.propertiesIcon2,
                                  colorFilter: ColorFilter.mode(
                                      Get.isDarkMode
                                          ? TColors.darkIconColor
                                          : TColors.primary,
                                      BlendMode.srcIn),
                                ),
                              ],
                            ),
                            Text(
                              "4.5 Average Reviews",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .apply(
                                      color: Get.isDarkMode
                                          ? TColors.darkFontColor
                                          : TColors.grey2),
                            )
                          ],
                        ),
                      )),
                      const SizedBox(
                        width: TSizes.sm,
                      ),
                      Expanded(
                          child: TRoundedContainer(
                        padding: const EdgeInsetsDirectional.all(TSizes.sm),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Bookings",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "14",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .apply(
                                          color: Get.isDarkMode
                                              ? TColors.darkFontColor
                                              : TColors.primary),
                                ),
                                SvgPicture.asset(
                                  height: TSizes.iconMd,
                                  TImage.searchBookingIcon,
                                  colorFilter: ColorFilter.mode(
                                      Get.isDarkMode
                                          ? TColors.darkIconColor
                                          : TColors.primary,
                                      BlendMode.srcIn),
                                ),
                              ],
                            ),
                            Text(
                              "Total Bookings 359",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .apply(
                                      color: Get.isDarkMode
                                          ? TColors.darkFontColor
                                          : TColors.grey2),
                            )
                          ],
                        ),
                      )),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.all(TSizes.sm),
                child: Text(
                  "Reservations in April 2024",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
