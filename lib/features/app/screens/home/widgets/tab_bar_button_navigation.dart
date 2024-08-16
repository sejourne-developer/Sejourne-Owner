import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sejourne_owner/common/widgets/custom_shapes/containers/status_container.dart';
import 'package:sejourne_owner/features/app/controllers/home/home_controller.dart';
import '../../../../../utils/constants/sizes.dart';

class TabBarButton extends StatelessWidget {
  const TabBarButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    // final dark = THelperFunctions.isDarkMode(context);

    // List<String> label = ["Completed", "Ongoing Stays", "Upcoming"];
    return SizedBox(
      height: 56,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:TSizes.sm,vertical: TSizes.md),
        child: Obx(
            ()=> Row(children: [
            InkWell(
              onTap: (){
                controller.tabBarButtonClicked(0);
              },
              child: StatusContainer(
                isGradient: controller.isGra1.value,
                textStyle: controller.isGra1.value
                    ? Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .apply(color: Colors.white)
                    : null,
                backgroundColor: Colors.white,
                label: "Completed",
              ),
            ),
            const SizedBox(
              width: TSizes.xs,
            ),
            InkWell(
              onTap: (){
                controller.tabBarButtonClicked(1);
              },
              child: StatusContainer(
                isGradient: controller.isGra2.value,
                textStyle: controller.isGra2.value
                    ? Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .apply(color: Colors.white)
                    : null,
                backgroundColor: Colors.white,
                label: "Ongoing Stays",
              ),
            ),
            const SizedBox(
              width: TSizes.xs,
            ),
            InkWell(
              onTap: (){
                controller.tabBarButtonClicked(2);
              },
              child: StatusContainer(
                isGradient: controller.isGra3.value,
                textStyle: controller.isGra3.value
                    ? Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .apply(color: Colors.white)
                    : null,
                backgroundColor: Colors.white,
                label: "Upcoming",
              ),
            ),
            const SizedBox(
              width: TSizes.xs,
            ),
          ]),
        ),
      ),
    );
  }
}
