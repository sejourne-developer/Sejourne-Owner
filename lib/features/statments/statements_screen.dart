import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sejourne_owner/utils/constants/text_strings.dart';

import '../../../../common/widgets/appbar/main_screens_appbar.dart';
import '../../../../common/widgets/custom_shapes/containers/background_image_container.dart';
import '../../../../common/widgets/layouts/list_layout.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../common/styles/spacing_styles.dart';
import '../../common/widgets/appbar/network_checker_container.dart';
import '../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import 'widgets/transactions_history_container.dart';

class StatementsScreen extends StatelessWidget {
  const StatementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      body: BackgroundImageContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const NetworkCheckerContainer(),

            Padding(
              padding: TSpacingStyle.paddingWithAppBarHeight2,
              child: MainScreensAppBar(
                  leadingIcon: TImage.statementIcon,
                  title: TTexts.statementsLabel.tr),
            ),
            const SizedBox(
              height: TSizes.md,
            ),

            /// Search and Filter row
            Padding(
              padding:
                  const EdgeInsetsDirectional.symmetric(horizontal: TSizes.sm),
              child: SizedBox(
                height: 48,
                child: Row(
                  children: [
                    const Expanded(
                        flex: 11,
                        child: TSearchContainer(
                          text: "Search your keyword here...",
                          padding: EdgeInsets.zero,
                          isTextField: true,
                        )),
                    const SizedBox(
                      width: TSizes.sm,
                    ),

                    /// Filter Icon
                    Expanded(
                      flex: 2,
                      child: TRoundedContainer(
                        // onPressed: (){
                        //   // controller.toggleEndDrawer();
                        //   controller.openEndDrawer();
                        //   // MyDrawerController.scaffoldKey.currentState?.openEndDrawer();
                        // },
                        padding: const EdgeInsets.all(TSizes.md - 2),
                        backgroundColor: Get.isDarkMode
                            ? TColors.blackContainer
                            : TColors.light,
                        isGradient: false,
                        showBorder: true,
                        radius: TSizes.sm,
                        width: TSizes.iconLg,
                        height: 44,
                        child: SvgPicture.asset(
                          TImage.filterIcon,
                          colorFilter: ColorFilter.mode(
                              Get.isDarkMode
                                  ? TColors.darkIconColor
                                  : TColors.lightIconColor,
                              BlendMode.srcIn),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsetsDirectional.all(TSizes.sm),
              child: Text(
                "Last 6 months records",
                style: Theme.of(context).textTheme.labelMedium!.apply(
                    color:
                        Get.isDarkMode ? TColors.darkFontColor : TColors.grey2),
              ),
            ),

            ListLayout(
              padding:
                  const EdgeInsetsDirectional.symmetric(horizontal: TSizes.sm),
              separatorHeight: TSizes.md,
              itemBuilder: (_, index) => const TransactionsHistoryContainer(
                transactionAmount: "14,096.03 AED",
                bookingAmount: "15,989.70 AED",
                expensesAmount: "1,893.67 AED",
                transactionDate: "MAR 2024",
                transactionInvoice: "SJ0032455",
              ),
              itemCount: 2,
            ),
          ],
        ),
      ),
    );
  }
}
