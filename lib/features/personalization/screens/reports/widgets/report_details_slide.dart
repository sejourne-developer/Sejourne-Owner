import 'package:sejourne_owner/common/widgets/buttons/primary_button.dart';
import 'package:sejourne_owner/common/widgets/texts/section_heading_with_edit_icon.dart';
import 'package:sejourne_owner/utils/popups/profile_popups/reports/statement_popup.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../common/widgets/layouts/list_layout.dart';
import '../../../../../common/widgets/texts/horizontal_title_subtitle_with_space.dart';
import '../../../../../data/services/exporter.dart';
import '../../../../../utils/local_storage/file_storage.dart';
import '../../../../../utils/popups/profile_popups/reports/expense_report_popup.dart';

class ReportDetailsSlide extends StatelessWidget {
  const ReportDetailsSlide({
    super.key,
    this.margin = const EdgeInsetsDirectional.only(start: TSizes.md),
    this.ignoreAppBar = false,
    this.physics,
    this.showBorder = true,
    this.radius = TSizes.md,
  });

  final EdgeInsetsGeometry margin;
  final bool ignoreAppBar, showBorder;
  final ScrollPhysics? physics;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    List<String> ownerInformationTitle = [
      "${TTexts.name.tr}:",
      "${TTexts.email.tr}:",
      "${TTexts.email.tr}:",
      "${TTexts.phone.tr}:",
      "${TTexts.phone.tr}:",
      "${TTexts.phone.tr}:",
      "${TTexts.address.tr}:",
    ];
    List<String> ownerInformationSubTitle = [
      "Catalin Pustai",
      "catalin@business.com",
      "catalinpustai@gmail.com",
      "+1 303-548-1234",
      "+971 58 123 4567",
      "+971 58 7654 321",
      "7 Glittering Sky, Aliso Viejo, CA, 92656",
    ];
    List<String> propertyInformationTitle = [
      "${TTexts.statusLabel.tr}:",
      "${TTexts.propertyLabel.tr}:",
      "${TTexts.locationLabel.tr}:",
      "Property Size:",
      "Property Features:",
      "${TTexts.partySizeLabel.tr}:",
      "${TTexts.listingSiteLabel.tr}:",
      "${TTexts.dateLabel.tr}:",
    ];
    List<String> propertyInformationSubTitle = [
      "Okay",
      "Studio (806) at Dubai Arch (JLT)",
      "Dubai Downtown",
      "256 sqf",
      "wifi,swimming pool,ac,tv,gym...",
      "1 Adult",
      "Airbnb",
      "30-04-2024 - 30-05-2024",
    ];
    List<String> financialDetailsTitle = [
      "Rental Income:",
      "Utilities:",
      "Maintenance & Repairs:",
      "Cleaning Services:",
      "Property Management Fees:",
      "Furniture & Appliances:",
      "Renovations & Upgrades:",
      "Insurance:",
      "Taxes:",
    ];
    List<String> financialDetailsSubTitle = [
      "11,386.09 AED",
      "500.00 AED",
      "300.00",
      "50.00",
      "1,500.00 AED",
      "105.75 AED",
      "278.00 AED",
      "2,500.00 AED",
      "684.05 AED",
    ];

    List<String> column1 = [
      TTexts.itemLabel.tr,
      TTexts.rentLabel.tr,
      TTexts.surchargeLabel.tr,
      TTexts.taxLabel.tr,
      TTexts.taxLabel.tr,
    ];

    List<String> column2 = [
      TTexts.descriptionLabel.tr,
      TTexts.rentLabel.tr,
      TTexts.oneBedroomApartmentCleaningFeeLabel.tr,
      TTexts.dubaiTourismTaxLabel.tr,
      TTexts.vatLabel.tr,
    ];
    List<String> column3 = [
      TTexts.amountLabel.tr,
      "10,386.75",
      "180.00",
      "300.00",
      "5%",
    ];
    List<String> column4 = [
      TTexts.commLabel.tr,
      "17%",
      "0%",
      "",
      "",
    ];
    List<String> column5 = [
      TTexts.expLabel.tr,
      "",
      "180.00",
      "",
      "",
    ];

