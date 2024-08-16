import 'package:animate_do/animate_do.dart';
import '../../../../../common/widgets/icons/dotted_circle_border_icon.dart';
import '../../../common/widgets/buttons/primary_button.dart';
import '../../../common/widgets/custom_shapes/containers/onboarding_background_container.dart';
import '../../../data/services/exporter.dart';

class PrimaryPopupContainer extends StatelessWidget {
  const PrimaryPopupContainer({
    super.key,
    required this.headIcon,
    required this.title,
    required this.subTitle,
    required this.buttonText,
    this.onPressed,
    this.child,
    this.showButton = true,
    this.showCancelButton = true,
    this.subTitleTextStyle,
    this.loading,
    this.animation = 3,
  });

  final String headIcon, title, subTitle, buttonText;
  final VoidCallback? onPressed;
  final Widget? child;
  final bool showButton;
  final bool showCancelButton;
  final TextStyle? subTitleTextStyle;
  final Rx<bool>? loading;
  final int animation;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: animation == 0
          ? FadeIn(
              duration: const Duration(milliseconds: 500),
              child: body(context, dark),
            )
          : animation == 1
              ? FadeOut(
                  duration: const Duration(milliseconds: 500),
                  child: body(context, dark),
                )
              : animation == 2
                  ? BounceInDown(
                      duration: const Duration(milliseconds: 500),
                      child: body(context, dark),
                    )
                  : animation == 3
                      ? ElasticIn(
                          duration: const Duration(milliseconds: 500),
                          child: body(context, dark),
                        )
                      : animation == 4
                          ? SlideInDown(
                              duration: const Duration(milliseconds: 500),
                              child: body(context, dark),
                            )
                          : animation == 5
                              ? FlipInX(
                                  duration: const Duration(milliseconds: 500),
                                  child: body(context, dark),
                                )
                              : animation == 6
                                  ? ZoomIn(
                                      duration:
                                          const Duration(milliseconds: 500),
                                      child: body(context, dark),
                                    )
                                  : animation == 7
                                      ? JelloIn(
                                          duration:
                                              const Duration(milliseconds: 500),
                                          child: body(context, dark),
                                        )
                                      : animation == 8
                                          ? Dance(
                                              duration: const Duration(
                                                  milliseconds: 500),
                                              child: body(context, dark),
                                            )
                                          : animation == 9
                                              ? SpinPerfect(
                                                  duration: const Duration(
                                                      milliseconds: 500),
                                                  child: body(context, dark),
                                                )
                                              : BounceInUp(
                                                  duration: const Duration(
                                                      milliseconds: 500),
                                                  child: body(context, dark),
                                                ),
    );
  }

  Center body(BuildContext context, bool dark) {
    return Center(
      child: TRoundedContainer(
        constraints: BoxConstraints(
            maxHeight: TDeviceUtils.getScreenHeight() * 0.84, minHeight: 56),
        width: double.infinity,
        // height: double.infinity,
        showBorder: false,
        margin: const EdgeInsets.symmetric(
            vertical: TSizes.appBarHeight, horizontal: TSizes.md),
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// upper Circle
              Stack(
                children: [
                  OnBoardingBackgroundContainer(
                    radius: TSizes.md,
                    height: TDeviceUtils.getScreenHeight() * 0.20,
                    child: const SizedBox(),
                  ),
                  Align(
                    alignment: AlignmentDirectional.topCenter,
                    child: DottedCircleBorderIcon(
                      icon: headIcon,
                      iconSize: TSizes.pinSize,
                      //borderColor: TColors.darkPrimaryBorderColor,
                    ),
                  ),
                ],
              ),

              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                height: TSizes.sm,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: TSizes.spaceBtwSections),
                child: Text(
                  subTitle,
                  textAlign: TextAlign.center,
                  style: subTitleTextStyle ??
                      Theme.of(context).textTheme.labelMedium!.apply(
                          color:
                              dark ? TColors.darkFontColor : TColors.darkGrey),
                ),
              ),

              child ?? const SizedBox(),

              showButton
                  ? Column(
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.all(TSizes.md),
                          child: PrimaryButton(
                            onPressed: onPressed,
                            title: buttonText,
                            loading: loading ?? false.obs,
                          ),
                        ),
                        showCancelButton
                            ? TextButton(
                                onPressed: () => Get.back(),
                                child: Text(
                                  TTexts.cancelLabel.tr,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ))
                            : const SizedBox()
                      ],
                    )
                  : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
