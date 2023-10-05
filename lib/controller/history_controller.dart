import 'package:get/get.dart';
import '../main.dart';

class HistoryController extends GetxController {
  var storiesList = <dynamic>[].obs;
  var creativeWritingsList = <dynamic>[].obs;
  var poemsList = <dynamic>[].obs;
  List stories = [];
  List creativeWritings = [];
  List poems = [];

  @override
  void onInit() {
    super.onInit();
    print("runnnnnnnn");
    // Load the saved list from local storage on initialization

    storiesList.value = localStorage.read('storiesList') ?? [];
    // Condition to check if the local data is off the same id of the current signed in user for stories
    if (storiesList.isNotEmpty) {
      print("got here");
      for (var e in storiesList) {
        print(e);
        if (e["Id"] == localStorage.read("id")) {
          stories.add(e);
          print("got here $stories");
        } else {
          storiesList.value = [];
        }
      }
      storiesList.value = stories;
      print("got here $storiesList");
    }

    creativeWritingsList.value =
        localStorage.read('creativeWritingsList') ?? [];
    // Condition to check if the local data is off the same id of the current signed in user for creativeWriting
    if (creativeWritingsList.isNotEmpty) {
      print("got here");
      for (var e in creativeWritingsList) {
        print(e);
        if (e["Id"] == localStorage.read("id")) {
          creativeWritings.add(e);
          print("got here $creativeWritings");
        } else {
          creativeWritingsList.value = [];
        }
      }
      creativeWritingsList.value = creativeWritings;
    }

    poemsList.value = localStorage.read('poemsList') ?? [];
    // Condition to check if the local data is off the same id of the current signed in user for poems
    if (poemsList.isNotEmpty) {
      print("got here");
      for (var e in poemsList) {
        print(e);
        if (e["Id"] == localStorage.read("id")) {
          poems.add(e);
          print("got here $poems");
        } else {
          poemsList.value = [];
        }
      }
      poemsList.value = poems;
    }
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
