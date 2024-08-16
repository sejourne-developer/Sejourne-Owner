import 'package:sejourne_owner/features/personalization/controllers/add_properties_wizard_form_controller.dart';

import '../../../../../../../common/widgets/buttons/primary_button.dart';
import '../../../../../../../common/widgets/icons/category_icon.dart';
import '../../../../../../../common/widgets/layouts/list_layout.dart';
import '../../../../../../../common/widgets/layouts/profile_features_item_list.dart';
import '../../../../../../../common/widgets/texts/section_heading_with_edit_Icon.dart';
import '../../../../../../../data/services/exporter.dart';

class CategoryOrType extends StatelessWidget {
  const CategoryOrType({
    super.key,
    this.onContinuePressed,
    this.onBackPressed,
  });

  final VoidCallback? onContinuePressed, onBackPressed;

  @override
  Widget build(BuildContext context) {
    final controller = AddPropertiesWizardFormController.instance;
    final darkMode = THelperFunctions.isDarkMode(context);
    List<String> categoryTitles = [
      "House",
      "Flat or Apartment",
      "Barn",
      "Bed & Breakfast",
      "Boat",
      "Cabin",
      "Campervan or Motorhome",
    ];
    List<String> categoryIcons = [
      TImage.houseIcon2,
      TImage.flatIcon,
      TImage.barnIcon,
      TImage.bedRoomsIcon,
      TImage.boatIcon,
      TImage.cabinIcon,
      TImage.busIcon,
    ];
    List<String> title = ["An entire place", "A room", "A shared room"];
    List<String> subTitle = [
      "Enjoy the privacy and comfort of having the entire space to yourself.",
      "Stay in a cozy private room within a shared property. Ideal for solo travelers or couples looking for a comfortable and affordable option.",
      "Experience communal living in a shared room. Great for budget-conscious travelers and those looking to meet new people."
    ];
    List<String> icons = [
      TImage.entirePlaceIcon,
      TImage.roomIcon,
      TImage.sharedRoomIcon
    ];
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            "Category or Type",
            style: Theme.of(context).textTheme.titleMedium,
          ),
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
                        isMultiple: false,
                        selectedIndex: controller.selectCategoryOption.value,
                        icon: categoryIcons[index],
                        category: categoryTitles[index],
                        onPressed: () =>
                            controller.selectCategoryOption.value = index,
                      ),
                    ),
                itemCount: categoryTitles.length),
          ),

          SectionHeadingWithEditIcon(
            title: "What type of place will guests have?",
            showEditButton: false,
            onPressed: () {},
          ),

          const SizedBox(
            height: TSizes.sm,
          ),

          ListLayout(
            itemCount: title.length,
            padding: EdgeInsets.zero,
            itemBuilder: (_, index) => Obx(
              () => InkWell(
                onTap: () => controller.selectOption.value = index,
                child: Container(
                  padding: EdgeInsets.zero,
                  margin: const EdgeInsetsDirectional.only(bottom: TSizes.md),
                  decoration: BoxDecoration(
                    color:
                        Get.isDarkMode ? TColors.darkContainer : TColors.white,
                    border: controller.selectOption.value == index
                        ? Border.all(width: 2, color: TColors.accent)
                        : null,
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                  ),
                  child: ProfileFeaturesItemList(
                    icon: icons[index],
                    title: title[index],
                    showEditButton: false,
                    subTitle: subTitle[index],
                    margin: EdgeInsets.zero,
                    isDottedBorder: true,
                    subTitleStyle: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .apply(
                            color: Get.isDarkMode
                                ? TColors.darkFontColor
                                : TColors.black.withOpacity(0.8)),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwSections,),
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
                TTexts.cancelLabel.tr,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: darkMode ? TColors.darkFontColor : TColors.darkGrey),
              )),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),
        ],
      ),
    );
  }
}
