import 'package:sejourne_owner/common/widgets/appbar/appbar.dart';
import 'package:sejourne_owner/common/widgets/layouts/list_layout.dart';
import 'package:sejourne_owner/common/widgets/texts/horizontal_icon_text.dart';
import 'package:sejourne_owner/features/personalization/screens/properties/add_properties_wizard_form/add_properties_wizard_form.dart';
import '../../../../common/widgets/custom_shapes/containers/property_container.dart';
import '../../../../data/services/exporter.dart';

class PropertiesScreen extends StatelessWidget {
  const PropertiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> properties = [
      TImage.property,
      TImage.property1,
      TImage.property2,
      TImage.property3,
      TImage.property4,
      TImage.property5,
      TImage.property6,
    ];
    return Scaffold(
      body: BackgroundImageContainer(
          child: SingleChildScrollView(
        child: Column(
          children: [
            TAppBar(
              leadingIcon: TImage.backArrow,
              title: const Text("Properties"),
              actions: [
                TRoundedContainer(
                  onPressed: ()=>Get.to(()=>const AddPropertiesWizardForm()),
                  // width: 56,
                  margin: const EdgeInsetsDirectional.only(end: TSizes.sm),
                  radius: 10,
                  height: 32,
                  padding: const EdgeInsetsDirectional.symmetric(horizontal: TSizes.sm),
                  child: HorizontalIconText(
                    iconColor:THelperFunctions.isDarkMode(context)? TColors.darkIconColor:TColors.primary,
                    icon: TImage.propertiesIcon2, title: "Add properties",isSub: false,
                  ),
                )
              ],
            ),

            ListLayout(
                separatorHeight: TSizes.md,
                padding:
                    const EdgeInsetsDirectional.symmetric(horizontal: TSizes.sm,vertical: TSizes.sm),
                itemBuilder: (_, index) => PropertyWidget(
                      isFav: false.obs,
                      propertyImage: properties[index],
                      index: index,
                      com: false.obs,
                      isApproved: true.obs,
                      margin: EdgeInsets.zero,
                    ),
                itemCount: properties.length),
          ],
        ),
      )),
    );
  }
}
