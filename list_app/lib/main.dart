import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Item Search App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final SearchController controller = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item Search App'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                controller.filterItems(value);
              },
            ),
          ),
          Expanded(
            child: Obx(() {
              if (controller.filteredItems.isEmpty) {
                return Center(child: Text('No items found'));
              }
              return ListView.builder(
                itemCount: controller.filteredItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(controller.filteredItems[index]),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}



class SearchController extends GetxController {
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