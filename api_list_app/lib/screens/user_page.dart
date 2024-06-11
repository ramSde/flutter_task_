import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:api_list_app/controllers/user_controller.dart';
import 'package:api_list_app/model/user_model.dart';

class UsersPage extends StatelessWidget {
  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users App'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onTapOutside: (event){
                FocusScope.of(context).unfocus();
              },
              decoration: InputDecoration(
                hintText: 'Search...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onChanged: (value) {
                userController.filterUsers(value);
              },
            ),
          ),
        ),
      ),
      body: Obx(() {
        if (userController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (userController.errorMessage.isNotEmpty) {
          return Center(child: Text(userController.errorMessage.value));
        } else {
          return ListView.builder(
            itemCount: userController.usersList.length,
            itemBuilder: (context, index) {
              User user = userController.usersList[index];
              return ListTile(
                title: Text(user.name),
                subtitle: Text(user.email),
              );
            },
          );
        }
      }),
    );
  }
}
