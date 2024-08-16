import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/containers/background_image_container.dart';
import '../../../../../data/services/app_variables.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../../../utils/popups/general_popups/primary_popup_container.dart';
import '../../../controllers/add_properties_wizard_form_controller.dart';
import 'widgets/category_or_type/category_or_type.dart';
import 'widgets/deals_and_amenities/deals_and_amenities.dart';
import 'widgets/price_and_discount/price_and_discount.dart';
import 'widgets/property_location_and_address/property_location_and_address.dart';
import 'widgets/stepper_item.dart';
import 'widgets/title_and_gallery/title_and_gallery.dart';

class AddPropertiesWizardForm extends StatelessWidget {
  const AddPropertiesWizardForm({
    super.key,
    this.onContinuePressed,
    this.onBackPressed,
  });

  final VoidCallback? onContinuePressed, onBackPressed;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddPropertiesWizardFormController());
    return PopScope(
      onPopInvoked: (value) {
        controller.currentPageIndex.value = 0;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BackgroundImageContainer(
          child: Column(
            children: [
              /// Appbar
              TAppBar(
                leadingIcon: Get.locale == arabic
                    ? TImage.rightArrowIcon
                    : TImage.backArrow,
                leadingOnPressed: () {
                  controller.currentPageIndex.value = 0;
                  Get.back();
                },
                title: const Text("List Property"),
              ),

              /// Stepper
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: TDeviceUtils.getScreenWidth(context) * 0.05,
                    vertical: TSizes.md),
                child: Obx(
                  () => Row(
                    children: [
                      StepperItem(
                        title: "Category",
                        index: 0,
                        currentIndex: controller.currentPageIndex.value,
                        isLast: false,
                      ),
                      StepperItem(
                        title: "Location",
                        index: 1,
                        currentIndex: controller.currentPageIndex.value,
                        isLast: false,
                      ),
                      StepperItem(
                        title: "Details",
                        index: 2,
                        currentIndex: controller.currentPageIndex.value,
                        isLast: false,
                      ),
                      StepperItem(
                        title: "Gallery",
                        index: 3,
                        currentIndex: controller.currentPageIndex.value,
                        isLast: false,
                      ),
                      StepperItem(
                        title: "Charges",
                        index: 4,
                        currentIndex: controller.currentPageIndex.value,
                        isLast: true,
                      ),
                    ],
                  ),
                ),
              ),

              /// Page View Widget
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: TSizes.sm),
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: controller.pageController,
                    allowImplicitScrolling: false,
                    onPageChanged: controller.updatePageIndicator,
                    children: [
                      CategoryOrType(
                        onContinuePressed: () => controller.nextPage(),
                        onBackPressed: () {
                          controller.currentPageIndex.value = 0;
                          Get.back();
                        },
                      ),
                      PropertyLocationAndAddress(
                        onContinuePressed: () => controller.nextPage(),
                        onBackPressed: () => controller.back(),
                      ),
                      DealsAndAmenities(
                        onContinuePressed: () => controller.nextPage(),
                        onBackPressed: () => controller.back(),
                      ),
                      TitleAndGallery(
                        onContinuePressed: () => controller.nextPage(),
                        onBackPressed: () => controller.back(),
                      ),
                      PriceAndDiscount(
                        onContinuePressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => PopScope(
                                canPop: false,
                                child: PrimaryPopupContainer(
                                  headIcon: TImage.successIcon,
                                  title: TTexts.successLabel.tr,
                                  subTitle: "Property Upload Successfully",
                                  buttonText: TTexts.backToHome.tr,
                                  showCancelButton: false,
                                  onPressed: () {
                                    controller.currentPageIndex.value = 0;
                                    Get.back();
                                    Get.back();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.all(TSizes.md),
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      "Thank you for uploading your property to our platform! We're excited to help you reach potential guests and make the most of your rental opportunities. If you need any assistance, our support team is here to help.",
                                      style: Theme.of(Get.context!).textTheme.bodyMedium,
                                    ),
                                  ),
                                ),
                              ));
                        },
                        onBackPressed: () => controller.back(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
