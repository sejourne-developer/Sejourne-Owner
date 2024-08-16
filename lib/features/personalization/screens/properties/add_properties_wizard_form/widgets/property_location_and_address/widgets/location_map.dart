import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../../../../data/services/exporter.dart';
import '../../../../../../../app/controllers/product_details/product_details_controller.dart';

class LocationMap extends StatefulWidget {
  const LocationMap(
      {super.key,
      required this.initialLatitude,
      required this.initialLongitude});

  final double initialLatitude, initialLongitude;

  @override
  State<LocationMap> createState() => _LocationMapState();
}

class _LocationMapState extends State<LocationMap> {
  bool _isLoading = false;
  late GoogleMapController? _controller;
  var mapType = MapType.normal;
  late Marker locationMarker = const Marker(markerId: MarkerId("My Location"));
  late String lat = "";
  late String long = "";

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      margin: const EdgeInsetsDirectional.symmetric(
          vertical: TSizes.spaceBtwSections * 3, horizontal: TSizes.md),
      child: ClipRRect(
        borderRadius:
            const BorderRadiusDirectional.all(Radius.circular(TSizes.md)),
        child: Stack(
          children: [
            GoogleMap(
              zoomGesturesEnabled: true,
              zoomControlsEnabled: false,
              myLocationButtonEnabled: true,
              style: THelperFunctions.isDarkMode(context)
                  ? ProductDetailsController.instance.darkMapStyle
                  : null,
              initialCameraPosition: CameraPosition(
                  target: LatLng(widget.initialLatitude, widget.initialLongitude),
                  zoom: 15),
              // myLocationEnabled: true,
              onMapCreated: (GoogleMapController controller) {
                _controller = controller;
              },
              markers: {
                Marker(
                    markerId: const MarkerId("My_Location"),
                    position:
                        LatLng(widget.initialLatitude, widget.initialLongitude),
                    icon: BitmapDescriptor.defaultMarkerWithHue(12),
                    draggable: true,
                    onDragEnd: (value) {
                      if (kDebugMode) {
                        print(value.latitude);

                      print(value.latitude);}
                    })
              },
            ),

            PositionedDirectional(
              top: TSizes.sm,
              end: 1,
              child: SizedBox(
                width: 56,
                child: Column(
                  children: [
                    TCircularIcon(
                      icon: TImage.clearIcon,
                      onPressed: () => Get.back(),
                    ),
                    const SizedBox(
                      height: TSizes.sm,
                    ),
                    TCircularIcon(
                      icon: TImage.myLocationIcon,
                      isAnimated: _isLoading,
                      animatedIcon: TImage.loadingAnimation,
                      height: TSizes.iconLg,
                      width: TSizes.iconLg,
                      padding: TSizes.sm,
                      onPressed: () async {
                        setState(() {
                          _isLoading = true;
                        });
                        await THelperFunctions.determinePosition()
                            .then((onValue)async {
                          lat = '${onValue.latitude}';
                          long = '${onValue.longitude}';
                          CameraPosition camera = CameraPosition(
                              target:
                              LatLng(double.parse(lat), double.parse(long)),
                              zoom: 15);
                          locationMarker = Marker(
                            markerId: const MarkerId("My_Location"),
                            position:
                            LatLng(double.parse(lat), double.parse(long)),
                          );

                          _controller?.animateCamera(
                            CameraUpdate.newCameraPosition(camera),
                          );

                          setState(() {
                            _isLoading = false;
                          });
                          debugPrint("$lat,$long");
                        });
                      },
                    ),
                    const SizedBox(
                      height: TSizes.sm,
                    ),
                    TCircularIcon(
                      icon: TImage.mapMapIcon,
                      removeColor: true,
                      onPressed: () {
                        setState(() {
                          if (mapType == MapType.normal) {
                            mapType = MapType.satellite;
                          } else {
                            mapType = MapType.normal;
                          }
                        });
                      },
                      //color: ,
                    ),
                    const SizedBox(
                      height: TSizes.sm,
                    ),
                    TCircularIcon(
                      icon: TImage.zoomInIcon,
                      onPressed: () async {
                        _controller?.animateCamera(
                          CameraUpdate.zoomIn(),
                        );
                      },
                    ),
                    const SizedBox(
                      height: TSizes.sm,
                    ),
                    TCircularIcon(
                      onPressed: () async {
                        _controller?.animateCamera(
                          CameraUpdate.zoomOut(),
                        );
                      },
                      icon: TImage.zoomOutIcon,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
