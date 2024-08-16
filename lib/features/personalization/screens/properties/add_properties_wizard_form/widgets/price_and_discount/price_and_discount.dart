import 'package:flutter/foundation.dart';
import 'package:group_button/group_button.dart';

import '../../../../../../../common/widgets/buttons/primary_button.dart';
import '../../../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../../../common/widgets/layouts/profile_features_item_list.dart';
import '../../../../../../../common/widgets/texts/section_heading_with_edit_icon.dart';
import '../../../../../../../data/services/exporter.dart';
import '../../../../../controllers/add_properties_wizard_form_controller.dart';

class PriceAndDiscount extends StatelessWidget {
  const PriceAndDiscount(
      {super.key, this.onContinuePressed, this.onBackPressed});

  final VoidCallback? onContinuePressed, onBackPressed;

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    final controller = AddPropertiesWizardFormController.instance;
    List<String> title = ["New listing promotion", "Weekly discount", "Monthly discount"];
    List<String> subTitle = [
      "Enjoy the privacy and comfort of having the entire space to yourself.",
      "Stay in a cozy private room within a shared property. Ideal for solo travelers or couples looking for a comfortable and affordable option.",
      "Experience communal living in a shared room. Great for budget-conscious travelers and those looking to meet new people."
    ];
    List<String> discount = [
      "20",
      "10",
      "5"
    ];
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsetsDirectional.symmetric(horizontal: TSizes.md),
            child: Text(
              "Price and Discount ",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          SectionHeadingWithEditIcon(
            title: "Set your price",
            showEditButton: false,
            onPressed: () {},
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 2,
                child: TCircularIcon(
                  showBorder: false,
                  icon: TImage.minusIcon,
                  color: darkMode ? TColors.darkIconColor : TColors.white,
                  size: TSizes.sm,
                  height: 40,
                  width: 40,
                  backgroundColor:
                      darkMode ? TColors.darkContainer : TColors.primary,
                  padding: TSizes.sm + 2,
                  onPressed: () {
                    if (controller.priceController.text.isNotEmpty) {
                      int price = int.parse(controller.priceController.text);
                      if (price > 100) {
                        controller.priceController.text =
                            (price - 100).toString();
                      }
                    }
                  },
                ),
              ),
              Flexible(
                flex: 6,
                child: TextFormField(
                  controller: controller.priceController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: "Set your price",
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: TCircularIcon(
                  showBorder: false,
                  icon: TImage.statusAddIcon,
                  height: 40,
                  width: 40,
                  color: darkMode ? TColors.darkIconColor : TColors.white,
                  backgroundColor: darkMode ? TColors.black : TColors.primary,
                  padding: TSizes.sm + 2,
                  onPressed: () {
                    if (controller.priceController.text.isEmpty) {
                      controller.priceController.text = 100.toString();
                    } else {
                      int price = int.parse(controller.priceController.text);
                      controller.priceController.text =
                          (price + 100).toString();
                    }
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.symmetric(
                horizontal: TDeviceUtils.getScreenWidth(context) * 0.1,
                vertical: TSizes.md),
            child: Text(
              textAlign: TextAlign.center,
              "Places like yours in your area usually range from 1,343 AED to 2,155 AED",
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
          SectionHeadingWithEditIcon(
            title: "Add discount",
            showEditButton: false,
            onPressed: () {},
          ),
          GroupButton<String>(
            buttons: title,
            isRadio: false,
            onSelected: (title,index,selected){
              if (kDebugMode) {
                print(title);
              }
              if (kDebugMode) {
                print(index);

              print(selected);}
            },
            buttonIndexedBuilder: (selected,index,_){
              return Container(
                padding: EdgeInsets.zero,
                margin: const EdgeInsetsDirectional.only(bottom: TSizes.md),
                decoration: BoxDecoration(
                  color:
                  Get.isDarkMode ? TColors.darkContainer : TColors.white,
                  border: selected
                      ? Border.all(width: 2, color: TColors.accent)
                      : null,
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
                child: ProfileFeaturesItemList(
                  text: discount[index],
                  isText: true,
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
              );
            },
          ),
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
                  color: darkMode ? TColors.darkFontColor : TColors.darkGrey),
            ),
          ),
        ],
      ),
    );
  }
}
