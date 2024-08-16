import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../common/widgets/texts/horizontal_icon_text.dart';
import '../../../../../data/services/exporter.dart';
import '../../../../../utils/popups/general_popups/log_out_popup.dart';
import '../../../../personalization/screens/profile/widgets/profile_pic.dart';
import '../../../../personalization/screens/settings/settings_screen.dart';
import '../../../../personalization/screens/support_and_feedback/support_and_feedback_screen.dart';
import '../../../controllers/drawers/drawer_controller.dart';
import '../../../controllers/user/user_controller.dart';
import '../../deals/deals.dart';
import '../../locations/locations.dart';
import '../../search/search.dart';
import '../../see_all_properties_or_after_search/see_all_properties_or_after_search.dart';

class MenuScreen extends GetView<MyDrawerController> {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    final dark = THelperFunctions.isDarkMode(context);
    final List<String> listTileLabel = [
      TTexts.searchLabel.tr,
      TTexts.propertiesLabel.tr,
      TTexts.deals.tr,
      TTexts.locationsLabel.tr,
      TTexts.supportLabel.tr,
      TTexts.settingsLabel.tr,
      TTexts.signOutLabel.tr,
    ];

    final List<String> listTileIcon = [
      TImage.searchIcon,
      TImage.propertiesIcon,
      TImage.dealsIcon,
      TImage.locationIcon,
      TImage.supportIcon,
      TImage.settingsIcon,
      TImage.signOutIcon,
    ];
    final List<Widget> route = [
      const SearchBottomSheetScreen(
        drawerMenu: true,
      ),
      const SeeAllPropertiesOrAfterSearchScreen(),
      const DealsScreen(),
      const LocationsScreen(),
      const SupportAndFeedbackScreen(),
      const SettingsScreen(),
      Container(),
    ];
    return Container(
      height: double.infinity,
      color: dark ? TColors.black : TColors.white,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
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
              start: -100,
              child: TCircularContainer(
                backgroundColor:
                    dark ? TColors.white.withOpacity(0.1) : TColors.primary,
              )),

          /// footer Circle
          PositionedDirectional(
              bottom: -300,
              start: -100,
              child: TCircularContainer(
                backgroundColor:
                    dark ? TColors.white.withOpacity(0.1) : TColors.primary,
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

          /// Profile Picture and User name

          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: TDeviceUtils.getAppBarHeight(),
              ),

              /// Profile Pic
              const ProfilePic(
                image: TImage.userPNG,
                showCameraIcon: false,
                size: 72,
              ),
              const SizedBox(
                height: TSizes.sm,
              ),
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /// User Name
                      Text(controller.user.fullName!,
                          style: Theme.of(context).textTheme.bodyLarge!.apply(
                              color:
                                  dark ? TColors.darkGrey : TColors.primary)),
                      const SizedBox(
                        width: TSizes.sm,
                      ),

                      /// Verified Icon
                      controller.user.emailVerifyStatus == 'Verified'
                          ? SvgPicture.asset(TImage.verifiedIcon)
                          : const SizedBox(),
                    ],
                  ),
                  const SizedBox(height: TSizes.xs,),

                  /// Location
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: HorizontalIconText(
                        isSub: false,
                        icon: TImage.locationIcon,
                        iconColor: dark ? TColors.darkGrey : TColors.primary,
                        title: TTexts.dubai.tr,
                        titleTextStyle: Theme.of(context)
                            .textTheme
                            .labelSmall!
                            .apply(
                                color:
                                    dark ? TColors.darkGrey : TColors.primary)),
                  ),
                  const SizedBox(height: TSizes.xs,),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: HorizontalIconText(
                        isSub: false,
                        icon: TImage.propertiesIcon2,
                        iconColor: dark ? TColors.darkGrey : TColors.primary,
                        title: "4 Properties",
                        titleTextStyle: Theme.of(context)
                            .textTheme
                            .labelSmall!
                            .apply(
                            color:
                            dark ? TColors.darkGrey : TColors.primary)),
                  ),

                ],
              ),

              const SizedBox(
                height: TSizes.md,
              ),

              Flexible(
                child: ListView.separated(
                  padding: const EdgeInsets.all(TSizes.md),
                  itemCount: listTileLabel.length,
                  separatorBuilder: (_, index) =>
                      const SizedBox(height: TSizes.sm),
                  itemBuilder: (_, index) => InkWell(
                    onTap: () => index == listTileLabel.length - 1
                        ? showDialog(
                            context: context,
                            builder: (context) => const LogOutPopUpForm())
                        : Get.to(() => route[index]),
                    child: HorizontalIconText(
                      isSub: false,
                      icon: listTileIcon[index],
                      iconSize: TSizes.iconSm,
                      iconColor: dark ? TColors.darkGrey : TColors.primary,
                      title: listTileLabel[index],
                      titleTextStyle: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .apply(
                              color: dark ? TColors.darkGrey : TColors.primary),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),
        ],
      ),
    );
  }
}
