import 'package:flexi_productimage_slider/flexi_productimage_slider.dart';
import 'package:flutter/material.dart';
import 'package:fullscreen_image_viewer/fullscreen_image_viewer.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../../../data/services/app_variables.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../messages/controllers/messages/messages_controller.dart';
import '../../../../messages/screens/chat/chat_screen.dart';
import '../../../controllers/product_details/product_details_controller.dart';

class PropertyImageSlider extends StatelessWidget {
  const PropertyImageSlider({
    super.key,
    required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    List<String> arrayImages = const [
      "https://sejourne.ae/wp-content/uploads/2024/03/2-24.jpg",
      "https://sejourne.ae/wp-content/uploads/2024/03/3-26.jpg",
      "https://sejourne.ae/wp-content/uploads/2024/03/4-26.jpg",
      "https://sejourne.ae/wp-content/uploads/2024/03/5-25.jpg",
      "https://sejourne.ae/wp-content/uploads/2024/03/6-24.jpg",
    ];
    //final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(ProductDetailsController());
    controller.currentImagePageIndex.value = banners.length - 1;
    return Container(
      color: Colors.transparent,
      child: Stack(
        children: [
          Container(
            height: 220,
            padding: const EdgeInsets.all(TSizes.xs),
            child: PageView(
                controller: controller.imagePageController,
                onPageChanged: controller.updatePageIndicator,
                children: [
                  for (int i = 0; i < banners.length; i++)
                    TRoundedImage(
                        onPressed: () {
                          /// Full Screen Image Slider
                          FullscreenImageViewer.open(
                              context: context,
                              child: Material(
                                color: Colors.transparent,
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    TAppBar(
                                      showBackArrow: false,
                                      actions: [
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .symmetric(horizontal: 8.0),
                                          child: TCircularIcon(
                                            height: TSizes.iconMd,
                                            width: TSizes.iconMd,
                                            icon: TImage.clearIcon,
                                            onPressed: () => Get.back(),
                                          ),
                                        )
                                      ],
                                    ),
                                    // const SizedBox(
                                    //   height: TSizes.spaceBtwSections,
                                    // ),
                                    flexiProductimageSlider(
                                      arrayImages: arrayImages,
                                      //set where you want to set your thumbnail
                                      sliderStyle: SliderStyle.nextToSlider,
                                      //.nextToSlider
                                      aspectRatio: 0.6,
                                      // set you slider height like 1.0,1.5,2.0 etc...
                                      boxFit: BoxFit.contain,
                                      //set content mode of image
                                      selectedImagePosition: i,
                                      //set this if you want to set any default image index when it loads
                                      thumbnailAlignment:
                                          ThumbnailAlignment.bottom,
                                      //.right , .bottom //set your thumbnail alignment in slider
                                      thumbnailBorderType:
                                          ThumbnailBorderType.bottom,
                                      //.bottom, .all
                                      thumbnailBorderWidth: 1.5,
                                      //double value
                                      thumbnailBorderRadius: TSizes.xs,
                                      //set corner radius of your thumbnail
                                      //set your thumbnail height & width
                                      //NOTE : if you set ThumbnailShape.circle then set thumbnail width height same
                                      thumbnailWidth: 55,
                                      thumbnailHeight: 55,
                                      thumbnailBorderColor: TColors
                                          .accent, //set color of current image thumbnail border
                                    ),
                                  ],
                                ),
                              ));
                        },
                        borderRadius: TSizes.md,
                        imageUrl: banners[i]),
                ]),
          ),

          /// Image Slider
          PositionedDirectional(
            end: TSizes.spaceBtwSections,
            bottom: 20,
            start: TSizes.spaceBtwSections,
            child: SizedBox(
              height: 40,
              width: double.infinity,
              child: Row(
                children: [
                  /// Previous Image Button
                  InkWell(
                    onTap: () => controller.prevImagePage(),
                    child: const TCircularContainer(
                      width: TSizes.iconXs,
                      height: double.infinity,
                      margin: EdgeInsetsDirectional.only(end: 10),
                      backgroundColor: TColors.grey,
                      child: Center(
                          child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: TSizes.sm,
                      )),
                    ),
                  ),

                  /// Image Thumb
                  Flexible(
                    //flex: 15,
                    child: ListView.builder(
                        itemCount: banners.length,
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.horizontal,
                        // separatorBuilder: (_, __) => const SizedBox(
                        //   width: TSizes.spaceBtwItems,
                        // ),
                        itemBuilder: (_, index) => TRoundedImage(
                              onPressed: () {
                                controller.currentImagePageIndex.value = index;
                                controller.updatePageIndicator(index);
                                controller.imageNavigationClick(index);
                              },
                              borderRadius: TSizes.sm,
                              padding: EdgeInsets.zero,
                              margin: const EdgeInsetsDirectional.only(start: TSizes.xs),
                              imageUrl: banners[index],
                              width: 56,
                              border:
                                  Border.all(color: TColors.white, width: 1),
                            )),
                  ),
                  const SizedBox(
                    width: TSizes.sm,
                  ),

                  /// Next Image Button
                  InkWell(
                    onTap: () => controller.nextImagePage(banners.length - 1),
                    child: const TCircularContainer(
                      width: TSizes.iconXs,
                      height: double.infinity,
                      margin: EdgeInsetsDirectional.only(end: 10),
                      backgroundColor: TColors.grey,
                      child: Center(
                          child: Icon(
                        Icons.arrow_forward_ios,
                        size: TSizes.sm,
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// Appbar Icons
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: TSizes.defaultSpace, vertical: TSizes.md),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TCircularIcon(
                  icon:Get.locale == arabic ?TImage.rightArrowIcon: TImage.backArrow,
                  onPressed: () => Get.back(),
                ),
                Row(
                  children: [
                    TCircularIcon(
                      onPressed: () => Share.share(
                          'check out my website https://example.com',
                          subject: 'Look what I made!'),
                      icon: TImage.share,
                    ),
                    const SizedBox(
                      width: TSizes.sm,
                    ),
                    TCircularIcon(
                      onPressed: () => Get.to(() {
                        Get.put(MessagesController());
                        return const ChatScreen();
                      }),
                      icon: TImage.messagesIcon,
                    ),
                    const SizedBox(
                      width: TSizes.sm,
                    ),
                    Obx(
                      () => TCircularIcon(
                        onPressed: () => controller.favorite.value =
                            !controller.favorite.value,
                        isAnimated: controller.favorite.value,
                        icon: TImage.wishListIcon,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
