import 'package:sejourne_owner/features/personalization/controllers/add_properties_wizard_form_controller.dart';

import '../../../../common/widgets/buttons/primary_button.dart';
import '../../../../common/widgets/custom_shapes/containers/onboarding_background_container.dart';
import '../../../../common/widgets/icons/circular_icon.dart';
import '../../../../common/widgets/icons/dotted_circle_border_icon.dart';
import '../../../../common/widgets/texts/custom_radio_text_button.dart';
import '../../../../common/widgets/texts/horizontal_icon_text.dart';
import '../../../../data/services/exporter.dart';
import '../../general_popups/loaders.dart';

class PlaceBasicsGuestsCounterPopupForm extends StatelessWidget {
  const PlaceBasicsGuestsCounterPopupForm({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = AddPropertiesWizardFormController.instance;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: TRoundedContainer(
          constraints: BoxConstraints(
              maxHeight: TDeviceUtils.getScreenHeight() * 0.84, minHeight: 56),
          width: double.infinity,
          // height: double.infinity,
          showBorder: false,
          margin: const EdgeInsets.symmetric(
              vertical: TSizes.appBarHeight, horizontal: TSizes.md),
          child: SingleChildScrollView(
            child: Column(
              children: [
                /// upper Circle
                Stack(
                  children: [
                    OnBoardingBackgroundContainer(
                      radius: TSizes.md,
                      height: TDeviceUtils.getScreenHeight() * 0.20,
                      child: const SizedBox(),
                    ),
                    const Align(
                      alignment: AlignmentDirectional.topCenter,
                      child: DottedCircleBorderIcon(
                        iconSize: TSizes.pinSize,
                        icon: TImage.houseIcon2,
                        borderColor: TColors.darkPrimaryBorderColor,
                      ),
                    ),
                    PositionedDirectional(
                        start: TDeviceUtils.getScreenWidth(context) * 0.5,
                        bottom: TSizes.md,
                        child: TRoundedContainer(
                          width: TSizes.iconLg,
                          height: TSizes.iconLg,
                          radius: 100,
                          child: Center(
                              child: Obx(() => Text(
                                  controller.totalCounter.value.toString()))),
                        )),
                  ],
                ),
                const SizedBox(
                  height: TSizes.md,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.symmetric(
                      horizontal: TSizes.spaceBtwSections),
                  child: Text(
                    textAlign: TextAlign.center,
                    "Share some basics about your place?",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                const SizedBox(
                  height: TSizes.sm,
                ),

                Padding(
                  padding: const EdgeInsets.all(TSizes.md),
                  child: Row(
                    children: [
                      Flexible(
                          flex: 3,
                          child: HorizontalIconText(
                            icon: TImage.adultsIcon,
                            title: "Guests",
                            isSub: false,
                            iconColor:
                                dark ? TColors.darkIconColor : TColors.primary,
                            iconSize: TSizes.md,
                            titleTextStyle: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .apply(
                                    color: dark
                                        ? TColors.darkFontColor
                                        : TColors.primary),
                          )),
                      Flexible(
                        flex: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TCircularIcon(
                              showBorder: false,
                              icon: TImage.minusIcon,
                              size: TSizes.sm,
                              backgroundColor: dark
                                  ? TColors.darkContainer
                                  : TColors.softGrey,
                              padding: TSizes.sm,
                              onPressed: () {
                                if (controller.guestsCounter.value == 0) {
                                  TLoaders.errorSnackBar(
                                    title: TTexts.errorTitle.tr,
                                    message: '${TTexts.minimumLabel.tr} 0',
                                  );
                                } else {
                                  controller.guestsCounter.value--;
                                  controller.total();
                                }
                              },
                            ),
                            Obx(() => Text(
                                controller.guestsCounter.value.toString())),
                            TCircularIcon(
                              showBorder: false,
                              icon: TImage.statusAddIcon,
                              size: TSizes.sm,
                              backgroundColor:
                                  dark ? TColors.black : TColors.grey2,
                              padding: TSizes.sm,
                              onPressed: () {
                                controller.guestsCounter.value++;
                                controller.total();
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(TSizes.md),
                  child: Row(
                    children: [
                      Flexible(
                          flex: 3,
                          child: HorizontalIconText(
                            icon: TImage.propertiesIcon,
                            title: "Bedrooms",
                            isSub: false,
                            iconColor:
                                dark ? TColors.darkIconColor : TColors.primary,
                            iconSize: TSizes.md,
                            titleTextStyle: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .apply(
                                    color: dark
                                        ? TColors.darkFontColor
                                        : TColors.primary),
                          )),
                      Flexible(
                        flex: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TCircularIcon(
                              showBorder: false,
                              icon: TImage.minusIcon,
                              size: TSizes.sm,
                              backgroundColor: dark
                                  ? TColors.darkContainer
                                  : TColors.softGrey,
                              padding: TSizes.sm,
                              onPressed: () {
                                if (controller.bedroomsCounter.value == 0) {
                                  TLoaders.errorSnackBar(
                                    title: TTexts.errorTitle.tr,
                                    message: '${TTexts.minimumLabel.tr} 0',
                                  );
                                } else {
                                  controller.bedroomsCounter.value--;
                                  controller.total();
                                }
                              },
                            ),
                            Obx(() => Text(
                                controller.bedroomsCounter.value.toString())),
                            TCircularIcon(
                              showBorder: false,
                              icon: TImage.statusAddIcon,
                              size: TSizes.sm,
                              backgroundColor:
                                  dark ? TColors.black : TColors.grey2,
                              padding: TSizes.sm,
                              onPressed: () {
                                controller.bedroomsCounter.value++;
                                controller.total();
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(TSizes.md),
                  child: Row(
                    children: [
                      Flexible(
                          flex: 3,
                          child: HorizontalIconText(
                            icon: TImage.bedsIcon,
                            title: "Beds",
                            isSub: false,
                            iconColor:
                                dark ? TColors.darkIconColor : TColors.primary,
                            iconSize: TSizes.md,
                            titleTextStyle: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .apply(
                                    color: dark
                                        ? TColors.darkFontColor
                                        : TColors.primary),
                          )),
                      Flexible(
                        flex: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TCircularIcon(
                              showBorder: false,
                              icon: TImage.minusIcon,
                              size: TSizes.sm,
                              backgroundColor: dark
                                  ? TColors.darkContainer
                                  : TColors.softGrey,
                              padding: TSizes.sm,
                              onPressed: () {
                                if (controller.bedsCounter.value == 0) {
                                  TLoaders.errorSnackBar(
                                    title: TTexts.errorTitle.tr,
                                    message: '${TTexts.minimumLabel.tr} 0',
                                  );
                                } else {
                                  controller.bedsCounter.value--;
                                  controller.total();
                                }
                              },
                            ),
                            Obx(() =>
                                Text(controller.bedsCounter.value.toString())),
                            TCircularIcon(
                              showBorder: false,
                              icon: TImage.statusAddIcon,
                              size: TSizes.sm,
                              backgroundColor:
                                  dark ? TColors.black : TColors.grey2,
                              padding: TSizes.sm,
                              onPressed: () {
                                controller.bedsCounter.value++;
                                controller.total();
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(TSizes.md),
                  child: Row(
                    children: [
                      Flexible(
                          flex: 3,
                          child: HorizontalIconText(
                            icon: TImage.bathRoomsIcon,
                            title: "Bathrooms",
                            isSub: false,
                            iconColor:
                                dark ? TColors.darkIconColor : TColors.primary,
                            iconSize: TSizes.md,
                            titleTextStyle: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .apply(
                                    color: dark
                                        ? TColors.darkFontColor
                                        : TColors.primary),
                          )),
                      Flexible(
                        flex: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TCircularIcon(
                              showBorder: false,
                              icon: TImage.minusIcon,
                              size: TSizes.sm,
                              backgroundColor: dark
                                  ? TColors.darkContainer
                                  : TColors.softGrey,
                              padding: TSizes.sm,
                              onPressed: () {
                                if (controller.bathroomsCounter.value == 0) {
                                  TLoaders.errorSnackBar(
                                    title: TTexts.errorTitle.tr,
                                    message: '${TTexts.minimumLabel.tr} 0',
                                  );
                                } else {
                                  controller.bathroomsCounter.value--;
                                  controller.total();
                                }
                              },
                            ),
                            Obx(() => Text(
                                controller.bathroomsCounter.value.toString())),
                            TCircularIcon(
                              showBorder: false,
                              icon: TImage.statusAddIcon,
                              size: TSizes.sm,
                              backgroundColor:
                                  dark ? TColors.black : TColors.grey2,
                              padding: TSizes.sm,
                              onPressed: () {
                                controller.bathroomsCounter.value++;
                                controller.total();
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
                  child: Divider(
                    thickness: 0.5,
                    color: Get.isDarkMode
                        ? TColors.darkPrimaryBorderColor
                        : TColors.lightPrimaryBorderColor,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(TSizes.md),
                  child: Row(
                    children: [
                      Flexible(
                          flex: 3,
                          child: HorizontalIconText(
                            icon: TImage.petsIcon,
                            title: TTexts.petsLabel.tr,
                            isSub: false,
                            iconColor:
                                dark ? TColors.darkIconColor : TColors.primary,
                            iconSize: TSizes.md,
                            titleTextStyle:
                                Theme.of(context).textTheme.labelMedium,
                          )),
                      Flexible(
                        flex: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(
                              () => CustomRadioButton(
                                  spaceBetweenRadioAndText: TSizes.sm,
                                  text: TTexts.yesLabel.tr,
                                  index: 1,
                                  selectedIndex:
                                      controller.selectedPetOption.value,
                                  onPressed: () {
                                    controller.selectedPetOption.value = 1;
                                  }),
                            ),
                            Obx(
                              () => CustomRadioButton(
                                  spaceBetweenRadioAndText: TSizes.sm,
                                  text: TTexts.noLabel.tr,
                                  index: 0,
                                  selectedIndex:
                                      controller.selectedPetOption.value,
                                  onPressed: () {
                                    controller.selectedPetOption.value = 0;
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Obx(
                    ()=> AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                    height: controller.selectedPetOption.value==0?0:56,
                    margin: const EdgeInsetsDirectional.symmetric(horizontal: TSizes.md),
                    padding: const EdgeInsetsDirectional.symmetric(horizontal: TSizes.md),
                    child: Row(
                      children: [
                        Flexible(
                            flex: 3,
                            child: HorizontalIconText(
                              icon: TImage.petsIcon,
                              title: "Animals",
                              isSub: false,
                              iconColor:
                              dark ? TColors.darkIconColor : TColors.primary,
                              iconSize: TSizes.md,
                              titleTextStyle: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .apply(
                                  color: dark
                                      ? TColors.darkFontColor
                                      : TColors.primary),
                            )),
                        Flexible(
                          flex: 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TCircularIcon(
                                showBorder: false,
                                icon: TImage.minusIcon,
                                size: TSizes.sm,
                                backgroundColor: dark
                                    ? TColors.darkContainer
                                    : TColors.softGrey,
                                padding: TSizes.sm,
                                onPressed: () {
                                  if (controller.petsCounter.value == 0) {
                                    TLoaders.errorSnackBar(
                                      title: TTexts.errorTitle.tr,
                                      message: '${TTexts.minimumLabel.tr} 0',
                                    );
                                  } else {
                                    controller.petsCounter.value--;
                                    controller.total();
                                  }
                                },
                              ),
                              Obx(() =>
                                  Text(controller.petsCounter.value.toString())),
                              TCircularIcon(
                                showBorder: false,
                                icon: TImage.statusAddIcon,
                                size: TSizes.sm,
                                backgroundColor:
                                dark ? TColors.black : TColors.grey2,
                                padding: TSizes.sm,
                                onPressed: () {
                                  controller.petsCounter.value++;
                                  controller.total();
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsetsDirectional.symmetric(
                      horizontal: TSizes.md, vertical: TSizes.sm),
                  child: PrimaryButton(
                    loading: false.obs,
                    title: TTexts.saveLabel.tr,
                    onPressed: onPressed,
                  ),
                ),

                Padding(
                  padding: const EdgeInsetsDirectional.symmetric(
                      horizontal: TSizes.md),
                  child: TextButton(
                    onPressed: () => Get.back(),
                    child: Text(
                      TTexts.cancelLabel.tr,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
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
