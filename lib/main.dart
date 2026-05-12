import 'package:flutter/material.dart';
import 'package:uts/page/dashboard_page.dart';
import 'package:uts/page/profile_page.dart';
import 'package:uts/page/list_page.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';


// 🔥 GLOBAL CONTROLLER UNTUK PINDAH PAGE
ValueNotifier<int> pageIndexNotifier = ValueNotifier<int>(0);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    List<Widget> page = [
      const DashboardPage(),
      const ProfilePage(),
      const ListPage(),
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: ValueListenableBuilder(
        valueListenable: pageIndexNotifier,
        builder: (context, value, _) {
          return Scaffold(
            body: page[value],

            bottomNavigationBar: SalomonBottomBar(
              currentIndex: value,
              onTap: (index) {
                pageIndexNotifier.value = index;
              },
              items: [ 
                SalomonBottomBarItem(
                  icon: Icon(Icons.home),
                  title: Text("Home"),
                  selectedColor: Colors.blue,
                ),
                SalomonBottomBarItem(
                  icon: Icon(Icons.person),
                  title: Text("Profile"),
                  selectedColor: Colors.blue,
                ),
                SalomonBottomBarItem(
                  icon: Icon(Icons.list),
                  title: Text("List"),
                  selectedColor: Colors.blue,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}