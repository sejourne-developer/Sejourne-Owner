
import '../../../../../common/widgets/layouts/list_layout.dart';
import '../../../../../common/widgets/texts/section_header.dart';
import '../../../../../data/services/exporter.dart';
import 'booking_property_details.dart';

class AllBookingTab extends StatelessWidget {
  const AllBookingTab({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> complete = [
      TImage.prop2,
      TImage.prop7,
      TImage.prop9,
      TImage.prop4,
    ];
    List<String> ongoing = [
      TImage.prop11,
      TImage.prop1,
      TImage.prop16,
      TImage.prop6,
      TImage.prop12,
    ];
    List<String> upcoming = [
      TImage.prop12,
      TImage.prop13,
      TImage.prop14,
    ];
    return RefreshIndicator(
      color: TColors.accent,
      backgroundColor: THelperFunctions.isDarkMode(context)
          ? TColors.darkContainer
          : TColors.white,
      onRefresh: () => Future.delayed(
        const Duration(milliseconds: 500),
        () {
          debugPrint("All booking tab");
        },
      ),
      child:SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsetsDirectional.all(TSizes.sm),
                  child: Column(
                    children: [
                      // const SizedBox(
                      //   height: TSizes.appBarHeight * 2.5,
                      // ),
                      TSectionHeading(
                        title: TTexts.ongoingStaysLabel.tr,
                        showActionButton: false,
                      ),
                      const SizedBox(
                        height: TSizes.md,
                      ),
                      ListLayout(
                          padding: EdgeInsets.zero,
                          separatorHeight: TSizes.md,
                          itemBuilder: (_, index) => BookingPropertyDetails(
                                image: ongoing[0],
                                title:
                                    "Catalin PustaiCatalin PustaiCatalin Pustai",
                                status: TTexts.paidLabel.tr,
                                time: '30m ago',
                                location: '2BR (608) O2 Residence JLT',
                                checkInCheckOutDate: "17.06.2024 - 26.06.2024",
                                nights: "9",
                                price: '950',
                                cleaningFee: '650',
                                paidAmount: '48.400',
                              ),
                          itemCount: 1),
                      const SizedBox(
                        height: TSizes.md,
                      ),
                      TSectionHeading(
                        title: TTexts.upcomingLabel.tr,
                        showActionButton: false,
                      ),
                      const SizedBox(
                        height: TSizes.md,
                      ),
                      ListLayout(
                          padding: EdgeInsets.zero,
                          separatorHeight: TSizes.md,
                          itemBuilder: (_, index) => BookingPropertyDetails(
                                image: upcoming[index],
                                title:
                                    "Catalin PustaiCatalin PustaiCatalin Pustai",
                                status: TTexts.paidLabel.tr,
                                time: '30m ago',
                                location: '2BR (608) O2 Residence JLT',
                                checkInCheckOutDate: "17.06.2024 - 26.06.2024",
                                nights: "9",
                                price: '950',
                                cleaningFee: '650',
                                paidAmount: '48.400',
                              ),
                          itemCount: upcoming.length),
                      const SizedBox(
                        height: TSizes.md,
                      ),
                      TSectionHeading(
                        title: TTexts.completedLabel.tr,
                        showActionButton: false,
                      ),
                      const SizedBox(
                        height: TSizes.md,
                      ),
                      ListLayout(
                          padding: EdgeInsets.zero,
                          separatorHeight: TSizes.md,
                          itemBuilder: (_, index) => BookingPropertyDetails(
                                image: complete[index],
                                title:
                                    "Catalin PustaiCatalin PustaiCatalin Pustai",
                                status: TTexts.paidLabel.tr,
                                time: '30m ago',
                                location: '2BR (608) O2 Residence JLT',
                                checkInCheckOutDate: "17.06.2024 - 26.06.2024",
                                nights: "9",
                                price: '950',
                                cleaningFee: '650',
                                paidAmount: '48.400',
                              ),
                          itemCount: complete.length),

                      SizedBox(
                        height: TDeviceUtils.getBottomNavigationBarHeight() * 2,
                      ),
                    ],
                  )))

    );
  }
}
