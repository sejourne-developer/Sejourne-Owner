import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:sejourne_owner/common/widgets/texts/section_header.dart';
import 'package:sejourne_owner/utils/popups/general_popups/calender_popup.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../../data/services/exporter.dart';
import '../../general_popups/primary_popup_container.dart';

class ExpenseReportPopup extends StatelessWidget {
  const ExpenseReportPopup({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    List<String> label = [
      "Studio (806) at Dubai Arch (JLT)",
      "Studio (804) at Dubai Arch (JLT)",
      "1BR (212C) at Diamond Views 3 (JVC )",
      "1BR (205) at The Polo Residence (Meydan)",
    ];
    return PrimaryPopupContainer(
      headIcon: TImage.expenseIcon,
      title: "Property Information",
      subTitle: "Please Select Property and Period to Cover",
      buttonText: TTexts.submitLabel.tr,
      onPressed: () {
        Get.back();
      },
      child: Padding(
        padding: const EdgeInsetsDirectional.all(TSizes.md),
        child: Column(
          children: [
            CustomDropdown<String>.search(
              hintText:
              "${TTexts.select.tr} ${TTexts.propertyLabel.tr}",
              items: label,
              decoration: CustomDropdownDecoration(
                  headerStyle:
                  Theme.of(context).textTheme.labelMedium,
                  hintStyle:
                  Theme.of(context).textTheme.labelMedium,
                  expandedSuffixIcon: SvgPicture.asset(
                    TImage.clearIcon,
                    height: TSizes.iconXs,
                    width: TSizes.iconXs,
                    colorFilter: ColorFilter.mode(
                        dark
                            ? TColors.darkIconColor
                            : TColors.lightIconColor,
                        BlendMode.srcIn),
                  ),
                  closedSuffixIcon: SvgPicture.asset(
                    TImage.arrowDownIcon,
                    height: TSizes.iconXs,
                    width: TSizes.iconXs,
                    colorFilter: ColorFilter.mode(
                        dark
                            ? TColors.darkIconColor
                            : TColors.lightIconColor,
                        BlendMode.srcIn),
                  ),
                  closedFillColor:
                  dark ? TColors.dark : TColors.white,
                  expandedFillColor:
                  dark ? TColors.dark : TColors.white,
                  searchFieldDecoration: SearchFieldDecoration(
                      fillColor:
                      dark ? TColors.dark : TColors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: dark
                                  ? TColors
                                  .darkPrimaryBorderColor
                                  : TColors
                                  .lightPrimaryBorderColor))),
                  prefixIcon: SvgPicture.asset(
                    TImage.propertiesIcon2,
                    height: TSizes.iconSm,
                    width: TSizes.sm,
                    colorFilter: ColorFilter.mode(
                        dark
                            ? TColors.darkIconColor
                            : TColors.primary,
                        BlendMode.srcIn),
                  ),
                  closedBorder: Border.all(
                      width: 1,
                      color: dark
                          ? TColors.darkPrimaryBorderColor
                          : TColors.lightPrimaryBorderColor)),
              excludeSelected: false,
              onChanged: (value) {
                // controller.selectedValue = value;
                debugPrint('changing value to: $value');
              },
            ),
            const SizedBox(height: TSizes.md,),

            const TSectionHeading(title: "Period to Cover:",showActionButton: false,),
            const SizedBox(height: TSizes.md,),

            TRoundedContainer(
              isGradient: false,
              showBorder: true,
              padding: const EdgeInsets.all(TSizes.sm),
              height: TDeviceUtils.getScreenHeight() * 0.35,
              width: double.infinity,
              child: SfDateRangePicker(
                navigationMode: DateRangePickerNavigationMode.snap,
                backgroundColor: Colors.transparent,
                allowViewNavigation: true,
                startRangeSelectionColor: TColors.accent,
                endRangeSelectionColor: TColors.accent,
                rangeSelectionColor: TColors.accent.withOpacity(0.4),
                initialDisplayDate: DateTime.now(),
                monthCellStyle: DateRangePickerMonthCellStyle(
                    specialDatesTextStyle: Theme.of(context).textTheme.headlineLarge,
                    blackoutDateTextStyle: Theme.of(context).textTheme.titleLarge,
                    textStyle: Theme.of(context).textTheme.titleLarge),
                headerStyle: const DateRangePickerHeaderStyle(
                  backgroundColor: Colors.transparent,
                ),
                yearCellStyle: DateRangePickerYearCellStyle(
                    textStyle: Theme.of(context).textTheme.titleLarge),
                todayHighlightColor: TColors.accent,
                selectionColor: TColors.accent,
                view: DateRangePickerView.year,
                maxDate: DateTime.now(),
                selectionMode: DateRangePickerSelectionMode.extendableRange,
                monthViewSettings: const DateRangePickerMonthViewSettings(
                  firstDayOfWeek: 1,

                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
