import 'package:flutter/material.dart';
import 'package:sejourne_owner/common/widgets/layouts/list_layout.dart';
import '../../../../../common/widgets/custom_shapes/containers/booking_user_container.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class Properties extends StatelessWidget {
  const Properties({super.key});

  @override
  Widget build(BuildContext context) {
    //final dark=THelperFunctions.isDarkMode(context);
    List<String> properties = [
      TImage.user3,
      TImage.user1,
      TImage.user2,
      TImage.user2,
      TImage.user4,
      TImage.user5,
      TImage.user3,
    ];
    return Padding(
      padding: const EdgeInsets.only(bottom: TSizes.appBarHeight),
      child: ListLayout(
        itemCount: properties.length,
        scrollDirection: Axis.vertical,
        padding: const EdgeInsetsDirectional.symmetric(horizontal: TSizes.sm),
        itemBuilder: (_, index) {
          return InkWell(
            //onTap: () => Get.to(() => const ProductDetailScreen()),
            child: BookingUserContainer(
              propertyImage: properties[index],
              index: index,
            ),
          );
        },
        separatorHeight:  TSizes.spaceBtwItems,
      ),
    );
  }
}
