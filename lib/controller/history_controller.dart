import 'package:get/get.dart';

import '../main.dart';

class HistoryController extends GetxController {
  var storiesList = <dynamic>[].obs;
  var creativeWritingsList = <dynamic>[].obs;
  var poemsList = <dynamic>[].obs;

  @override
  void onInit() {
    super.onInit();
    print("runnnnnnnn");
    // Load the saved list from local storage on initialization
    storiesList.value = localStorage.read('storiesList') ?? [];
    creativeWritingsList.value = localStorage.read('creativeWritingsList') ?? [];
    poemsList.value = localStorage.read('poemsList') ?? [];
    print("----------------------- $storiesList");
  }

  void addstoriesItem(Map<String, String> newItem) {
    storiesList.add(newItem);
    // Save the updated list to local storage
    localStorage.write('storiesList', storiesList);
  }

  void removestoriesItem(int index) {
    storiesList.removeAt(index);
    // Save the updated list to local storage
    localStorage.write('storiesList', storiesList);
  }

    void addCreativeWritingsItem(Map<String, String> newItem) {
    creativeWritingsList.add(newItem);
    // Save the updated list to local storage
    localStorage.write('creativeWritingsList', storiesList);
  }

  void removeCreativeWritingsItem(int index) {
    creativeWritingsList.removeAt(index);
    // Save the updated list to local storage
    localStorage.write('creativeWritingsList', storiesList);
  }

    void addPoemsItem(Map<String, String> newItem) {
    poemsList.add(newItem);
    // Save the updated list to local storage
    localStorage.write('poemsList', storiesList);
  }

  void removePoemsItem(int index) {
    poemsList.removeAt(index);
    // Save the updated list to local storage
    localStorage.write('poemsList', storiesList);
  }
}
