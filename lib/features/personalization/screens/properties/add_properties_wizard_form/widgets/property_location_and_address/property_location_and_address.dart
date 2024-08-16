import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sejourne_owner/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:sejourne_owner/features/personalization/controllers/add_properties_wizard_form_controller.dart';
import 'package:sejourne_owner/features/personalization/screens/properties/add_properties_wizard_form/widgets/property_location_and_address/widgets/location_map.dart';

import '../../../../../../../common/widgets/buttons/primary_button.dart';
import '../../../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../../../common/widgets/texts/section_heading_with_edit_Icon.dart';
import '../../../../../../../data/services/exporter.dart';
import '../../../../../../app/screens/search/widgets/drop_down_location_field.dart';

class PropertyLocationAndAddress extends StatelessWidget {
  const PropertyLocationAndAddress(
      {super.key, this.onContinuePressed, this.onBackPressed});

  final VoidCallback? onContinuePressed, onBackPressed;

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    final controller = AddPropertiesWizardFormController.instance;

    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            "Location and Address",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SectionHeadingWithEditIcon(
            title: "Where's your place located?",
            showEditButton: false,
            onPressed: () {},
          ),
          Stack(
            children: [
              TRoundedContainer(
                height: 250,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: const BorderRadiusDirectional.all(
                      Radius.circular(TSizes.md)),
                  child: Obx(
                    () => GoogleMap(
                      zoomGesturesEnabled: true,
                      zoomControlsEnabled: false,
                      onMapCreated: (GoogleMapController googleMapController) {
                        controller.googleMapController = googleMapController;
                      },
                      style: THelperFunctions.isDarkMode(context)
                          ? AddPropertiesWizardFormController
                              .instance.darkMapStyle
                          : null,
                      liteModeEnabled: true,
                      mapToolbarEnabled: false,
                      markers: controller.markers
                        ..add(controller.locationMarker.value),
                      onTap: (latLng) => showDialog(
                        context: context,
                        builder: (context) {
                          if (kDebugMode) {
                            print("================================================   ${controller.myLocation.value}  ===========================================");
                          }
                          return LocationMap(
                          initialLatitude:
                              controller.myLocation.value.latitude,
                          initialLongitude:
                              controller.myLocation.value.longitude,
                        );
                        },
                      ),
                      initialCameraPosition: const CameraPosition(
                          target: LatLng(25.276987, 55.296249), zoom: 10),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.all(TSizes.sm),
                child: Row(
                  children: [
                    Flexible(
                        flex: 13,
                        child: TSearchContainer(text: TTexts.searchLabel.tr,isTextField: true,)),
                    const SizedBox(
                      width: TSizes.sm,
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 2,
                      child: TRoundedContainer(
                        height: 48,
                        onPressed: () {},
                        radius: TSizes.sm,
                        child: Obx(
                          () => TCircularIcon(
                            showBorder: false,
                            backgroundColor: Colors.transparent,
                            icon: TImage.locationIcon,
                            isAnimated: controller.isLoading.value,
                            animatedIcon: TImage.loadingAnimation,
                            height: TSizes.iconMd,
                            width: TSizes.iconMd,
                            padding: TSizes.sm+4,
                            onPressed: () async {
                              controller.isLoading.value = true;
                              await THelperFunctions.determinePosition()
                                  .then((onValue) async {
                                controller.myLocation.value = LatLng(onValue.latitude, onValue.longitude);
                                if (kDebugMode) {
                                  print("================================================   ${controller.myLocation.value}  ===========================================");
                                }
                                CameraPosition camera = CameraPosition(
                                    target: controller.myLocation.value,
                                    zoom: 14);
                                controller.locationMarker.value = Marker(
                                  onDrag: ((newPosition) {
                                    controller.myLocation.value = newPosition;
                                    if (kDebugMode) {
                                      print(newPosition.latitude);

                                    print(newPosition.longitude);}
                                  }),
                                  draggable: true,
                                  onDragEnd: ((newPosition) {
                                    controller.myLocation.value = newPosition;
                                    if (kDebugMode) {
                                      print(newPosition.latitude);

                                    print(newPosition.longitude);}
                                  }),
                                  markerId: const MarkerId("My Location"),
                                  icon: await THelperFunctions.googleMapMarker(
                                      32,
                                      text: null),
                                  position: controller.myLocation.value,
                                );

                                controller.googleMapController?.animateCamera(
                                  CameraUpdate.newCameraPosition(camera),
                                );
                                controller.markers
                                    .add(controller.locationMarker.value);

                                controller.isLoading.value = false;

                                debugPrint("controller.myLocation.value");
                              });
                            },
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: TSizes.md,
          ),

          /// Location Drop down Field
          const DropDownLocationField(),
          const SizedBox(
            height: TSizes.md,
          ),
          TextFormField(
            controller: controller.houseController,
            decoration: const InputDecoration(
              hintText: "House, flat number etc",
            ),
          ),
          const SizedBox(
            height: TSizes.md,
          ),
          TextFormField(
            controller: controller.landmarkController,
            decoration: const InputDecoration(
              hintText: "Landmark",
            ),
          ),
          const SizedBox(
            height: TSizes.md,
          ),
          TextFormField(
            controller: controller.streetAddressController,
            decoration: const InputDecoration(
              hintText: "Street Address",
            ),
          ),
          const SizedBox(
            height: TSizes.md,
          ),
          PrimaryButton(
            loading: false.obs,
            title: TTexts.sContinue.tr,
            onPressed: onContinuePressed,
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          TextButton(
            onPressed: onBackPressed,
            child: Text(
              TTexts.backLabel.tr,
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: darkMode ? TColors.darkFontColor : TColors.darkGrey),
            ),
          ),
        ],
      ),
    );
  }
// void _updatePosition(CameraPosition _position) {
//   Position newMarkerPosition = Position(
//       latitude: _position.target.latitude,
//       longitude: _position.target.longitude);
//   Marker marker = AddPropertiesWizardFormController.instance.markers["1"];
//
//   setState(() {
//     markers["1"] = marker.copyWith(
//         positionParam: LatLng(newMarkerPosition.latitude, newMarkerPosition.longitude));
//   });
// }
}
