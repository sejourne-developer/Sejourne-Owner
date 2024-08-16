
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../data/services/exporter.dart';
import 'primary_popup_container.dart';

class CalenderPopUpForm extends StatelessWidget {
  const CalenderPopUpForm(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.buttonText,
      this.onPressed,
      this.onSelectedDate,
      this.initialSelectedDate,
      this.endSelectedDate,
      this.dateRangePickerSelectionMode = DateRangePickerSelectionMode.single,
      this.enablePastDates = false,
      this.maxDate,
      this.headIcon, this.minDate, this.dateRangePickerView=DateRangePickerView.month});

  final String title, subTitle, buttonText;
  final String? headIcon;
  final VoidCallback? onPressed;
  final DateTime? initialSelectedDate, endSelectedDate, maxDate,minDate;
  final DateRangePickerSelectionMode dateRangePickerSelectionMode;
  final bool enablePastDates;
  final void Function(DateRangePickerSelectionChangedArgs)? onSelectedDate;
final DateRangePickerView dateRangePickerView;
  @override
  Widget build(BuildContext context) {
    return PrimaryPopupContainer(
      headIcon: headIcon ?? TImage.searchBookingIcon,
      title: title,
      subTitle: subTitle,
      buttonText: buttonText,
      onPressed: onPressed,
      child: TRoundedContainer(
        isGradient: false,
        showBorder: true,
        padding: const EdgeInsets.all(TSizes.sm),
        margin: const EdgeInsets.all(TSizes.sm),
        height: TDeviceUtils.getScreenHeight() * 0.35,
        width: double.infinity,
        child: SfDateRangePicker(
          maxDate: maxDate,
          minDate: minDate,
          navigationMode: DateRangePickerNavigationMode.snap,
          backgroundColor: Colors.transparent,
          allowViewNavigation: true,
          enablePastDates: enablePastDates,
          onSelectionChanged: onSelectedDate,
          startRangeSelectionColor: TColors.accent,
          endRangeSelectionColor: TColors.accent,
          rangeSelectionColor: TColors.accent.withOpacity(0.4),
          initialDisplayDate: initialSelectedDate,
          initialSelectedRange:
              PickerDateRange(initialSelectedDate, endSelectedDate),
          initialSelectedDate: initialSelectedDate,
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
          view: dateRangePickerView,
          selectionMode: dateRangePickerSelectionMode,
          monthViewSettings: const DateRangePickerMonthViewSettings(
            firstDayOfWeek: 1,

          ),
        ),
      ),
    );
  }
}
