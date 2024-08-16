import '../../../../common/widgets/custom_shapes/containers/status_container.dart';
import '../../../../data/services/exporter.dart';
import '../../controllers/home/home_controller.dart';
import 'widgets/home_header.dart';
import 'widgets/properties.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController=Get.put(HomeController());
    List<Widget> myTabs = <Widget>[
      Obx(
            () => StatusContainer(
          padding: const EdgeInsets.symmetric(
              horizontal: TSizes.sm, vertical: TSizes.sm),
          isGradient: homeController.isGra1.value,
          textStyle: homeController.isGra1.value
              ? Theme.of(context)
              .textTheme
              .bodySmall!
              .apply(color: Colors.white)
              : null,
          backgroundColor: Colors.white,
          label: TTexts.completedLabel.tr,
        ),
      ),
      Obx(
            () => StatusContainer(
          padding: const EdgeInsets.symmetric(
              horizontal: TSizes.sm, vertical: TSizes.sm),
          isGradient: homeController.isGra2.value,
          textStyle: homeController.isGra2.value
              ? Theme.of(context)
              .textTheme
              .bodySmall!
              .apply(color: Colors.white)
              : null,
          backgroundColor: Colors.white,
          label: TTexts.ongoingStaysLabel.tr,
        ),
      ),
      Obx(
            () => StatusContainer(
          padding: const EdgeInsets.symmetric(
              horizontal: TSizes.sm, vertical: TSizes.sm),
          isGradient: homeController.isGra3.value,
          textStyle: homeController.isGra3.value
              ? Theme.of(context)
              .textTheme
              .bodySmall!
              .apply(color: Colors.white)
              : null,
          backgroundColor: Colors.white,
          label: TTexts.upcomingLabel.tr,
        ),
      ),
    ];
    List<Widget> tabsBody = [
      const Properties(),
      const SizedBox(),
      const Properties(),
    ];
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: BackgroundImageContainer(
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                    automaticallyImplyLeading: false,
                    expandedHeight:330,
                    pinned: false,
                    actions: [Container()],
                    flexibleSpace:  const FlexibleSpaceBar(
                      background: SizedBox(

                        child: Column(
                          children: [
                            NetworkCheckerContainer(),
                            /// App Bar
                            HomeHeader(),

                          ],
                        ),
                      ),
                    ),
                    bottom: TabBar(
                      padding: EdgeInsetsDirectional.only(end: TDeviceUtils.getScreenWidth(context)*0.25),
                      labelPadding:
                      const EdgeInsetsDirectional.symmetric(
                          horizontal: TSizes.xs),
                      indicatorSize: TabBarIndicatorSize.label,
                      indicator: const BoxDecoration(
                          color: Colors.transparent),
                      onTap: (val) =>
                          homeController.tabBarButtonClicked(val),
                      tabs: myTabs,
                    ),
                  ),

              ];
            },
            body: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              children: tabsBody,
            ),
          ),
          // child: SingleChildScrollView(
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       const HomeHeader(),
          //       Padding(
          //         padding:  const EdgeInsetsDirectional.only(start:TSizes.sm),
          //         child: Text(
          //           "Reservations in April 2024",
          //           style: Theme.of(context).textTheme.labelMedium,
          //         ),
          //       ),
          //       const TabBarButton(),
          //
          //       /// Properties List
          //       ConstrainedBox(
          //         constraints:
          //             BoxConstraints(minHeight: 56, maxHeight: TDeviceUtils.getScreenHeight()),
          //         child: PageView(
          //           physics: const NeverScrollableScrollPhysics(),
          //           controller: Get.put(HomeController()).pageController,
          //           onPageChanged: Get.put(HomeController()).updatePageIndicator,
          //           children: const [
          //             Properties(),
          //             SizedBox(),
          //             Properties(),
          //           ],
          //         ),
          //       ),
          //
          //       const SizedBox(
          //         height: TSizes.defaultSpace,
          //       )
          //     ],
          //   ),
          // ),

        ),
      ),
    );
  }
}
