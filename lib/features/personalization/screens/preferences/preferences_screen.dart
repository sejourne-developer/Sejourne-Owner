import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/layouts/list_layout.dart';
import '../../../../common/widgets/layouts/profile_features_item_list.dart';
import '../../../../data/repositories/authentication_repository/authentication_repository.dart';
import '../../../../data/services/exporter.dart';
import '../../../../utils/popups/general_popups/primary_popup_container.dart';
import '../../../../utils/popups/profile_popups/preferences_popups/change_currency_popup.dart';
import '../../../../utils/popups/profile_popups/preferences_popups/change_language_popup.dart';
import '../../../../utils/popups/profile_popups/preferences_popups/change_theme_popup.dart';
import '../../../../utils/popups/profile_popups/preferences_popups/property_type_popup.dart';
import '../../../../utils/popups/profile_popups/preferences_popups/search_popup.dart';
import 'widgets/notification_preferences.dart';

class PreferencesScreen extends StatelessWidget {
  const PreferencesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> title = [
      TTexts.currencyLabel.tr,
      TTexts.languageLabel.tr,
      TTexts.themeLabel.tr,
      TTexts.searchLabel.tr,
      TTexts.propertyTypeLabel.tr,
      TTexts.notificationsTitle.tr,
      TTexts.dataSharingLabel.tr,
    ];
    List<String> subTitle = [
      AuthenticationRepository.selectedAppCurrency.value,
      AuthenticationRepository.selectedAppLanguage.value,
      AuthenticationRepository.instance.themeSelectText.value,
      (TTexts.dubai.tr),
      "${TTexts.apartmentLabel.tr}, ${TTexts.villaLabel.tr}.",
      TTexts.manageNotificationLabel.tr,
      TTexts.manageDataSharingLabel.tr,
    ];
    List<String> icons = [
      TImage.currencyIcon,
      TImage.languageIcon,
      TImage.themeIcon,
      TImage.propertySearchIcon,
      TImage.propertyTypeIcon,
      TImage.notificationIcon2,
      TImage.dataSharingIcon,
    ];
    List<Widget> onPressed = [
      const ChangeCurrencyPopUp(),
      const ChangeLanguagePopUp(),
      const ChangeThemePopUp(),
      const SearchPopup(),
      const PropertyTypePopup(),
      PrimaryPopupContainer(
        headIcon: TImage.notificationIcon1,
        title: TTexts.notificationsTitle.tr,
        subTitle: TTexts.customizeNotificationLabel.tr,
        buttonText: TTexts.saveLabel.tr,
        onPressed: () {
          Get.back();

        },
      ),
      PrimaryPopupContainer(
        headIcon: TImage.dataSharingIcon,
        title: TTexts.dataSharingLabel.tr,
        subTitle: TTexts.manageDataSharingLabel.tr,
        buttonText: TTexts.saveLabel.tr,
        onPressed: () {
          Get.back();

        },
      ),
    ];
    return BackgroundImageContainer(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.sm),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// App bar
               TAppBar(
                leadingIcon:Get.locale==arabic?TImage.rightArrowIcon: TImage.backArrow,
                title: Text(TTexts.preferencesLabel.tr),
              ),
              const SizedBox(
                height: TSizes.sm,
              ),

              Text(
                TTexts.changeLangCurrLabel.tr,
                style: Theme.of(context).textTheme.labelMedium!.apply(
                    color: Get.isDarkMode
                        ? TColors.darkFontColor
                        : TColors.darkerGrey),
              ),

              ListLayout(
                  itemBuilder: (_, index) => ProfileFeaturesItemList(
                        icon: icons[index],
                        title: title[index],
                        isVerified: false,
                        subTitle: subTitle[index],
                        onPressed: () => index == title.length - 2
                            ? Get.to(
                                () => const NotificationPreferencesScreen())
                            : showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return onPressed[index];
                                }),
                      ),
                  itemCount: title.length),
            ],
          ),
        ),
      ),
    ));
  }
}
