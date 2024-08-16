
import '../../../../../../common/widgets/buttons/primary_button.dart';
import '../../../../../../common/widgets/layouts/list_layout.dart';
import '../../../../../../common/widgets/texts/custom_radio_text_button.dart';
import '../../../../../../data/services/exporter.dart';
import '../../../../controllers/booking_controller/cancel_change_booking_wizard_form_controller.dart';

class WhyYouCancel extends StatelessWidget {
  const WhyYouCancel({super.key, this.onContinuePressed, this.onBackPressed});

  final VoidCallback? onContinuePressed, onBackPressed;

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    final controller = CancelChangeBookingWizardFormController.instance;
    final List<String> reasons = [
      "TTexts.iNoLonger.tr",
      "TTexts.byAccident.tr,",
      "TTexts.needToCancel.tr",
      "TTexts.uncomfortable.tr",
      "TTexts.travelChange.tr",
      "TTexts.other.tr"
    ];
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        height: TDeviceUtils.getScreenHeight() * 0.78,
        child: Column(
          children: [
            Text(
              "TTexts.whyYouCancel.tr",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            ListLayout(
                separatorHeight: TSizes.md,
                itemBuilder: (_, index) => Obx(
                      () => CustomRadioButton(
                          text: reasons[index],
                          index: index,
                          selectedIndex: controller.selectedReasonOption.value,
                          onPressed: () {
                            controller.selectedReasonOption.value = index;
                            controller.reservationController.text=reasons[index];
                          }),
                    ),
                itemCount: reasons.length),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            TextFormField(
              maxLines: 5,
              controller: controller.reservationController,
              decoration: const InputDecoration(
                hintText: "TTexts.reservationHint.tr",
              ),
            ),
            const Spacer(),
            PrimaryButton(
              loading: false.obs,
              title: TTexts.sContinue.tr,
              onPressed: onContinuePressed,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            TextButton(
              onPressed: onBackPressed,
              child: Text(
                "TTexts.keepReservation.tr",
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: darkMode ? TColors.darkFontColor : TColors.darkGrey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
