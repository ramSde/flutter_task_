import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:api_list_app/model/user_model.dart';

class UserController extends GetxController {
  var isLoading = true.obs;
  var usersList = <User>[].obs;
  var originalUsersList = <User>[].obs; // Store the original list
  var errorMessage = ''.obs;

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  void fetchUsers() async {
    try {
      isLoading(true);
      errorMessage('');
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body) as List;
        originalUsersList.value = jsonResponse.map((user) => User.fromJson(user)).toList();
        usersList.value = originalUsersList; 
      } else {
        errorMessage('Failed to load users');
      }
    } catch (e) {
      errorMessage('Error: $e');
    } finally {
      isLoading(false);
    }
  }

  void filterUsers(String query) {
    if (query.isEmpty) {
      usersList.value = originalUsersList;
    } else {
      usersList.value = originalUsersList.where((user) {
        return user.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
  }
}
