import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sejourne_owner/data/services/exporter.dart';
import 'package:sejourne_owner/features/personalization/models/multi_selection_model.dart';

class AddPropertiesWizardFormController extends GetxController {
  static AddPropertiesWizardFormController get instance => Get.find();

  late dynamic darkMapStyle = TImage.darkMapStyle.obs;
  final isLoading = false.obs;
  final Rx<MultiSelectionModel> placeFeature = MultiSelectionModel().obs;
  final Rx<MultiSelectionModel> placeSafetyItems = MultiSelectionModel().obs;
  final Rx<MultiSelectionModel> placeDescriptionItems =
      MultiSelectionModel().obs;
  Rx<int> guestsCounter = 0.obs;
  Rx<int> bedroomsCounter = 0.obs;
  Rx<int> bedsCounter = 0.obs;
  Rx<int> bathroomsCounter = 0.obs;
  Rx<int> petsCounter = 0.obs;
  Rx<int> totalCounter = 0.obs;
  Rx<int> selectedPetOption = 0.obs;
  final Rx<String> guestsString = "0".obs;
  final Rx<String> bedroomsString = "0".obs;
  final Rx<String> bedsString = "0".obs;
  final Rx<String> bathroomsString = "0".obs;
  final Rx<String> petsString = "0".obs;
  final Rx<String> totalString = "0".obs;

  void total() {
    totalCounter.value = guestsCounter.value +
        bedroomsCounter.value +
        bedsCounter.value +
        bathroomsCounter.value +
        petsCounter.value;
  }

  final propertyImageList = ([]).obs;

  // RxSet<int> selectedIndexes = RxSet<int>({});
  // final itemCount=0.obs;
  // Rx<int> currentSelectedIndex=0.obs;
  //
  // void addItem(int item) {
  //   selectedIndexes.add(item);
  //   itemCount.value=selectedIndexes.length;
  // }
  // void removeItem(int index) {
  //   selectedIndexes.remove(index);
  //   itemCount.value=selectedIndexes.length;
  // }

  RxSet<Marker> markers = RxSet<Marker>({});
  late Rx<Marker> locationMarker = Marker(
      markerId: const MarkerId("My Location"),
      draggable: true,
      onDragEnd: ((newPosition) {
        // myLocation.value = newPosition;
        // print(newPosition.latitude);
        // print(newPosition.longitude);
      })).obs;

  late Rx<LatLng> myLocation = const LatLng(25.276987, 55.296249).obs;
  late GoogleMapController? googleMapController;
  TextEditingController houseController = TextEditingController();
  TextEditingController landmarkController = TextEditingController();
  TextEditingController streetAddressController = TextEditingController();
  TextEditingController propertyTitleController = TextEditingController();
  TextEditingController propertyDescriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  final pageController = PageController(keepPage: false);
  Rx<int> currentPageIndex = 0.obs;
  final Rx<int> selectOption = 0.obs;
  final Rx<int> selectCategoryOption = 0.obs;
  final Rx<String> checkInDateString =
      DateTime.now().toString().split(" ")[0].obs;
  final Rx<String> checkOutDateString =
      DateTime.now().add(const Duration(days: 4)).toString().split(" ")[0].obs;
  var checkInDate = DateTime.now().add(const Duration(days: 1)).obs;
  var checkOutDate = DateTime.now().add(const Duration(days: 4)).obs;
  Rx<int> selectedReasonOption = 0.obs;

  /// Update Current Index when Page Scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

  /// Update Current Index & Jump to the next page
  void nextPage() {
    if (kDebugMode) {
      print(currentPageIndex.value);
    }
    if (currentPageIndex.value == 5) {

    } else {
      int page = currentPageIndex.value + 1;
      pageController.animateToPage(page,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOutSine);
    }
  }

  void back() {
    int page = currentPageIndex.value - 1;
    pageController.animateToPage(page,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOutSine);
  }

  @override
  void onInit() async {
    super.onInit();
    File? image;
    propertyImageList.add(image);
    await _loadMapStyles();
  }


  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  Future _loadMapStyles() async {
    darkMapStyle = await rootBundle.loadString(TImage.darkMapStyle);
  }
}
