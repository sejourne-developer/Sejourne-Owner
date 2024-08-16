
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../data/services/exporter.dart';
import '../../../app/controllers/product_details/booking_wizard_form_controller.dart';
import 'widgets/billing_address/billing_address.dart';
import 'widgets/booking_summary/booking_summary.dart';
import 'widgets/payments/payment_information.dart';
import 'widgets/stepper_item.dart';
import 'widgets/thanks/thanks.dart';

class BookingWizardForm extends StatelessWidget {
  const BookingWizardForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller =Get.put(BookingWizardFormController());

    return PopScope(
      onPopInvoked: (value) => controller.currentPageIndex.value = 0,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BackgroundImageContainer(
          child: Column(
            children: [
              /// Appbar
              TAppBar(
                leadingIcon:Get.locale==arabic?TImage.rightArrowIcon: TImage.backArrow,
                leadingOnPressed: () {
                  controller.currentPageIndex.value = 0;
                  Get.back();
                },
                title:  Text(TTexts.myBookingsLabel.tr),
              ),

              /// Stepper
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: TDeviceUtils.getScreenWidth(context) * 0.15,
                    vertical: TSizes.md),
                child: Obx(
                  () => Row(
                    children: [
                      StepperItem(
                        title: TTexts.summaryLabel.tr,
                        index: 0,
                        currentIndex: controller.currentPageIndex.value,
                        isLast: false,
                      ),
                      StepperItem(
                        title: TTexts.paymentLabel.tr,
                        index: 1,
                        currentIndex: controller.currentPageIndex.value,
                        isLast: false,
                      ),
                      StepperItem(
                        title: TTexts.addressLabel.tr,
                        index: 2,
                        currentIndex: controller.currentPageIndex.value,
                        isLast: false,
                      ),
                      StepperItem(
                        title: TTexts.thanksLabel.tr,
                        index: 3,
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
                      /// Page 1 Booking Summary
                      BookingSummary(
                        onPressed: () {
                          controller.nextPage();
                        },
                      ),

                      PaymentInformation(
                        onContinuePressed: () => controller.nextPage(),
                        onBackPressed: () => controller.back(),
                      ),
                      BillingAddress(
                        onContinuePressed: () => controller.nextPage(),
                        onBackPressed: () => controller.back(),
                      ),

                      Thanks(
                        onPressed: () {
                          controller.currentPageIndex.value = 0;
                          Get.back();
                        },
                      )
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
