import 'package:sejourne_owner/features/personalization/controllers/add_properties_wizard_form_controller.dart';

import '../../../../../../../common/widgets/buttons/primary_button.dart';
import '../../../../../../../common/widgets/icons/category_icon.dart';
import '../../../../../../../common/widgets/icons/dotted_circle_border_icon.dart';
import '../../../../../../../common/widgets/layouts/list_layout.dart';
import '../../../../../../../common/widgets/texts/horizontal_title_sub_title_widget.dart';
import '../../../../../../../common/widgets/texts/section_heading_with_edit_Icon.dart';
import '../../../../../../../data/services/exporter.dart';
import '../../../../../../../utils/popups/profile_popups/add_properties_popups/place_basics_guests_counter_popup.dart';

class DealsAndAmenities extends StatelessWidget {
  const DealsAndAmenities({
    super.key,
    this.onContinuePressed,
    this.onBackPressed,
  });

  final VoidCallback? onContinuePressed, onBackPressed;

  @override
  Widget build(BuildContext context) {
    final controller = AddPropertiesWizardFormController.instance;
    final darkMode = THelperFunctions.isDarkMode(context);
    List<String> categoryTitles1 = [
      "Wifi",
      "TV",
      "Kitchen",
      "Washing Machine",
      "Free Parking on Premises",
      "Paid Parking on premises",
      "Air Conditioning",
    ];
    List<String> categoryIcons1 = [
      TImage.wifiIcon,
      TImage.tvIcon,
      TImage.kitchenIcon,
      TImage.washingMachineIcon,
      TImage.freeParkingIcon,
      TImage.paidParkingIcon,
      TImage.acIcon,
    ];
    List<String> categoryTitles2 = [
      "Smoke alarm",
      "Fist Aid kit",
      "Fire extinguisher",
      "Carbon monoxide alarm",
    ];
    List<String> categoryIcons2 = [
      TImage.smokeAlarmIcon,
      TImage.firstAidKitIcon,
      TImage.fireExtinguisherIcon,
      TImage.carbonIcon,
    ];
    List<String> categoryTitles3 = [
      "Peaceful",
      "Unique",
      "Family Friendly",
      "Stylish",
      "Central",
      "Spacious",
    ];
    List<String> categoryIcons3 = [
      TImage.peaceFullIcon,
      TImage.uniqueIcon,
      TImage.familyFriendlyIcon,
      TImage.stylishIcon,
      TImage.centralIcon,
      TImage.spaciousIcon,
    ];
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Details and Amenities",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),

            /// ====================================== describes your place section ==============================/////

            SectionHeadingWithEditIcon(
              title: "Share some basics about your place?",
              showEditButton: true,
              onPressed: () => showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return PlaceBasicsGuestsCounterPopupForm(
                      onPressed: () {
                        controller.guestsString.value = controller.guestsCounter.value
                            .toString();
                        controller.bedroomsString.value =
                            controller.bedroomsCounter.value
                                .toString();
                        controller.bedsString.value =
                            controller.bedsCounter.value
                                .toString();
                        controller.bathroomsString.value =
                            controller.bathroomsCounter.value
                                .toString();
                        controller.petsString.value =
                            controller.petsCounter.value
                                .toString();
                        controller.totalString.value = controller.totalCounter.value
                            .toString();
                        Get.back();
                      },
                    );
                  }),
            ),
            SizedBox(
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Expanded(
                    flex: 3,
                    child: SizedBox(
                      height: TSizes.pinSize,
                      width: TSizes.pinSize,
                      child: DottedCircleBorderIcon(
                        padding: 0,
                        icon: TImage.placeIcon,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.only(start: TSizes.md),
                      child: Obx(
                        () => HorizontalTitleSubTitleWidget(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          title: "Guests",
                          titleStyle: Theme.of(context).textTheme.displayLarge,
                          subTitle: controller.guestsString.value,
                          subTitleStyle: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .apply(
                                  color: darkMode
                                      ? TColors.darkFontColor
                                      : TColors.lightIconColor),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    //flex: 1,
                    child: Column(
                      children: List.generate(
                        150 ~/ 5,
                        (index) => Expanded(
                          child: Container(
                            color: index % 2 == 0
                                ? Colors.transparent
                                : darkMode
                                    ? TColors.grey2
                                    : TColors.primary,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Obx(
                      () => HorizontalTitleSubTitleWidget(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        title: "Bedrooms",
                        titleStyle: Theme.of(context).textTheme.displayLarge,
                        subTitle: controller.bedroomsString.value,
                        subTitleStyle: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .apply(
                                color: darkMode
                                    ? TColors.darkFontColor
                                    : TColors.lightIconColor),
                      ),
                    ),
                  ),
                  Expanded(
                    //flex: 1,
                    child: Column(
                      children: List.generate(
                        150 ~/ 5,
                        (index) => Expanded(
                          child: Container(
                            color: index % 2 == 0
                                ? Colors.transparent
                                : darkMode
                                    ? TColors.grey2
                                    : TColors.primary,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Obx(
                      () => HorizontalTitleSubTitleWidget(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        title: "Beds",
                        titleStyle: Theme.of(context).textTheme.displayLarge,
                        subTitle: controller.bedsString.value,
                        subTitleStyle: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .apply(
                                color: darkMode
                                    ? TColors.darkFontColor
                                    : TColors.lightIconColor),
                      ),
                    ),
                  ),
                  Expanded(
                    //flex: 1,
                    child: Column(
                      children: List.generate(
                        150 ~/ 5,
                        (index) => Expanded(
                          child: Container(
                            color: index % 2 == 0
                                ? Colors.transparent
                                : darkMode
                                    ? TColors.grey2
                                    : TColors.primary,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Obx(
                      () => HorizontalTitleSubTitleWidget(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        title: "Bathrooms",
                        titleStyle: Theme.of(context).textTheme.displayLarge,
                        subTitle: controller.bathroomsString.value,
                        subTitleStyle: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .apply(
                                color: darkMode
                                    ? TColors.darkFontColor
                                    : TColors.lightIconColor),
                      ),
                    ),
                  ),
                  Expanded(
                    //flex: 1,
                    child: Column(
                      children: List.generate(
                        150 ~/ 5,
                        (index) => Expanded(
                          child: Container(
                            color: index % 2 == 0
                                ? Colors.transparent
                                : darkMode
                                    ? TColors.grey2
                                    : TColors.primary,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Obx(
                      () => HorizontalTitleSubTitleWidget(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        title: "Animals",
                        titleStyle: Theme.of(context).textTheme.displayLarge,
                        subTitle: controller.petsString.value,
                        subTitleStyle: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .apply(
                                color: darkMode
                                    ? TColors.darkFontColor
                                    : TColors.lightIconColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /// ====================================== offer section ==============================/////
            SectionHeadingWithEditIcon(
              title: "Tell guests what your place has to offer?",
              showEditButton: false,
              onPressed: () {},
            ),
            SizedBox(
              height: 88,
              child: ListLayout(
                  physics: const AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  separatorWidth: TSizes.md,
                  itemBuilder: (_, index) => Obx(
                        () => CategoryIconButton(
                            index: index,
                            selected:controller.placeFeature.value.selectedIndexes.contains(index) ,
                            selectedIndex:
                                controller.placeFeature.value.currentSelectedIndex.value,
                            icon: categoryIcons1[index],
                            category: categoryTitles1[index],
                            onPressed: () {
                              if (controller.placeFeature.value.selectedIndexes.contains(index)) {
                                controller.placeFeature.value.removeItem(index);
                                controller.placeFeature.value.currentSelectedIndex.value =
                                    0; // Reset current selected index
                              } else {
                                controller.placeFeature.value.addItem(index);
                                controller.placeFeature.value.currentSelectedIndex.value =
                                    index; // Update current selected index
                              }
                            },
                        ),
                      ),
                  itemCount: categoryTitles1.length
              ),
            ),

            /// ====================================== safety section ==============================/////
            SectionHeadingWithEditIcon(
              title: "Do you have any these safety items?",
              showEditButton: false,
              onPressed: () {},
            ),
            SizedBox(
              height: 88,
              child: ListLayout(
                  physics: const AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  separatorWidth: TSizes.md,
                  itemBuilder: (_, index) => Obx(
                        () => CategoryIconButton(
                          index: index,
                          selected:controller.placeSafetyItems.value.selectedIndexes.contains(index) ,
                          selectedIndex:
                          controller.placeSafetyItems.value.currentSelectedIndex.value,
                          icon: categoryIcons2[index],
                          category: categoryTitles2[index],
                          onPressed: () {
                            if (controller.placeSafetyItems.value.selectedIndexes.contains(index)) {
                              controller.placeSafetyItems.value.removeItem(index);
                              controller.placeSafetyItems.value.currentSelectedIndex.value =
                              0; // Reset current selected index
                            } else {
                              controller.placeSafetyItems.value.addItem(index);
                              controller.placeSafetyItems.value.currentSelectedIndex.value =
                                  index; // Update current selected index
                            }
                          },
                        ),
                      ),
                  itemCount: categoryTitles2.length),
            ),

            /// ====================================== describes your place section ==============================/////
            SectionHeadingWithEditIcon(
              title: "Which of these best describes your place?",
              showEditButton: false,
              onPressed: () {},
            ),
            SizedBox(
              height: 88,
              child: ListLayout(
                  physics: const AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  separatorWidth: TSizes.md,
                  itemBuilder: (_, index) => Obx(
                        () => CategoryIconButton(
                          index: index,
                          selected:controller.placeDescriptionItems.value.selectedIndexes.contains(index) ,
                          selectedIndex:
                          controller.placeDescriptionItems.value.currentSelectedIndex.value,
                          icon: categoryIcons3[index],
                          category: categoryTitles3[index],
                          onPressed: () {
                            if (controller.placeDescriptionItems.value.selectedIndexes.contains(index)) {
                              controller.placeDescriptionItems.value.removeItem(index);
                              controller.placeDescriptionItems.value.currentSelectedIndex.value =
                              0; // Reset current selected index
                            } else {
                              controller.placeDescriptionItems.value.addItem(index);
                              controller.placeDescriptionItems.value.currentSelectedIndex.value =
                                  index; // Update current selected index
                            }
                          },
                        ),
                      ),
                  itemCount: categoryTitles3.length),
            ),

            const SizedBox(
              height: TSizes.spaceBtwItems * 2,
            ),
            PrimaryButton(
              loading: false.obs,
              title: TTexts.sContinue.tr,
              onPressed: onContinuePressed,
            ),

            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),

            Center(
              child: TextButton(
                  onPressed: onBackPressed,
                  child: Text(
                    textAlign: TextAlign.center,
                    TTexts.backLabel.tr,
                    style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color:
                            darkMode ? TColors.darkFontColor : TColors.darkGrey),
                  )),
            ),

            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
          ],
        ),
      ),
    );
  }
}
