import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ListController extends GetxController {
  var items = <String>[
    'Apple',
    'Banana',
    'Orange',
    'Mango',
    'Grapes',
    'Pineapple',
    'Strawberry',
    'Watermelon',
    'Peach',
    'Cherry'
  ].obs;

  var filteredItems = <String>[].obs;
  

  @override
  void onInit() {
    super.onInit();
    filteredItems.assignAll(items);
  }

  void filterItems(String query) {
    if (query.isEmpty) {
      filteredItems.assignAll(items);
    } else {
      filteredItems.assignAll(
        items.where((item) => item.toLowerCase().contains(query.toLowerCase())),
      );
    }
  }
}