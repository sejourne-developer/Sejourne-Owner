import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/layouts/list_layout.dart';
import '../../../../common/widgets/layouts/profile_features_item_list.dart';
import '../../../../data/services/exporter.dart';
import '../../controllers/documents_controller.dart';
import 'widgets/driver_license_screen.dart';
import 'widgets/id_card_screen.dart';
import 'widgets/passport_screen.dart';
import 'widgets/visa_screen.dart';

class DocumentScreen extends StatelessWidget {
  const DocumentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DocumentsController());
    List<String> title = [
      TTexts.passportDetails.tr,
      TTexts.iDCard.tr,
      TTexts.driversLicense.tr,
      TTexts.visa.tr,
    ];
    List<String> subTitle = [
      TTexts.anyPassportAccept.tr,
      TTexts.residencePermitCards.tr,
      TTexts.yourDrivingLicense.tr,
      TTexts.anyVisaAccept.tr,
    ];
    List<String> icons = [
      TImage.passportIcon,
      TImage.idIcon,
      TImage.driverLicenseIcon,
      TImage.visaIcon,
    ];

    List<Widget> onPressed = [
      const PassportScreen(),
      const IdCardScreen(),
      const DriverLicenseScreen(),
      const VisaScreen(),
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
                title: Text(TTexts.documentVerification.tr),
              ),
              const SizedBox(
                height: TSizes.sm,
              ),
              Text(
                TTexts.chooseDocument.tr,
                style: Theme.of(context).textTheme.labelMedium!.apply(
                    color: Get.isDarkMode
                        ? TColors.darkFontColor
                        : TColors.darkerGrey),
              ),

              ListLayout(
                  itemBuilder: (_, index) => GestureDetector(
                        onTap: () => Get.to(onPressed[index]),
                        child: ProfileFeaturesItemList(
                          icon: icons[index],
                          title: title[index],
                          isVerified: false,
                          showEditButton: false,
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
