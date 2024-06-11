// ignore_for_file: prefer_const_constructors

import 'package:api_list_app/controllers/bottom_navbar_controller.dart';
import 'package:api_list_app/screens/counter_page.dart';
import 'package:api_list_app/screens/user_page.dart';
import 'package:api_list_app/screens/item_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Users App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  final NavigationController navigationController = Get.put(NavigationController());

  final List<Widget> pages = [
     UsersPage(),
    HomePage(),
   
    CounterPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return pages[navigationController.currentIndex.value];
      }),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          currentIndex: navigationController.currentIndex.value,
          onTap: navigationController.changePage,
          // ignore: prefer_const_literals_to_create_immutables
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'Users',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.table_view),
              label: 'Items',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Counter',
            ),
          ],
        );
      }),
    );
  }
}
