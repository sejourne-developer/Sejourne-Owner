import 'package:dotted_border/dotted_border.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';

import '../../../common/widgets/images/dotted_border_circle_image.dart';
import '../../../common/widgets/layouts/list_layout.dart';
import '../../../common/widgets/texts/horizontal_icon_text.dart';
import '../../../data/services/exporter.dart';
import '../controllers/calender_controller.dart';
import '../model/property_model.dart';

class RibbonTab extends StatelessWidget {
  const RibbonTab({super.key, required this.bookings});

  final List<PropertyModel> bookings;

  @override
  Widget build(BuildContext context) {
    final controller = CalenderController.instance;
    return Padding(
      padding: EdgeInsetsDirectional.only(
        top: TDeviceUtils.getAppBarHeight() * 2.8,
        start: TSizes.sm,
        bottom: TDeviceUtils.getBottomNavigationBarHeight(),
      ),
      child: SingleChildScrollView(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              flex: 3,
              fit: FlexFit.loose,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    flex: 2,
                    fit: FlexFit.loose,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Get.isDarkMode
                                ? TColors.blackContainer
                                : TColors.grey,
                            borderRadius: const BorderRadiusDirectional.only(
                                topStart: Radius.circular(TSizes.sm),
                                bottomStart: Radius.circular(TSizes.sm)),
                          ),
                          height: 48,
                          width: 64,
                          padding: const EdgeInsetsDirectional.symmetric(
                              horizontal: TSizes.sm),
                          child: Center(
                            child: FittedBox(
                                child: Text(
                              "Property",
                              style: Theme.of(context).textTheme.bodyLarge,
                            )),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.moveLeft();
                            // controller.easyInfiniteDateTimelineController
                            //     .animateToDate(controller.focusDate.value);
                          },
                          child: Container(
                            width: TSizes.md,
                            height: 48,
                            margin: const EdgeInsetsDirectional.only(
                                start: TSizes.xs),
                            color: Get.isDarkMode
                                ? TColors.blackContainer
                                : TColors.grey,
                            child: const Center(
                              child: Icon(
                                Icons.arrow_back_ios_new_rounded,
                                size: TSizes.sm,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.sm,
                  ),
                  ListLayout(
                      itemCount: bookings.length,
                      padding: EdgeInsets.zero,
                      itemBuilder: (_, index) => SizedBox(
                            height: 56,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Flexible(
                                  // flex: 3,
                                  fit: FlexFit.loose,
                                  child: Text(
                                    maxLines: 2,
                                    bookings[index].propertyName,
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsetsDirectional.symmetric(
                                      horizontal: TSizes.sm),
                                  width: 2,
                                  height: 56,
                                  color: Get.isDarkMode
                                      ? TColors.blackContainer
                                      : TColors.grey,
                                ),
                              ],
                            ),
                          )),
                ],
              ),
            ),
            Flexible(
              flex: 8,
              fit: FlexFit.loose,
              child: Stack(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    controller: controller.scrollController.value,
                    dragStartBehavior: DragStartBehavior.down,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                          minHeight: 56,
                          maxHeight: double.infinity,
                          minWidth: 56,
                          maxWidth: 56 * 100),
                      child: Obx(
                        () => Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            EasyInfiniteDateTimeLine(
                              selectionMode: const SelectionMode.none(),
                              firstDate: DateTime(2024),
                              focusDate: controller.focusDate.value,
                              showTimelineHeader: false,
                              physics: const NeverScrollableScrollPhysics(),
                              controller:
                                  controller.easyInfiniteDateTimelineController,
                              lastDate: DateTime(2024, 12, 31),
                              onDateChange: (selectedDate) {
                                if (kDebugMode) {
                                  print(selectedDate.day);
                                }
                                controller.focusDate.value = selectedDate;
                              },
                              dayProps: const EasyDayProps(
                                // You must specify the width in this case.
                                width: 48.0,
                                // The height is not required in this case.
                                height: 48.0,
                              ),
                              itemBuilder: (
                                BuildContext context,
                                DateTime date,
                                bool isSelected,
                                VoidCallback onTap,
                              ) {
                                return InkResponse(

                                    // You can use `InkResponse` to make your widget clickable.
                                    // The `onTap` callback responsible for triggering the `onDateChange`
                                    // callback and animating to the selected date if the `selectionMode` is
                                    // SelectionMode.autoCenter() or SelectionMode.alwaysFirst().
                                    onTap: onTap,
                                    child: isSelected
                                        ? AnimatedContainer(
                                            duration:
                                                const Duration(seconds: 1),
                                            curve: Curves.fastOutSlowIn,
                                            alignment:
                                                AlignmentDirectional.center,
                                            decoration: const BoxDecoration(
                                                borderRadius:
                                                    BorderRadiusDirectional.all(
                                                        Radius.circular(100)),
                                                gradient:
                                                    TColors.radialGradient),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  EasyDateFormatter
                                                          .shortDayName(
                                                              date, "en_US")
                                                      .toString(),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .labelLarge!
                                                      .apply(
                                                          color: TColors.white),
                                                ),
                                                Text(
                                                  date.day.toString(),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .labelLarge!
                                                      .apply(
                                                          color: TColors.white),
                                                ),
                                              ],
                                            ),
                                          )
                                        : Padding(
                                            padding:
                                                const EdgeInsets.all(TSizes.xs),
                                            child: DottedBorder(
                                              borderType: BorderType.Circle,
                                              child: Center(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      EasyDateFormatter
                                                              .shortDayName(
                                                                  date, "en_US")
                                                          .toString(),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .labelLarge!
                                                          .apply(
                                                              color: Get
                                                                      .isDarkMode
                                                                  ? TColors
                                                                      .darkFontColor
                                                                  : TColors
                                                                      .primary),
                                                    ),
                                                    Text(
                                                      date.day.toString(),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .labelLarge!
                                                          .apply(
                                                              color: Get
                                                                      .isDarkMode
                                                                  ? TColors
                                                                      .darkFontColor
                                                                  : TColors
                                                                      .primary),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ));
                              },
                            ),
                            ListLayout(
                              itemCount: bookings.length,
                              padding: const EdgeInsetsDirectional.only(
                                  start: TSizes.md),
                              //separatorHeight: TSizes.sm,
                              itemBuilder: (_, index) {
                                int v = index;
                                return SizedBox(
                                  height: 56,
                                  child: ListLayout(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: bookings[index].bookings.length,
                                    padding:
                                        const EdgeInsetsDirectional.symmetric(
                                            vertical: TSizes.sm),
                                    separatorWidth: TSizes.md,
                                    itemBuilder: (_, index) => SizedBox(
                                      height: 56,
                                      width: (50 *
                                          double.parse(
                                              "${bookings[v].bookings[index].nights}")),
                                      child: index ==
                                              controller.focusDate.value.day
                                          ? null
                                          : Container(
                                              color: TColors.white,
                                              height: 40,
                                              child: DottedBorder(
                                                borderType: BorderType.RRect,
                                                radius:
                                                    const Radius.circular(100),
                                                strokeWidth: 0.8,
                                                dashPattern: const [2, 2],
                                                color: Get.isDarkMode
                                                    ? TColors.grey2
                                                    : TColors.primary,
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    /// User Picture
                                                    FittedBox(
                                                      child:
                                                          TDottedBorderCircleImage(
                                                        imageSize: 40,
                                                        borderWidth: 1,
                                                        image: bookings[v]
                                                            .bookings[index]
                                                            .userPic,
                                                        status: false,
                                                      ),
                                                    ),

                                                    const SizedBox(
                                                      width: TSizes.sm,
                                                    ),

                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        FittedBox(
                                                          fit: BoxFit
                                                              .scaleDown,
                                                          child: Text(
                                                            overflow: TextOverflow.ellipsis,
                                                            bookings[v]
                                                                .bookings[
                                                                    index]
                                                                .userName,
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .labelMedium,
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize
                                                                  .min,
                                                          children: [
                                                            HorizontalIconText(
                                                              icon: TImage
                                                                  .userProfileIcon,
                                                              title: bookings[
                                                                      v]
                                                                  .bookings[
                                                                      index]
                                                                  .guests,
                                                              isSub: false,
                                                            ),
                                                            const SizedBox(
                                                              width:
                                                                  TSizes.md,
                                                            ),
                                                            HorizontalIconText(
                                                              icon: TImage
                                                                  .nights,
                                                              title:
                                                                  "${bookings[v].bookings[index].nights}",
                                                              isSub: false,
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  PositionedDirectional(
                    end: TSizes.sm,
                    child: GestureDetector(
                      onTap: () {
                        controller.focusDate.value = controller.focusDate.value
                            .add(const Duration(days: 1));
                        controller.moveRight();
                        // controller.easyInfiniteDateTimelineController
                        //     .jumpToFocusDate();
                        if (kDebugMode) {
                          print(controller.focusDate.value);
                        }
                      },
                      child: Container(
                        width: TSizes.md,
                        height: 48,
                        margin:
                            const EdgeInsetsDirectional.only(start: TSizes.xs),
                        color: Get.isDarkMode
                            ? TColors.blackContainer
                            : TColors.grey,
                        child: const Center(
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: TSizes.sm,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
