import 'package:dotted_border/dotted_border.dart';
import '../../../../../../../common/widgets/texts/vertical_title_sub_title_widget.dart';
import '../../../../../common/widgets/custom_shapes/containers/status_container.dart';
import '../../../data/services/exporter.dart';

class TransactionsHistoryContainer extends StatelessWidget {
  const TransactionsHistoryContainer({
    super.key,
    required this.bookingAmount,
    required this.expensesAmount,

    required this.transactionAmount,
    required this.transactionDate,
    required this.transactionInvoice,
  });

  final String bookingAmount,
      transactionAmount,
      expensesAmount,
      transactionDate,
      transactionInvoice;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        TRoundedContainer(
          height: 88,
          radius: TSizes.md,
          showBorder: true,
          isGradient: false,
          margin: const EdgeInsetsDirectional.only(top: 8),
          padding: EdgeInsets.zero,
          shadow: TShadowStyle.containerShadow,
          child: Row(
            children: [
              /// icon
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(TSizes.sm),
                  child: DottedBorder(
                    borderType: BorderType.Circle,
                    color:
                        dark ? TColors.grey2 : TColors.darkPrimaryBorderColor,
                    dashPattern: const [2, 2],
                    strokeWidth: 1,
                    borderPadding: const EdgeInsets.all(1),
                    child: Center(
                      child: Text.rich(
                        textAlign: TextAlign.center,
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "${transactionDate.split(" ")[0]}\n",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .apply(
                                      color: dark
                                          ? TColors.darkFontColor
                                          : TColors.primary),
                            ),
                            TextSpan(
                              text: transactionDate.split(" ")[1],
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .apply(
                                      color: dark
                                          ? TColors.darkFontColor
                                          : TColors.primary),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsetsDirectional.symmetric(
                    vertical: TSizes.sm,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(transactionAmount,
                          style: Theme.of(context).textTheme.bodyLarge!.apply(
                              color: dark
                                  ? TColors.darkFontColor
                                  : TColors.primary)),
                      const SizedBox(
                        height: TSizes.xs,
                      ),
                      Text("You earned in April",
                          style: Theme.of(context).textTheme.labelMedium!.apply(
                              color: dark
                                  ? TColors.darkFontColor
                                  : TColors.grey2)),
                    ],
                  ),
                ),
              ),

              Container(
                width: 1,
                height: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: TSizes.sm),
                child: Column(
                  children: List.generate(
                      150 ~/ 5,
                      (index) => Expanded(
                            child: Container(
                              color: index % 2 == 0
                                  ? Colors.transparent
                                  : Colors.grey,
                              height: 1.0,
                            ),
                          )),
                ),
              ),

               Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: VerticalTitleSubTitleWidget(
                              title: "Booking:  ", subTitle: bookingAmount,
                            titleStyle: Theme.of(context).textTheme.labelMedium,
                            subTitleStyle: Theme.of(context).textTheme.labelLarge,
                          ),
                        ),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: VerticalTitleSubTitleWidget(
                              title: "Expenses:  ", subTitle: expensesAmount,
                            titleStyle: Theme.of(context).textTheme.labelMedium,
                            subTitleStyle: Theme.of(context).textTheme.labelLarge,
                          ),
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
        PositionedDirectional(
          end: TSizes.md,
          child: SizedBox(
            width: TDeviceUtils.getScreenWidth(context) * 0.35,
            child: StatusContainer(
              label: "Invoice # $transactionInvoice",
              backgroundColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
