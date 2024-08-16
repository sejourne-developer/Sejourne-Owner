import 'package:sejourne_owner/features/app/controllers/home/home_controller.dart';
import 'package:sejourne_owner/features/calender/calender_screen.dart';
import 'package:sejourne_owner/features/messages/controllers/messages/messages_controller.dart';
import 'package:sejourne_owner/features/statments/statements_screen.dart';

import 'data/services/exporter.dart';
import 'features/app/controllers/drawers/drawer_controller.dart';
import 'features/app/screens/drawers/home/home_screen_drawer.dart';
import 'features/app/screens/drawers/home/home_screen_search_end_drawer_filter_menu.dart';
import 'features/app/screens/drawers/messages/messages_screen_end_drawer_filter.dart';
import 'features/app/screens/home/home_screen.dart';
import 'features/messages/screens/messages/messages.dart';
import 'features/personalization/screens/profile/profile.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({Key? key1}) : super(key: key1);

  @override
  Widget build(BuildContext context) {
    Get.put(MyDrawerController());
    final navController = Get.put(NavigationController());
    final dark = THelperFunctions.isDarkMode(context);
    final ColorFilter colorFilter = ColorFilter.mode(
        dark ? TColors.darkIconColor : TColors.lightIconColor, BlendMode.srcIn);
    return PopScope(
      canPop: false,
      child: DefaultTabController(
        length: 5,
        child: Scaffold(
          key: MyDrawerController.instance.homeScaffoldKey,
          extendBody: true,
          resizeToAvoidBottomInset: false,
          endDrawerEnableOpenDragGesture: false,
          drawerEnableOpenDragGesture: false,
          drawer: Drawer(
            shape: InputBorder.none,
            width: TDeviceUtils.getScreenWidth(context) * 0.50,
            child: const MenuScreen(),
          ),
          endDrawer: Drawer(
            shape: InputBorder.none,
            width: TDeviceUtils.getScreenWidth(context) * 0.50,
            child: Obx(() => navController.currentPageIndex.value == 0
                ? const HomeScreenSearchEndDrawerFilter()
                : navController.currentPageIndex.value == 3
                    ? const MessageScreenEndDrawerFilter()
                    : const SizedBox()),
          ),

          bottomNavigationBar: Container(
            height: TDeviceUtils.getBottomNavigationBarHeight(),
            width: double.infinity,
            decoration: BoxDecoration(
                color: dark ? TColors.blackContainer : TColors.white,
                boxShadow: [TShadowStyle.verticalProductShadow],
                borderRadius: const BorderRadiusDirectional.only(
                  topStart: Radius.circular(TSizes.md),
                  topEnd: Radius.circular(TSizes.md),
                )),
            child: TabBar(
              onTap: (pageIndex) {
                NavigationController.instance.currentPageIndex.value =
                    pageIndex;
              },
              tabs: [
                Tab(
                  icon: SvgPicture.asset(
                    TImage.homeIcon,
                    colorFilter: colorFilter,
                  ),
                  text: TTexts.homeLabel.tr,
                ),
                Tab(
                  icon: SvgPicture.asset(
                    TImage.calenderIcon,
                    colorFilter: colorFilter,
                  ),
                  text: TTexts.calendarLabel.tr,
                ),
                Tab(
                  icon: SvgPicture.asset(
                    TImage.statementIcon,
                    colorFilter: colorFilter,
                  ),
                  text: TTexts.statementsLabel.tr,
                ),
                Tab(
                  icon: SvgPicture.asset(
                    TImage.messagesIcon,
                    colorFilter: colorFilter,
                  ),
                  text: TTexts.messagesLabel.tr,
                ),
                Tab(
                  icon: SvgPicture.asset(
                    TImage.profileIcon,
                    colorFilter: colorFilter,
                  ),
                  text: TTexts.profileLabel.tr,
                ),
              ],
            ),
          ),

          body: const TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              HomeScreen(),
              CalenderScreen(),
              StatementsScreen(),
              MessagesScreen(),
              ProfileScreen(),
            ],
          ),
          //body: Obx(() => controller.screens[controller.selectedIndex.value]),
        ),
      ),
    );
  }
}

class NavigationController extends GetxController {
  static NavigationController get instance => Get.find();
  final Rx<int> currentPageIndex = 0.obs;

  @override
  void onReady()  {
    Get.put(HomeController());

    // Get.put(CalenderController());
    Get.put(MessagesController());
    super.onReady();
  }
}
