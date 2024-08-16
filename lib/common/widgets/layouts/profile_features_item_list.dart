import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../data/services/exporter.dart';
import '../../../features/messages/screens/chat/widgets/expanded_section.dart';
import '../../../features/personalization/screens/reports/widgets/report_details_slide.dart';
import '../texts/horizontal_icon_text.dart';
import '../texts/horizontal_title_sub_title_widget.dart';

class ProfileFeaturesItemList extends StatelessWidget {
  const ProfileFeaturesItemList({
    super.key,
    required this.title,
    required this.subTitle,
    this.isVerified = false,
    this.onPressed,
    this.icon = TImage.emailIcon,
    this.description,
    this.showEditButton = true,
    this.showSwitchButton = false,
    this.switchButtonValue,
    this.permissionKey,
    this.permission,
    this.isPhoneNumber = false,
    this.isPermission = true,
    this.isDottedBorder = false,
    this.margin = const EdgeInsetsDirectional.only(bottom: TSizes.md),
    this.subTitleStyle,
    this.text,
    this.isText = false,
    this.isSlide=false,
  });

  final String title, subTitle, icon;

  final String? description, permissionKey, text;
  final bool isVerified, showEditButton, showSwitchButton;
  final VoidCallback? onPressed;
  final Rx<bool>? switchButtonValue;
  final Permission? permission;
  final bool isPhoneNumber, isPermission, isDottedBorder, isText;
  final TextStyle? subTitleStyle;

  final bool isSlide;
  final EdgeInsetsGeometry margin;

  //final bool ver
  @override
  Widget build(BuildContext context) {
    Rx<bool> isExpanded = false.obs;
    return Column(
      children: [
        TRoundedContainer(
          onPressed: isSlide
              ? () => isExpanded.value = !isExpanded.value:null,
          shadow: TShadowStyle.containerShadow,
          radius: TSizes.sm + 2,
          padding: const EdgeInsetsDirectional.all(TSizes.md),
          margin: margin,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Material(
                        borderRadius: const BorderRadiusDirectional.all(
                            Radius.circular(TSizes.sm + 2)),
                        color: Get.isDarkMode
                            ? TColors.darkContainer
                            : const Color(0xFFF6F6F6),
                        child: isDottedBorder
                            ? DottedBorder(
                                borderType: BorderType.RRect,
                                radius: const Radius.circular(10),
                                dashPattern: const [2, 2],
                                strokeWidth: 0.5,
                                color: Get.isDarkMode
                                    ? TColors.darkPrimaryBorderColor
                                    : TColors.primary,
                                child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.all(TSizes.sm),
                                    child: SizedBox(
                                        width: TSizes.iconLg,
                                        height: TSizes.iconLg,
                                        child: Center(
                                            child: isText
                                                ? FittedBox(
                                                    child: Text(
                                                    "$text%",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleSmall,
                                                  ))
                                                : SvgPicture.asset(icon,
                                                    fit: BoxFit.cover,
                                                    colorFilter: ColorFilter.mode(
                                                        Get.isDarkMode
                                                            ? TColors.darkIconColor
                                                            : TColors.primary,
                                                        BlendMode.srcIn))))),
                              )
                            : Padding(
                                padding: const EdgeInsetsDirectional.all(TSizes.sm),
                                child: SizedBox(
                                    width: TSizes.iconLg,
                                    height: TSizes.iconLg,
                                    child: Center(
                                        child: SvgPicture.asset(icon,
                                            fit: BoxFit.cover,
                                            colorFilter: ColorFilter.mode(
                                                Get.isDarkMode
                                                    ? TColors.darkIconColor
                                                    : TColors.primary,
                                                BlendMode.srcIn))))),
                      ),
                      const SizedBox(
                        width: TSizes.sm,
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                            minWidth: 56,
                            maxWidth: showEditButton || showSwitchButton
                                ? TDeviceUtils.getScreenWidth(context) * 0.45
                                : TDeviceUtils.getScreenWidth(context) * 0.65),
                        child: HorizontalTitleSubTitleWidget(
                          title: title,
                          subTitle: subTitle,
                          isPhoneNumber: isPhoneNumber,
                          subTitleAlign: TextAlign.start,
                          titleStyle: Theme.of(context).textTheme.bodyMedium!.apply(
                              color: Get.isDarkMode
                                  ? TColors.darkFontColor
                                  : TColors.black),
                          subTitleStyle: subTitleStyle ??
                              Theme.of(context).textTheme.labelMedium!.apply(
                                  color: Get.isDarkMode
                                      ? TColors.darkFontColor
                                      : TColors.black.withOpacity(0.8)),
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                      ),
                      const SizedBox(
                        width: TSizes.sm,
                      ),
                      isVerified
                          ? Container(
                              width: 48,
                              margin:
                                  const EdgeInsetsDirectional.only(top: TSizes.xs),
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: HorizontalIconText(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  icon: TImage.verifiedIcon,
                                  iconColor: TColors.green,
                                  title: TTexts.verified.tr,
                                  isSub: false,
                                  titleTextStyle: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .apply(
                                          color: Get.isDarkMode
                                              ? TColors.darkFontColor
                                              : TColors.green),
                                ),
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                  showEditButton
                      ? IconButton(
                          onPressed: onPressed,
                          icon: HorizontalIconText(
                            iconColor:
                                Get.isDarkMode ? TColors.darkIconColor : Colors.red,
                            icon: TImage.editIcon,
                            isSub: false,
                            titleTextStyle: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .apply(
                                    color: Get.isDarkMode
                                        ? TColors.darkIconColor
                                        : Colors.red),
                            title: TTexts.change.tr,
                          ))
                      : showSwitchButton
                          ? Obx(
                              () => CupertinoSwitch(
                                  value: switchButtonValue!.value,
                                  onChanged: (value) async {
                                    if (isPermission) {
                                      if (value) {
                                        final status = await THelperFunctions
                                            .requestPermission(
                                                permission: permission!);
                                        if (status.isGranted) {
                                          switchButtonValue!.value = value;
                                        } else {
                                          switchButtonValue!.value = false;
                                        }
                                      } else {
                                        await openAppSettings();
                                        if (permission?.status.isGranted != null) {
                                          switchButtonValue!.value = true;
                                        } else {
                                          switchButtonValue!.value = false;
                                        }
                                      }
                                    } else {
                                      switchButtonValue!.value = value;
                                    }
                                  }),
                            )
                          : const SizedBox(),
                ],
              ),
              description != null
                  ? Padding(
                      padding: const EdgeInsetsDirectional.only(
                          start: TSizes.appBarHeight),
                      //width: TDeviceUtils.getScreenWidth(context)*0.58,
                      // height: 56,
                      child: Text(description!,
                          //overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.labelSmall!.apply(
                              color: Get.isDarkMode
                                  ? TColors.darkFontColor
                                  : TColors.grey2)),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
        isSlide?  Obx(
              ()=> ExpandedSection(
            expand: isExpanded.value,
            child: SizedBox(
              height: TDeviceUtils.getScreenHeight()*1.5,
              child: const ReportDetailsSlide(
                showBorder: false,
                ignoreAppBar: true,
                radius: 0,
                physics: NeverScrollableScrollPhysics(),
                margin: EdgeInsets.zero,
              ),
            ),
          ),
        ):const SizedBox()
      ],
    );
  }
}
