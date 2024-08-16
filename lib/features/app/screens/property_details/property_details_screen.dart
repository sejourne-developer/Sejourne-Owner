import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:readmore/readmore.dart';
import '../../../../common/widgets/custom_shapes/containers/property_container.dart';
import '../../../../common/widgets/custom_shapes/containers/status_container.dart';
import '../../../../common/widgets/images/rounded_image.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/layouts/list_layout.dart';
import '../../../../common/widgets/texts/section_header.dart';
import '../../../../data/services/exporter.dart';
import '../../../personalization/screens/reviews/reviews_screen.dart';
import '../../controllers/product_details/product_details_controller.dart';
import '../map/map_screen.dart';
import 'widgets/bottom_add_to_cart_widget.dart';
import 'widgets/details_widget.dart';
import 'widgets/features_widget.dart';
import 'widgets/property_detail_image_slider.dart';
import 'widgets/property_reviews.dart';
import 'widgets/summary_widget.dart';

class PropertyDetailScreen extends StatelessWidget {
  const PropertyDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductDetailsController());
    List<String> banners = [
      TImage.prop1,
      TImage.prop2,
      TImage.prop3,
      TImage.prop5,
      TImage.prop6,
    ];
    //final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: const TBottomAddToCart(),
      body: BackgroundImageContainer(
        child: InteractiveViewer(
          panEnabled: true,
          maxScale: 4,
          minScale: 0.5,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const NetworkCheckerContainer(),
                SizedBox(
                  height: TDeviceUtils.getAppBarHeight(),
                ),

                /// -- Product Image Slider
                PropertyImageSlider(
                  banners: banners,
                ),

                /// Product Details
                Padding(
                  padding: const EdgeInsets.only(
                      right: TSizes.sm,
                      left: TSizes.sm,
                      bottom: TSizes.sm,
                      top: TSizes.defaultSpace),
                  child: Column(
                    children: [
                      /// -- Summary Button
                      const Summary(),
                      const SizedBox(
                        height: TSizes.spaceBtwSections,
                      ),

                      /// -- About this Listing
                      TSectionHeading(
                        title: TTexts.aboutThisListing.tr,
                        showActionButton: false,
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      ReadMoreText(
                        TTexts.propertyDescription.tr,
                        trimLines: 5,
                        trimMode: TrimMode.Line,
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .apply(color: TColors.darkGrey),
                        trimCollapsedText: TTexts.showMoreLabel.tr,
                        trimExpandedText: TTexts.lessLabel.tr,
                        moreStyle: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                        lessStyle: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwSections,
                      ),

                      /// -- Details
                      TSectionHeading(
                        title: TTexts.detailsLabel.tr,
                        showActionButton: false,
                      ),
                      const SizedBox(
                        height: TSizes.sm,
                      ),
                      const DetailsWidget(),
                      const SizedBox(
                        height: TSizes.spaceBtwSections,
                      ),

                      /// -- Gallery
                      TSectionHeading(
                        title: TTexts.gallery.tr,
                        showActionButton: false,
                      ),
                      const SizedBox(
                        height: TSizes.sm,
                      ),
                      TGridLayout(
                        itemCount: banners.length,
                        crossAxisSpacing: TSizes.sm,
                        mainAxisSpacing: TSizes.sm,
                        mainAxisExtent: TSizes.productImageSize,
                        itemBuilder: (_, index) =>  TRoundedImage(
                            margin: EdgeInsets.zero,
                            width: TSizes.productImageSize,
                            borderRadius: TSizes.sm,
                            imageUrl: banners[index],
                            fit: BoxFit.contain,

                        ),
                        crossAxisCount: 3,
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwSections,
                      ),

                      /// -- features
                      TSectionHeading(
                        title: TTexts.featuresLabel.tr,
                        showActionButton: false,
                      ),
                      const SizedBox(
                        height: TSizes.sm,
                      ),
                      const FeaturesWidget(),
                      const SizedBox(
                        height: TSizes.spaceBtwSections,
                      ),

                      /// -- Mini Map
                      TSectionHeading(
                        title: TTexts.whereYouBe.tr,
                        showActionButton: false,
                      ),
                      const SizedBox(
                        height: TSizes.sm,
                      ),
                      TRoundedContainer(
                        height: 200,
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: const BorderRadiusDirectional.all(
                              Radius.circular(TSizes.md)),
                          child: GoogleMap(
                            style: THelperFunctions.isDarkMode(context)
                                ? ProductDetailsController.instance.darkMapStyle
                                : null,
                            liteModeEnabled: true,
                            // the required field
                            mapToolbarEnabled: false,
                            // to disable buttons
                            markers: {
                              const Marker(
                                  markerId: MarkerId("Property Location"),
                                  position: LatLng(25.276987, 55.296249),
                                  icon: BitmapDescriptor.defaultMarker)
                            },
                            onTap: (latLng) => Get.to(
                              () => const MapScreen(
                                propertyLatitude: 25.276987,
                                propertyLongitude: 55.296249,
                                initialLatitude: 25.276987,
                                initialLongitude: 55.296249,
                              ),
                            ),
                            initialCameraPosition: const CameraPosition(
                                target: LatLng(25.276987, 55.296249), zoom: 10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwSections,
                      ),

                      /// -- Overall Rating
                      TSectionHeading(
                        title: TTexts.overallRating.tr,
                        showActionButton: false,
                      ),
                      const SizedBox(
                        height: TSizes.sm,
                      ),
                      const PropertyReviewsWidget(),
                      GestureDetector(
                        onTap: ()=>Get.to(()=>const ReviewsScreen()),
                        child: StatusContainer(
                          padding: const EdgeInsetsDirectional.all(TSizes.md),
                          child: Center(
                            child: Text(
                              TTexts.viewMoreReviews.tr,
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwSections,
                      ),

                      /// -- recommendations
                      TSectionHeading(
                        title: TTexts.recommendations.tr,
                      ),
                      const SizedBox(
                        height: TSizes.sm,
                      ),
                      ListLayout(
                        padding: EdgeInsets.zero,
                          separatorHeight: TSizes.sm,
                          itemBuilder: (_, index) => PropertyWidget(
                            isApproved: false.obs,
                            margin: EdgeInsets.zero,
                                onPressed: () =>
                                    Get.to(() => const PropertyDetailScreen()),
                                propertyImage: banners[index],
                                isFav: false.obs,
                                com: false.obs,
                                index: index,
                              ),
                          itemCount: banners.length),

                      const SizedBox(
                        height: TSizes.appBarHeight * 2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
