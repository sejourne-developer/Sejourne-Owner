import 'package:get/get.dart';

class MultiSelectionModel{
  RxSet<int> selectedIndexes = RxSet<int>({});
  final itemCount=0.obs;
  Rx<int> currentSelectedIndex=0.obs;

  void addItem(int item) {
    selectedIndexes.add(item);
    itemCount.value=selectedIndexes.length;
  }
  void removeItem(int index) {
    selectedIndexes.remove(index);
    itemCount.value=selectedIndexes.length;
  }
}