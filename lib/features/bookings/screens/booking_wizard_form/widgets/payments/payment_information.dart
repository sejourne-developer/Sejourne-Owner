import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';
import '../../../../../../common/widgets/buttons/primary_button.dart';
import '../../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../../common/widgets/texts/section_heading_with_edit_Icon.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/text_strings.dart';
import '../../../../../../utils/device/device_utility.dart';
import '../../../../../../utils/helpers/helper_functions.dart';
import '../../../../../../utils/popups/general_popups/add_card_pop_up_form.dart';
import 'widgets/booking_card_container.dart';

class PaymentInformation extends StatelessWidget {
  const PaymentInformation(
      {super.key, this.onContinuePressed, this.onBackPressed});

  final VoidCallback? onContinuePressed, onBackPressed;

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        height: TDeviceUtils.getScreenHeight() * 0.81,
        child: Column(
          children: [
            Text(
              TTexts.paymentInformationLabel.tr,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: TSizes.md,
            ),
            GroupButton<int>(
              buttons: const [1, 2],
              // onSelected: (v, v1, v2) => print("object"),
              buttonBuilder: (selected, selectedCard, context) {
                return BookingCardContainer(
                  isSelected: selected,
                  cardName: "Catalin Pustai",
                  cardNum: "4442-3434-3434-3344",
                  cardExpDate: "Exp: 01/12",
                  cardCvv: "CVV: 211",
                );
              },
            ),
            // const BookingCardContainer(
            //   isSelected: true,
            //   cardName: "Catalin Pustai",
            //   cardNum: "4442-3434-3434-3344",
            //   cardExpDate: "Exp: 01/12",
            //   cardCvv: "CVV: 211",
            // ),
            // const SizedBox(
            //   height: TSizes.spaceBtwItems,
            // ),
            // const BookingCardContainer(
            //   isSelected: false,
            //   cardName: "Catalin Pustai",
            //   cardNum: "4442-3434-3434-3344",
            //   cardExpDate: "Exp: 01/12",
            //   cardCvv: "CVV: 211",
            // ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            InkWell(
              onTap: () => showDialog(
                  context: context,
                  builder: (context) => const AddCardPopUpForm()),
              child: TRoundedContainer(
                width: double.infinity,
                radius: TSizes.sm,
                padding: const EdgeInsetsDirectional.all(TSizes.md),
                child: Center(
                  child: Text(
                    TTexts.addNewCard.tr,
                    style: Theme.of(context).textTheme.bodyLarge!.apply(
                        color: THelperFunctions.isDarkMode(context)
                            ? TColors.darkFontColor
                            : TColors.grey2),
                  ),
                ),
              ),
            ),
            SectionHeadingWithEditIcon(
                title: TTexts.priceDetailsLabel.tr,
                showEditButton: false,
                onPressed: () {}),
            ConstrainedBox(
              constraints: const BoxConstraints(
                  maxHeight: double.infinity, minHeight: 56),
              child: ListView.separated(
                itemCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (_, index) => const SizedBox(
                  height: TSizes.xs,
                ),
                itemBuilder: (_, index) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      index == 1
                          ? "${TTexts.cleaningFeeLabel.tr} 150 AED / ${TTexts.nightLabel.tr}"
                          : index == 2
                              ? TTexts.taxLabel.tr
                              : "1300 AED x 3 ${TTexts.nightLabel.tr}",
                      style: Theme.of(context).textTheme.labelMedium!.apply(
                          color: darkMode
                              ? TColors.darkFontColor
                              : TColors.lightIconColor),
                    ),
                    Text(
                      index == 1
                          ? "450"
                          : index == 2
                              ? "30"
                              : "3,900 AED",
                      style: Theme.of(context).textTheme.labelLarge!.apply(
                          color: darkMode
                              ? TColors.darkFontColor
                              : TColors.darkerGrey),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  TTexts.totalLabel.tr,
                  style: Theme.of(context).textTheme.labelLarge!.apply(
                      color: darkMode
                          ? TColors.darkFontColor
                          : TColors.lightIconColor),
                ),
                Text(
                  "4380 AED",
                  style: Theme.of(context).textTheme.labelLarge!.apply(
                      color: darkMode
                          ? TColors.darkFontColor
                          : TColors.darkerGrey),
                ),
              ],
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
                  TTexts.backLabel.tr,
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color:
                          darkMode ? TColors.darkFontColor : TColors.darkGrey),
                )),
          ],
        ),
      ),
    );
  }
}
