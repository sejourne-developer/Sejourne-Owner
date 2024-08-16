import 'package:sejourne_owner/features/personalization/screens/properties/properties.dart';
import 'package:sejourne_owner/features/personalization/screens/reports/reports.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/texts/horizontal_icon_text.dart';
import '../../../../data/services/exporter.dart';
import '../../../app/controllers/user/user_controller.dart';
import '../documents/document_screen.dart';
import '../legal_information/legal_information_screen.dart';
import '../payment/payment_screen.dart';
import '../personal_details/personal_details.dart';
import '../preferences/preferences_screen.dart';
import '../reviews/reviews_screen.dart';
import '../security/security_screen.dart';
import '../settings/settings_screen.dart';
import '../support_and_feedback/support_and_feedback_screen.dart';
import 'widgets/icon_title.dart';
import 'widgets/profile_pic.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    List titles = [
      TTexts.personalLabel.tr,
      TTexts.preferencesLabel.tr,
      TTexts.securityLabel.tr,
      TTexts.paymentLabel.tr,
      TTexts.legalLabel.tr,
      TTexts.documentLabel.tr,
      TTexts.propertiesLabel.tr,
      TTexts.reportLabel.tr,
      TTexts.reviewsLabel.tr,
      TTexts.supportLabel.tr,
      TTexts.settingsLabel.tr,
    ];
    List icons = [
      TImage.personal,
      TImage.preferences,
      TImage.security,
      TImage.payment,
      TImage.legalIcon,
      TImage.documentsIcon,
      TImage.propertiesIcon2,
      TImage.reportsIcon,
      TImage.reviewsIcon,
      TImage.supportIcon2,
      TImage.settings,
    ];

    List<Widget> route = [
      const PersonalDetails(),
      const PreferencesScreen(),
      const SecurityScreen(),
      const PaymentScreen(),
      const LegalInformationScreen(),
      const DocumentScreen(),
      const PropertiesScreen(),
      const Reports(),
      const ReviewsScreen(),
      const SupportAndFeedbackScreen(),
      const SettingsScreen(),
    ];

    return Scaffold(
      endDrawerEnableOpenDragGesture: false,
      backgroundColor: Colors.transparent,

      /// Body
      body: BackgroundImageContainer(
        child: SingleChildScrollView(
          child: Obx(
            () => controller.profileLoading.value
                ? SizedBox(
                    height: TDeviceUtils.getScreenHeight(),
                    child: const Center(child: CircularProgressIndicator()),
                  )
                : Column(
                    children: [
                      const NetworkCheckerContainer(),
                      Padding(
                        padding: TSpacingStyle.paddingWithAppBarHeight2,
                        child: Column(
                          children: [
                            MainScreensAppBar(
                                leadingIcon: TImage.profileIcon,
                                title: TTexts.profileLabel.tr),

                            /// Profile Picture and User name
                            const SizedBox(
                              height: TSizes.spaceBtwSections,
                            ),
                            SizedBox(
                              height: 220,
                              child: Stack(children: [
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: TRoundedContainer(
                                    height: 150,
                                    isGradient: true,
                                    padding: const EdgeInsets.only(
                                        bottom:TSizes.defaultSpace
                                            ),
                                    width: double.infinity,
                                    child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  /// User Name
                                                  FittedBox(
                                                    fit: BoxFit.scaleDown,
                                                    child: Text(
                                                      controller.user.fullName!,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineSmall!
                                                          .apply(
                                                              color: TColors
                                                                  .white),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: TSizes.sm,
                                                  ),

                                                  /// Verified Icon
                                                  controller.user
                                                              .emailVerifyStatus ==
                                                          'Verified'
                                                      ? SvgPicture.asset(
                                                          TImage.verifiedIcon)
                                                      : const SizedBox(),
                                                ],
                                              ),

                                              const SizedBox(
                                                height: TSizes.xs,
                                              ),

                                              /// Location
                                              HorizontalIconText(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                icon: TImage.locationIcon,
                                                iconColor: TColors.white,
                                                isSub: false,
                                                maxLine: 1,
                                                title: TTexts.dubai.tr,
                                                titleTextStyle:
                                                    Theme.of(context)
                                                        .textTheme
                                                        .labelSmall!
                                                        .apply(
                                                          color: TColors.white,
                                                        ),
                                              ),

                                              const SizedBox(
                                                height: TSizes.xs,
                                              ),

                                              FittedBox(
                                                fit: BoxFit.scaleDown,
                                                child: Text(
                                                  "4 Properties",
                                                 style:  Theme.of(context)
                                                      .textTheme
                                                      .labelMedium!
                                                      .apply(
                                                    color: TColors.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                  ),
                                ),

                                /// Profile Pic
                                Positioned(
                                  //top: 20,
                                  left:
                                      TDeviceUtils.getScreenWidth(context) / 3,
                                  child: const ProfilePic(
                                    image: TImage.user2,
                                  ),
                                ),
                              ]),
                            ),
                            const SizedBox(
                              height: TSizes.spaceBtwSections,
                            ),

                            ///
                            TGridLayout(
                                itemCount: titles.length,
                                crossAxisSpacing: TSizes.sm,
                                mainAxisSpacing: TSizes.sm,
                                mainAxisExtent: 120,
                                itemBuilder: (_, index) => TRoundedContainer(
                                      onPressed: () =>
                                          Get.to(() => route[index]),
                                      showBorder: true,
                                      isGradient: false,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: TSizes.md),
                                      shadow: TShadowStyle.containerShadow,
                                      child: IconTitle(
                                        showBorder: false,
                                        title: titles[index],
                                        icon: icons[index],
                                      ),
                                    )),
                            const SizedBox(
                              height: TSizes.appBarHeight * 2,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
