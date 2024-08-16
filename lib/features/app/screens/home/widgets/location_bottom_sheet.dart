import '../../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../../common/widgets/image_text_widgets/horizontal_image_text.dart';
import '../../../../../data/services/exporter.dart';

class LocationsBottomSheet extends StatelessWidget {
  const LocationsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> label = [
      TTexts.businessBayLabel,
      TTexts.downTownLabel,
      TTexts.dubaiHillsLabel,
      TTexts.dubaiMarinaLabel,
      TTexts.laCoteLabel,
      TTexts.businessBayLabel,
      TTexts.downTownLabel,
      TTexts.dubaiHillsLabel,
      TTexts.dubaiMarinaLabel,
      TTexts.laCoteLabel,
    ];
    List<String> images = [
      TImage.businessBay,
      TImage.downTown,
      TImage.dubaiHills,
      TImage.dubaiMarina,
      TImage.laCote,
      TImage.businessBay,
      TImage.downTown,
      TImage.dubaiHills,
      TImage.dubaiMarina,
      TImage.laCote,
    ];
    return ClipRRect(
      borderRadius: const BorderRadiusDirectional.only(
        topStart: Radius.circular(TSizes.cardRadiusLg),
        topEnd: Radius.circular(TSizes.cardRadiusLg),
      ),
      child: Scaffold(
        body: BackgroundImageContainer(
          child: Column(
            children: [
              const SizedBox(
                height: TSizes.md,
              ),
              Padding(
                padding: const EdgeInsets.all(TSizes.sm),
                child: TSearchContainer(text: TTexts.searchLabel.tr),
              ),
              Flexible(
                child: ListView.separated(
                  itemCount: images.length,
                  padding: const EdgeInsets.symmetric(horizontal: TSizes.sm),
                  separatorBuilder: (_, index) => const Divider(
                    height: TSizes.md,
                  ),
                  itemBuilder: (_, index) => Padding(
                    padding: const EdgeInsets.all(TSizes.sm),
                    child: THorizontalImageText(
                      imageSize: 64,
                      actionButtonOnPressed: () {},
                      showActionButton: true,
                      image: images[index],
                      title: label[index],
                      subTitle: "Price Starting from AED 350 /Night",
                      titleTextStyle: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
