import 'package:sejourne_owner/features/personalization/screens/properties/add_properties_wizard_form/widgets/title_and_gallery/widgets/add_property_images.dart';

import '../../../../../../../common/widgets/buttons/primary_button.dart';
import '../../../../../../../common/widgets/texts/section_heading_with_edit_icon.dart';
import '../../../../../../../data/services/exporter.dart';
import '../../../../../controllers/add_properties_wizard_form_controller.dart';

class TitleAndGallery extends StatelessWidget {
  const TitleAndGallery(
      {super.key, this.onContinuePressed, this.onBackPressed});

  final VoidCallback? onContinuePressed, onBackPressed;

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    final controller = AddPropertiesWizardFormController.instance;

    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsetsDirectional.symmetric(horizontal: TSizes.md),
            child: Text(
              "Title and Gallery",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          SectionHeadingWithEditIcon(
            title: "Let's give your house a title",
            showEditButton: false,
            onPressed: () {},
          ),
          TextFormField(
            controller: controller.propertyTitleController,
            decoration: const InputDecoration(
              hintText: "Title of the property",
            ),
          ),
          const SizedBox(
            height: TSizes.md,
          ),
          TextFormField(
            controller: controller.propertyDescriptionController,
            maxLines: 5,
            decoration: const InputDecoration(
              hintText: "Create your description",
            ),
          ),
          SectionHeadingWithEditIcon(
            title: "Add some photos of your property",
            showEditButton: false,
            onPressed: () {},
          ),
          const SizedBox(
            height: TSizes.md,
          ),
          AddPropertyImages(images: controller.propertyImageList),
          const SizedBox(
            height: TSizes.md,
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
