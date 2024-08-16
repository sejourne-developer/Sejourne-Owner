import 'package:sejourne_owner/common/widgets/layouts/list_layout.dart';

import '../../../common/widgets/custom_shapes/containers/booking_user_container.dart';
import '../../../data/services/exporter.dart';

class ListTab extends StatelessWidget {
  const ListTab({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> properties = [
      TImage.user3,
      TImage.user1,
      TImage.user2,
      TImage.user2,
      TImage.user4,
      TImage.user5,
      TImage.user3,
    ];
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsetsDirectional.only(
            top: TDeviceUtils.getAppBarHeight() * 2.8,
            start: TSizes.sm,
            end: TSizes.sm),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "17 April 2024",
                  style: Theme.of(context).textTheme.bodyLarge!.apply(
                      color: Get.isDarkMode
                          ? TColors.darkFontColor
                          : TColors.primary),
                ),
                Flexible(
                  flex: 8,
                  child: Row(
                    children: List.generate(
                      150 ~/ 2,
                      (index) => Expanded(
                        child: Container(
                          color: index % 2 == 0
                              ? Colors.transparent
                              : Get.isDarkMode
                                  ? TColors.grey2
                                  : TColors.primary,
                          height: 1.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  "MON".toUpperCase(),
                  style: Theme.of(context).textTheme.bodyLarge!.apply(
                        color: Get.isDarkMode
                            ? TColors.darkFontColor
                            : TColors.primary,
                      ),
                )
              ],
            ),
            ListLayout(
                padding: EdgeInsets.zero,
                itemBuilder: (_, index) => BookingUserContainer(
                      propertyImage: properties[index],
                      index: index,
                    ),
                itemCount: 2),
            const SizedBox(
              height: TSizes.md,
            ),
            Row(
              children: [
                Text(
                  "18 April 2024",
                  style: Theme.of(context).textTheme.bodyLarge!.apply(
                      color: Get.isDarkMode
                          ? TColors.darkFontColor
                          : TColors.primary),
                ),
                Flexible(
                  flex: 8,
                  child: Row(
                    children: List.generate(
                      150 ~/ 2,
                      (index) => Expanded(
                        child: Container(
                          color: index % 2 == 0
                              ? Colors.transparent
                              : Get.isDarkMode
                                  ? TColors.grey2
                                  : TColors.primary,
                          height: 1.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  "TUE".toUpperCase(),
                  style: Theme.of(context).textTheme.bodyLarge!.apply(
                        color: Get.isDarkMode
                            ? TColors.darkFontColor
                            : TColors.primary,
                      ),
                )
              ],
            ),
            ListLayout(
                padding: EdgeInsets.zero,
                itemBuilder: (_, index) => BookingUserContainer(
                      propertyImage: properties[index],
                      index: index,
                    ),
                itemCount: 4),
            const SizedBox(
              height: TSizes.sm,
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections * 2,
            ),
          ],
        ),
      ),
    );
  }
}
