import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:sejourne_owner/data/services/exporter.dart';

class CalenderController extends GetxController {
  static CalenderController get instance => Get.find();

  final isGra1 = true.obs;
  final isGra2 = false.obs;
  final Rx<ScrollController> scrollController =
      ScrollController(keepScrollOffset: true).obs;
  final offset = 0.0.obs;
  final EasyInfiniteDateTimelineController easyInfiniteDateTimelineController =
      EasyInfiniteDateTimelineController();
  final focusDate = DateTime.now().obs;

  Rx<int> currentPageIndex = 0.obs;

  /// Jump to the specific dot selected page
  void tabBarButtonClicked(index) {
    currentPageIndex.value = index;
    if (index == 0) {
      isGra1.value = true;
      isGra2.value = false;
    } else if (index == 1) {
      isGra1.value = false;
      isGra2.value = true;
    }
  }

  // @override
  // void onReady() {
  //   print("objelmakdcnkn");
  //   scrollController.value.addListener(() {
  //     offset.value = scrollController.value.offset;
  //   });
  //   super.onReady();
  // }
  //
  //
  @override
  void onInit() {
    scrollController.value.addListener(handleControllerNotification);
    super.onInit();
  }

  onStartScroll(ScrollMetrics metrics) {
    debugPrint("Scroll Start");
  }

  onUpdateScroll(ScrollMetrics metrics) {
    debugPrint("Scroll Update");
  }

  onEndScroll(ScrollMetrics metrics) {
    debugPrint("Scroll End");
  }

  moveLeft() {
    if (focusDate.value.day > DateTime.now().day) {
      focusDate.value = focusDate.value.add(const Duration(days: -1));
      if (scrollController.value.offset >=56 ) {
        scrollController.value.animateTo(scrollController.value.offset - 56,
            curve: Curves.linear, duration: const Duration(milliseconds: 500));
      }
    }
  }

  moveRight() {
    scrollController.value.animateTo(scrollController.value.offset + 56,
        curve: Curves.linear, duration: const Duration(milliseconds: 500));
  }

  Rx<ScrollNotification>? lastNotification;
  final text = ".obs".obs;
  final text2 = ".obs".obs;
  final text3 = ".obs".obs;

  bool handleScrollNotification(ScrollNotification notification) {
    print('Notified through scroll notification.');
    // The position can still be accessed through the scroll controller, but
    // the notification object provides more details about the activity that is
    // occurring.
    if (lastNotification.runtimeType != notification.runtimeType) {
      print(notification);

      // Call set state to respond to a change in the scroll notification.
      lastNotification?.value = notification;
    }

    // Returning false allows the notification to continue bubbling up to
    // ancestor listeners. If we wanted the notification to stop bubbling,
    // return true.
    return false;
  }

  // _scrollListener() {
  //   debugPrint("${scrollController.value.offset}");
  //   if (scrollController.value.position.atEdge) {
  //     debugPrint("reach the top");
  //     text.value = "1";
  //   }
  //   if (scrollController.value.offset <=
  //           scrollController.value.position.minScrollExtent &&
  //       !scrollController.value.position.outOfRange) {
  //     debugPrint("reach the top");
  //     text.value = "2";
  //   }
  // }

  // This method handles the notification from the ScrollController.
  int counter2 = 0;
  int counter = 0;

  void handleControllerNotification() {
    text.value = scrollController.value.offset.toString();
    if (scrollController.value.offset.roundToDouble() == counter2 * 56) {
      text.value =
          "${scrollController.value.offset.toString()} ================";
      text2.value = counter2.toString();
      counter2 = counter2 + 1;
    }
    // if (scrollController.value.offset <=
    //         scrollController.value.position.minScrollExtent &&
    //     !scrollController.value.position.outOfRange) {
    //   debugPrint("reach the top");
    //   text.value = scrollController.value.offset.toString();
    //   focusDate.value = focusDate.value.add(const Duration(days: 1));
    //   easyInfiniteDateTimelineController.animateToDate(focusDate.value);
    //   text.value = scrollController.value.offset.toString();
    // }
    // if (scrollController.value.offset >=
    //         scrollController.value.position.maxScrollExtent &&
    //     !scrollController.value.position.outOfRange) {
    //   debugPrint("reach the top");
    //   text.value = scrollController.value.offset.toString();
    //   focusDate.value = focusDate.value.add(const Duration(days: 1));
    //   easyInfiniteDateTimelineController.animateToDate(focusDate.value);
    //   text.value = scrollController.value.offset.toString();
    // }
    // _scrollListener;
    // Access the position directly through the controller for details on the
    // scroll position.
  }

  @override
  void dispose() {
    scrollController.value.removeListener(handleControllerNotification);
    super.dispose();
  }
}
