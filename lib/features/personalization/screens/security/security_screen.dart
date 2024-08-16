
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/layouts/list_layout.dart';
import '../../../../common/widgets/layouts/profile_features_item_list.dart';
import '../../../../data/services/exporter.dart';
import '../../../../utils/popups/profile_popups/security_popups/change_password_popup.dart';
import '../../../../utils/popups/profile_popups/security_popups/two_factor_auth_popup.dart';
import '../../controllers/security_controller.dart';
import 'widgets/active_sessions_screen.dart';

class SecurityScreen extends StatelessWidget {
  const SecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SecurityController());
    List<String> title = [
      TTexts.password.tr,
      TTexts.twoFactorAuth.tr,
      TTexts.activeSessions.tr,
    ];
    List<String> subTitle = [
      TTexts.resetPassword.tr,
      TTexts.increaseSecurity.tr,
      TTexts.selectSignOut.tr,
    ];
    List<String> icons = [
      TImage.passwordIcon,
      TImage.twoFactorAuthIcon,
      TImage.activeSessionIcon,
    ];
    List<Widget> onPressed = [
      const ChangePasswordPopup(),
      const TwoFactorAuthPopup(
        permissionKey: "Two_factor_Auth",
      ),
      const ActiveSessionsScreen(),
    ];
    return BackgroundImageContainer(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.sm),
          child: Column(
            children: [
              /// App bar
               TAppBar(
                leadingIcon:Get.locale==arabic?TImage.rightArrowIcon: TImage.backArrow,
                title: Text(TTexts.securityLabel.tr),
              ),
              Text(
                TTexts.changeSecuritySettings.tr,
                style: Theme.of(context).textTheme.labelMedium!.apply(
                    color: Get.isDarkMode
                        ? TColors.darkFontColor
                        : TColors.darkerGrey),
              ),

              ListLayout(
                  itemBuilder: (_, index) => GestureDetector(
                        onTap: () => index == title.length - 1
                            ? Get.to(() => const ActiveSessionsScreen())
                            : showDialog(
                                context: context,
                                builder: (context) => onPressed[index],
                              ),
                        child: ProfileFeaturesItemList(
                          icon: icons[index],
                          title: title[index],
                          showEditButton:
                              index == title.length - 1 ? false : true,
                          isVerified: false,
                          subTitle: subTitle[index],
                        ),
                      ),
                  itemCount: title.length),
            ],
          ),
        ),
      ),
    ));
  }
}
