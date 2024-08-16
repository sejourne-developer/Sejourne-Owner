import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

class HomeController extends GetxController{
  static HomeController get instance => Get.find();




  Rx<int> currentPageIndex=0.obs;
  final pageController= PageController(); // onboarding pages Page controller
  late Timer timer;
  Rx<int> start = 60.obs;
  Rx<double> headerCurrentHeight = 400.0.obs;

  final carousalCurrentIndex=0.obs;
  final expandedListCarousalCurrentIndex=0.obs;
  final showMonthCalender=false.obs;
  final isGra1=true.obs;
  final isGra2=false.obs;
  final isGra3=false.obs;
  final Rx<String> selectedMonth="April 2024".obs;

  int propCurrentIndex=0;
  final openPopup=false.obs;
  final isFavorite=false.obs;
  final fill=false.obs;


  void updatePopupPageIndicator(index){
    carousalCurrentIndex.value=index;
  }

  void updateExpandPageIndicator(index){
    expandedListCarousalCurrentIndex.value=index;
  }

  void find(int index,int length){
    for(int i=0;i<length;i++){
      if(i==index){
        propCurrentIndex=i;
      }
    }
  }

  /// Update Current Index when Page Scroll
  void updatePageIndicator(index)=> currentPageIndex.value=index;

  /// Jump to the specific dot selected page
  void tabBarButtonClicked(index) {
    currentPageIndex.value = index;
    if (index == 0) {
      isGra1.value = true;
      isGra2.value = false;
      isGra3.value = false;
    } else if (index == 1) {
      isGra1.value = false;
      isGra2.value = true;
      isGra3.value = false;

    } else if (index == 2) {
      isGra1.value = false;
      isGra2.value = false;
      isGra3.value = true;

    }
  }

  final verifyLater = false.obs;
  final enableButton = false.obs;
  final buttonLoading = false.obs;
  final verified = false.obs;
  final pinController = TextEditingController();
  GlobalKey<FormState> optFormKey = GlobalKey<FormState>();
  final focusNode = FocusNode();
  final focusedBorderColor = THelperFunctions.isDarkMode(Get.context!)
      ? TColors.darkPrimaryBorderColor
      : TColors.primary;
  final borderColor = THelperFunctions.isDarkMode(Get.context!)
      ? TColors.darkPrimaryBorderColor
      : TColors.grey;

  final defaultPinTheme = PinTheme(
    width: TSizes.pinSize,
    height: TSizes.pinSize,
    textStyle: Theme.of(Get.context!).textTheme.headlineMedium,
    decoration: BoxDecoration(
      color: THelperFunctions.isDarkMode(Get.context!)
          ? TColors.dark
          : TColors.white,
      borderRadius: BorderRadius.circular(TSizes.sm),
      border: Border.all(
          color: THelperFunctions.isDarkMode(Get.context!)
              ? TColors.darkPrimaryBorderColor
              : TColors.grey),
    ),
  );
  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (start.value == 0) {
          timer.cancel();
        } else {
          start.value--;
        }
      },
    );
  }
}