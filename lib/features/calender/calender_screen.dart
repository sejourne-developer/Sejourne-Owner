import 'package:sejourne_owner/features/calender/model/property_model.dart';
import '../../common/widgets/texts/horizontal_icon_text.dart';
import '../../data/services/exporter.dart';
import '../../utils/popups/general_popups/calender_popup.dart';
import 'controllers/calender_controller.dart';
import 'widgets/list_tab.dart';
import 'widgets/ribbon_tab.dart';

class CalenderScreen extends StatelessWidget {
  const CalenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CalenderController());
    List<BookingsModel> model1=[
      BookingsModel(userName: "Catalin Pustai", userPic: TImage.user9, guests: "3", nights: 3,day: 12),
      BookingsModel(userName: "Alexander  Maryukov", userPic: TImage.user6, guests: "2", nights: 9,day: 15),
      BookingsModel(userName: "Dinkar  Notani", userPic: TImage.user10, guests: "0", nights: 5,day: 24),
      BookingsModel(userName: "Mansour Zedan", userPic: TImage.user7, guests: "1", nights: 4,day: 28),
    ];
    List<BookingsModel> model2=[
      BookingsModel(userName: "Aleena Jack", userPic: TImage.user1, guests: "3", nights: 5,day: 12),
      BookingsModel(userName: "Allyah Yattabare", userPic: TImage.user3, guests: "2", nights: 3,day: 17),
      BookingsModel(userName: "Mohamed Abdelhakim", userPic: TImage.user4, guests: "0", nights: 7,day: 20),
      BookingsModel(userName: "Aksoy Omer", userPic: TImage.user2, guests: "1", nights: 6,day: 27),
    ];
    List<BookingsModel> model3=[
      BookingsModel(userName: "Aleksandr Zelentsov", userPic: TImage.user5, guests: "3", nights: 7,day: 12),
      BookingsModel(userName: "Dmitrii Tsyganok", userPic: TImage.user9, guests: "2", nights: 5,day: 19),
      BookingsModel(userName: "Elena Urban", userPic: TImage.user1, guests: "0", nights: 3,day: 24),
      BookingsModel(userName: "Galina Bagaeva", userPic: TImage.user8, guests: "1", nights: 6,day: 27),
    ];
    List<BookingsModel> model4=[
      BookingsModel(userName: "Iacono Luca", userPic: TImage.user7, guests: "3", nights: 4,day: 12),
      BookingsModel(userName: "Iurii Trunov", userPic: TImage.user6, guests: "2", nights: 3,day: 16),
      BookingsModel(userName: "Dinkar  Notani", userPic: TImage.user3, guests: "0", nights: 8,day: 19),
      BookingsModel(userName: "Mansour Zedan", userPic: TImage.user2, guests: "1", nights: 4,day: 27),
    ];
    List<BookingsModel> model5=[
      BookingsModel(userName: "Catalin Pustai", userPic: TImage.user5, guests: "3", nights: 3,day: 12),
      BookingsModel(userName: "Alexander  Maryukov", userPic: TImage.user1, guests: "2", nights: 5,day: 15),
      BookingsModel(userName: "Dinkar  Notani", userPic: TImage.user10, guests: "0", nights: 3,day: 20),
      BookingsModel(userName: "Mansour Zedan", userPic: TImage.user9, guests: "1", nights: 8,day: 28),
    ];
    List<PropertyModel> bookings=[
      PropertyModel(propertyName: "Studio (806) at Dubai Arch (JLT)",  bookings: model1),
      PropertyModel(propertyName: "Studio (804) at Dubai Arch (JLT)",  bookings: model2),
      PropertyModel(propertyName: "1BR (212C) at Diamond Views 3 (JVC )",  bookings: model3),
      PropertyModel(propertyName: "1BR (205) at The Polo Residence (Meydan)",  bookings: model4),
      PropertyModel(propertyName: "3BR (207) at The Damac Hills (Meydan)",  bookings: model5),
    ];
    final dark = Get.isDarkMode;
    return DefaultTabController(
      initialIndex: controller.currentPageIndex.value,
      animationDuration: const Duration(milliseconds: 300),
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const MainScreensAppBar(
              leadingIcon: TImage.searchBookingIcon, title: "Calender"),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(56),
            child: Row(
              children: [
                /// Date and Search tab
                Expanded(
                  flex: 5,
                  child: Row(
                    children: [
                      /// Date
                      Expanded(
                        child: GestureDetector(
                          onTap: () => showDialog(
                              context: context,
                              builder: (context) => CalenderPopUpForm(
                                    title: "Month",
                                    subTitle: "",
                                    buttonText: "Select",
                                    onPressed: () {
                                      Get.back();
                                    },
                                  )),
                          child: TRoundedContainer(
                            radius: TSizes.sm,
                            margin: const EdgeInsetsDirectional.symmetric(
                                horizontal: TSizes.sm),
                            backgroundColor: dark
                                ? TColors.blackContainer
                                : TColors.softGrey,
                            padding: const EdgeInsetsDirectional.all(TSizes.sm),
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "April 2024",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall!
                                        .apply(
                                            color: dark
                                                ? TColors.darkFontColor
                                                : TColors.primary),
                                  ),
                                  SvgPicture.asset(
                                    TImage.arrowDownIcon,
                                    height: TSizes.iconSm,
                                    width: TSizes.iconSm,
                                    colorFilter: ColorFilter.mode(
                                        dark
                                            ? TColors.darkIconColor
                                            : TColors.primary,
                                        BlendMode.srcIn),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      /// Search
                      Expanded(
                        child: SizedBox(
                          height: 32,
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: TTexts.searchLabel.tr,
                                hintStyle:
                                    Theme.of(context).textTheme.labelSmall,
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: TSizes.xs),
                                prefixIconConstraints: const BoxConstraints(
                                    minWidth: 16,
                                    minHeight: 16,
                                    maxHeight: 16,
                                    maxWidth: 16),
                                prefixIcon: Padding(
                                    padding: const EdgeInsets.all(TSizes.xs),
                                    child: SvgPicture.asset(
                                      TImage.searchIcon,
                                    ))),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const Expanded(flex: 1, child: SizedBox()),

                /// Tab bar
                Expanded(
                  flex: 5,
                  child: TabBar(
                    onTap: (val) {
                      controller.currentPageIndex.value = val;
                      controller.tabBarButtonClicked(val);
                    },
                    indicatorSize: TabBarIndicatorSize.label,
                    labelPadding: EdgeInsetsDirectional.zero,
                    indicator: const BoxDecoration(
                        //color: Colors.transparent,
                        ),
                    tabs: [
                      Obx(
                        () => TRoundedContainer(
                          width: double.infinity,
                          isGradient: controller.isGra1.value,
                          showBorder: !controller.isGra1.value,

                          margin:
                              const EdgeInsetsDirectional.only(end: TSizes.sm),
                          padding: const EdgeInsetsDirectional.symmetric(
                              vertical: TSizes.sm),
                          backgroundColor:
                              dark ? TColors.blackContainer : TColors.softGrey,
                          radius: TSizes.sm,
                          //height: double.infinity,

                          child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: HorizontalIconText(
                                icon: TImage.ribbonMenuIcon,
                                iconColor: controller.isGra1.value
                                    ? TColors.white
                                    : dark
                                        ? TColors.darkIconColor
                                        : TColors.primary,
                                title: "Ribbon",
                                isSub: false,
                                titleTextStyle: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .apply(
                                        color: controller.isGra1.value
                                            ? TColors.white
                                            : dark
                                                ? TColors.darkFontColor
                                                : TColors.primary),
                              )),
                        ),
                      ),
                      Obx(
                        () => TRoundedContainer(
                          width: double.infinity,
                          isGradient: controller.isGra2.value,
                          showBorder: !controller.isGra2.value,
                          margin:
                              const EdgeInsetsDirectional.only(end: TSizes.sm),
                          padding: const EdgeInsetsDirectional.symmetric(
                              horizontal: TSizes.sm, vertical: TSizes.sm),
                          backgroundColor: controller.isGra2.value
                              ? TColors.white
                              : dark
                                  ? TColors.blackContainer
                                  : TColors.softGrey,
                          radius: TSizes.sm,
                          //height: double.infinity,

                          child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: HorizontalIconText(
                                icon: TImage.listMenuIcon,
                                iconColor: controller.isGra2.value
                                    ? TColors.white
                                    : dark
                                        ? TColors.darkIconColor
                                        : TColors.primary,
                                title: "List",
                                isSub: false,
                                titleTextStyle: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .apply(
                                        color: controller.isGra2.value
                                            ? TColors.white
                                            : dark
                                                ? TColors.darkFontColor
                                                : TColors.primary),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body:  BackgroundImageContainer(
          child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              children: [RibbonTab(
                bookings: bookings,
              ), const ListTab()]),
        ),
      ),
    );
  }
}