    return TRoundedContainer(
      margin: margin,
      radius: radius,
      showBorder: showBorder,
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
        physics: physics ?? const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(TSizes.sm),
          child: Column(
            children: [
              ignoreAppBar
                  ? const SizedBox()
                  : TAppBar(
                      title: Text(TTexts.overviewLabel.tr),
                      showBackArrow: false,
                      actions: [
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: TSizes.md),
                            child: TCircularIcon(
                              icon: TImage.clearIcon,
                              onPressed: () => Get.back(),
                            )),
                      ],
                    ),

              /// Dotted Title
              SectionHeadingWithEditIcon(
                title: "Owner Information",
                showEditButton: false,
                onPressed: () {},
              ),

              ListLayout(
                itemCount: ownerInformationTitle.length,
                padding:
                    const EdgeInsetsDirectional.symmetric(vertical: TSizes.sm),
                itemBuilder: (_, index) =>
                    HorizontalTitleSubtitleWithDottedDivider(
                  title: ownerInformationTitle[index],
                  subTitle: ownerInformationSubTitle[index],
                ),
              ),

              /// Dotted Title
              SectionHeadingWithEditIcon(
                title: "Property Information",
                onPressed: () => showDialog(
                  context: context,
                  builder: (_) => const ExpenseReportPopup(),
                ),
              ),

              ListLayout(
                itemCount: propertyInformationTitle.length,
                padding:
                    const EdgeInsetsDirectional.symmetric(vertical: TSizes.sm),
                itemBuilder: (_, index) =>
                    HorizontalTitleSubtitleWithDottedDivider(
                  title: propertyInformationTitle[index],
                  subTitle: propertyInformationSubTitle[index],
                ),
              ),

              /// Dotted Title
              SectionHeadingWithEditIcon(
                title: TTexts.financialDetailsLabel.tr,
                showEditButton: false,
                onPressed: () {},
              ),

              ListLayout(
                itemCount: financialDetailsTitle.length,
                padding:
                    const EdgeInsetsDirectional.symmetric(vertical: TSizes.sm),
                itemBuilder: (_, index) =>
                    HorizontalTitleSubtitleWithDottedDivider(
                  title: financialDetailsTitle[index],
                  subTitle: financialDetailsSubTitle[index],
                ),
              ),

              Padding(
                padding:
                    const EdgeInsetsDirectional.symmetric(vertical: TSizes.sm),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Income:",
                      style: Theme.of(context).textTheme.labelLarge!.apply(
                          color:
                              dark ? TColors.darkFontColor : TColors.primary),
                    ),
                    Text(
                      "15,306.09",
                      style: Theme.of(context).textTheme.labelLarge!.apply(
                          color:
                              dark ? TColors.darkFontColor : TColors.darkGrey),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.symmetric(vertical: TSizes.sm),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Expenses:",
                      style: Theme.of(context).textTheme.labelLarge!.apply(
                          color:
                              dark ? TColors.darkFontColor : TColors.primary),
                    ),
                    Text(
                      "4,118.00",
                      style: Theme.of(context).textTheme.labelLarge!.apply(
                          color:
                              dark ? TColors.darkFontColor : TColors.darkGrey),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.symmetric(vertical: TSizes.sm),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Net Income:",
                      style: Theme.of(context).textTheme.labelLarge!.apply(
                          color:
                              dark ? TColors.darkFontColor : TColors.primary),
                    ),
                    Text(
                      "11,566.09",
                      style: Theme.of(context).textTheme.labelLarge!.apply(
                          color:
                              dark ? TColors.darkFontColor : TColors.darkGrey),
                    ),
                  ],
                ),
              ),

              /// Dotted Title
              // DottedCenterTitle(
              //   title: TTexts.chargesDetailsLabel.tr,
              //   borderColor:
              //   dark ? TColors.lightPrimaryBorderColor : TColors.primary,
              //   dottedRoundedBorderTitle: true,
              // ),
              //
              // ConstrainedBox(
              //   constraints: const BoxConstraints(
              //       maxHeight: double.infinity, minHeight: 56.0),
              //   child: ListView.separated(
              //     itemCount: column1.length,
              //     shrinkWrap: true,
              //     physics: const NeverScrollableScrollPhysics(),
              //     padding: const EdgeInsetsDirectional.symmetric(
              //         vertical: TSizes.sm),
              //     separatorBuilder: (_, index) =>
              //     const SizedBox(
              //       height: TSizes.sm,
              //     ),
              //     itemBuilder: (_, index) =>
              //         ChargeDetailsTableRow(
              //           isLast: index == column1.length - 1 ? true : false,
              //           isFirst: index == 0 ? true : false,
              //           column1: column1[index],
              //           column2: column2[index],
              //           column3: column3[index],
              //           column4: column4[index],
              //           column5: column5[index],
              //         ),
              //   ),
              // ),

              /// Dotted Title
              SectionHeadingWithEditIcon(
                title: "Owner Notes/Comments",
                showEditButton: false,
                onPressed: () {},
              ),
              const SizedBox(
                height: TSizes.sm,
              ),

              Stack(
                children: [
                  TextFormField(
                    maxLines: 5,
                    decoration:
                        const InputDecoration(hintText: "comments ...."),
                  ),
                  PositionedDirectional(
                      end: TSizes.sm,
                      bottom: TSizes.sm,
                      child: PrimaryButton(
                        width: 56,
                        radius: TSizes.sm,
                        textStyle: Theme.of(context).textTheme.labelSmall!.apply(color: dark?TColors.darkFontColor:TColors.white),
                        height: 32,
                        title: TTexts.submitLabel.tr,
                        onPressed: () {},
                        loading: false.obs,
                      ))
                ],
              ),
              const SizedBox(height: TSizes.md,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  PrimaryButton(
                    width: 56,
                    radius: TSizes.sm,
                    padding: const EdgeInsetsDirectional.symmetric(horizontal: TSizes.sm),
                    textStyle: Theme.of(context).textTheme.labelSmall!.apply(color: dark?TColors.darkFontColor:TColors.white),
                    height: 32,
                    title: "Print Report",
                    onPressed: () {
                      FileStorage.writeCounter(
                          ownerInformationSubTitle.toString(), "ownerInformationSubTitle.txt");
                    },
                    loading: false.obs,
                  ),
                  PrimaryButton(
                    width: 56,
                    radius: TSizes.sm,
                    padding: const EdgeInsetsDirectional.symmetric(horizontal: TSizes.sm),
                    textStyle: Theme.of(context).textTheme.labelSmall!.apply(color: dark?TColors.darkFontColor:TColors.white),
                    height: 32,
                    title: "Ask for Statement",
                    onPressed: () {
                      showDialog(context: context, builder: (_)=>const StatementPopup());

                    },
                    loading: false.obs,
                  ),
                  PrimaryButton(
                    width: 56,
                    radius: TSizes.sm,
                    textStyle: Theme.of(context).textTheme.labelSmall!.apply(color: dark?TColors.darkFontColor:TColors.white),
                    height: 32,
                    title: TTexts.sContinue.tr,
                    onPressed: () {},
                    loading: false.obs,
                  )
                ],
              )
              // bulletText(
              //     "${TTexts.aprLabel.tr} 10, 24 - ${TTexts
              //         .theBookingWasEnteredLabel.tr}"),
              // bulletText(
              //     "${TTexts.aprLabel.tr} 10, 24 - ${TTexts.collectedOfLabel
              //         .tr} د.إ. 819.34 ${TTexts.fromCreditCardLabel.tr}."),
              // bulletText(
              //     "${TTexts.aprLabel.tr} 10, 24 - ${TTexts.collectedOfLabel
              //         .tr} د.إ. 10,566.75 ${TTexts.fromCreditCardLabel.tr}."),
              // bulletText(
              //     "${TTexts.aprLabel.tr} 10, 24 - ${TTexts
              //         .collectedOfDepositLabel.tr} د.إ. 1,000.00 ${TTexts
              //         .fromCreditCardVisaLabel.tr} ***7297."),
            ],
          ),
        ),
      ),
    );
  }

  Widget bulletText(String text) => Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.xs),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text.rich(
                TextSpan(children: [
                  TextSpan(
                    text: '\u2022  ',
                    style: Theme.of(Get.context!)
                        .textTheme
                        .bodyLarge!
                        .apply(color: TColors.primary),
                  ),
                  TextSpan(
                      text: "${text.split('-')[0]}-",
                      style: Theme.of(Get.context!)
                          .textTheme
                          .labelMedium!
                          .apply(color: TColors.primary)),
                  TextSpan(
                      text: text.split('-')[1],
                      style: Theme.of(Get.context!)
                          .textTheme
                          .labelMedium!
                          .apply(color: TColors.grey2)),
                ]),
                softWrap: true,
              ),
            ),
          ],
        ),
      );
}
