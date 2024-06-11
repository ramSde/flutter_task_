import 'package:api_list_app/controllers/list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class HomePage extends StatelessWidget {
  final ListController controller = Get.put(ListController());

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
              onTapOutside: (event){
                FocusScope.of(context).unfocus();
              },
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