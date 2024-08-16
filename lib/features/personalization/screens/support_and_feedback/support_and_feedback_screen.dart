import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/layouts/list_layout.dart';
import '../../../../common/widgets/layouts/profile_features_item_list.dart';
import '../../../../data/services/exporter.dart';
import '../../../../utils/popups/profile_popups/support_and_feedback_popups/feedback_popup.dart';
import '../../../../utils/popups/profile_popups/support_and_feedback_popups/support_popup.dart';
import 'widget/faqs_screen.dart';

class SupportAndFeedbackScreen extends StatelessWidget {
  const SupportAndFeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> title = [
      TTexts.contactSupportTitle.tr,
      TTexts.submitFeedbackTitle.tr,
      TTexts.faqsTitle.tr,
      //   "Developer Contact",
    ];
    List<String> subTitle = [
      TTexts.contactSupportSubTitle.tr,
      TTexts.submitFeedbackSubTitle.tr,
      TTexts.faqsSubTitle.tr,
      // "Get in touch with the app developers for any issues or suggestions.",
    ];
    List<String> icons = [
      TImage.supportIcon1,
      TImage.feedBackIcon,
      TImage.faqsIcon,
      // TImage.developerIcon,
    ];

    List<Widget> onPressed = [
      const SupportPopup(),
      const FeedbackPopup(),
      const FAQsScreen(),
      // const SizedBox(),
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
                title: Text("${TTexts.supportLabel.tr} ${TTexts.and.tr} ${TTexts.feedBackLabel.tr}"),
              ),
              const SizedBox(
                height: TSizes.sm,
              ),
              Text(
                TTexts.supportSubTitle.tr,
                style: Theme.of(context).textTheme.labelMedium!.apply(
                    color: Get.isDarkMode
                        ? TColors.darkFontColor
                        : TColors.darkerGrey),
              ),

              ListLayout(
                  itemBuilder: (_, index) => GestureDetector(
                        onTap: () => showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return onPressed[index];
                            }),
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
