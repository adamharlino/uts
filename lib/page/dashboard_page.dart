import 'package:flutter/material.dart';
import 'package:uts/pertemuan/pertemuan1.dart';
import 'package:uts/pertemuan/pertemuan2.dart';
import 'package:uts/pertemuan/pertemuan_3/product_form.dart';
import 'package:uts/pertemuan/pertemuan4.dart';
import 'package:uts/pertemuan/pertemuan5.dart';
import 'package:uts/pertemuan/pertemuan6.dart';
import 'package:uts/pertemuan/pertemuan7.dart';
import 'package:uts/pertemuan/pertemuan8.dart';
import 'package:uts/pertemuan/pertemuan9.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  static final List<Map<String, dynamic>> menuItems = [
    {
      "title": "Pertemuan 1",
      "icon": Icons.auto_stories,
      "color": const Color.fromARGB(255, 4, 176, 255),
      "page": HelloPage(),
    },
    {
      "title": "Pertemuan 2",
      "icon": Icons.view_column,
      "color": const Color.fromARGB(255, 102, 255, 0),
      "page": ColumnRowPage(),
    },
    {
      "title": "Pertemuan 3",
      "icon": Icons.auto_stories,
      "color": const Color.fromARGB(255, 255, 123, 0),
      "page": ProdukForm(),
    },
    {
      "title": "Pertemuan 4",
      "icon": Icons.auto_stories,
      "color": Colors.blue,
      "page": BerandaPage(),
    },
    {
      "title": "Pertemuan 5",
      "icon": Icons.shopping_cart,
      "color": Colors.orange,
      "page": ListviewPage(),
    },
    {
      "title": "Pertemuan 6",
      "icon": Icons.check_box,
      "color": Colors.purple,
      "page": CheckboxPage(),
    },
    {
      "title": "Pertemuan 7",
      "icon": Icons.radio_button_checked,
      "color": Colors.red,
      "page": RadiobuttonPage(),
    },
    {
      "title": "Pertemuan 8",
      "icon": Icons.radio_button_checked,
      "color": const Color.fromARGB(255, 0, 74, 158),
      "page": AutocompletespinPage(),
    },
    {
      "title": "Pertemuan 9",
      "icon": Icons.calendar_month_outlined,
      "color": const Color.fromARGB(255, 0, 74, 158),
      "page": DateTimePickerForm(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      // 🔥 APPBAR
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueAccent,
        title: const Text("DASHBOARD"),
        centerTitle: true,
      ),

      body: Column(
        children: [

          // 🔥 HEADER
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "HALO 👋",
                  style: TextStyle(color: Colors.white70),
                ),
                SizedBox(height: 5),
                Text(
                  "SELAMAT DATANG",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // 🔥 GRID MENU
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.builder(
                itemCount: menuItems.length,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  final item = menuItems[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => item['page'],
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: [
                            item['color'].withOpacity(0.8),
                            item['color'],
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: item['color'].withOpacity(0.3),
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          )
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            item['icon'],
                            size: 40,
                            color: Colors.white,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            item['title'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}