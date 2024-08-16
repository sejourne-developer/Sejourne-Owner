import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sejourne_owner/common/widgets/layouts/grid_layout.dart';

import '../../../../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../../../../common/widgets/images/upload_pic.dart';
import '../../../../../../../../data/services/exporter.dart';

class AddPropertyImages extends StatelessWidget {
  const AddPropertyImages({super.key, required this.images});

  final RxList images;

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print(
        "=================================================index${images.length}, images ${images.isEmpty}");
    }
    return Obx(
      () => TGridLayout(
        itemCount:images.length,
        scrollPhysics: const NeverScrollableScrollPhysics(),
        mainAxisExtent: 56,
        crossAxisCount: 5,
        itemBuilder: (_, index) {
          return index==0
              ? TRoundedContainer(
                  height: 56,
                  width: 56,
                  onPressed: () => Get.bottomSheet(
                    UploadPhoto(
                      onCameraUpload: () async {
                        final photo = await THelperFunctions.uploadPicture(
                            ImageSource.camera);
                        if (photo != null) {
                          images.add(photo);
                        } else {
                          THelperFunctions.showAlert(
                              TTexts.imageNotTake.tr, "");
                        }
                      },
                      onGalleryUpload: () async {
                        final photo = await THelperFunctions.uploadPicture(
                            ImageSource.gallery);
                        if (photo != null) {
                          images.add(photo);
                        } else {
                          THelperFunctions.showAlert(
                              TTexts.imageNotSelect.tr, "");
                        }
                      },
                    ),
                  ),
                  backgroundColor: THelperFunctions.isDarkMode(context)
                      ? TColors.darkContainer
                      : TColors.softGrey,
                  radius: TSizes.sm,
                  padding: const EdgeInsets.all(TSizes.sm),
                  child: SvgPicture.asset(
                    TImage.cameraIcon,
                    colorFilter:
                        const ColorFilter.mode(TColors.grey2, BlendMode.srcIn),
                  ),
                )
              : Stack(
                  children: [
                    SizedBox(
                      height: 55,
                      width: 55,
                      child: ClipRRect(
                        borderRadius: const BorderRadiusDirectional.all(
                            Radius.circular(TSizes.sm)),
                        child: Image(
                          image: FileImage(images[index]) as ImageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    PositionedDirectional(
                      top: 4,
                      end: 4,
                      child: TCircularIcon(
                        onPressed: () => images.removeAt(index),
                        icon: TImage.clearIcon,
                        padding: TSizes.xs,
                        height: TSizes.md,
                        width: TSizes.md,
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
