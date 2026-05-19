import 'package:flutter/material.dart';
// Sesuaikan path import ini dengan nama project kamu
import 'package:uts/page/detail_pertemuan_page.dart';
//import 'package:pertemuan_4/page/profile_page.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  // Variabel pages dan currentPage dihapus karena navigasi utama ada di main.dart

  List<Pertemuan> pertemuan = [
    Pertemuan(title: 'Pertemuan 1', subtitle: 'Pengenalan Android'),
    Pertemuan(title: 'Pertemuan 2', subtitle: 'Widget & Button'),
    Pertemuan(title: 'Pertemuan 3', subtitle: 'Activity & Intent'),
    Pertemuan(title: 'Pertemuan 4', subtitle: 'Toast & AlertDialog'),
    Pertemuan(title: 'Pertemuan 5', subtitle: 'ListView'),
    Pertemuan(title: 'Pertemuan 6', subtitle: 'Checkbox'),
    Pertemuan(title: 'Pertemuan 7', subtitle: 'Radio Button'),
    Pertemuan(title: 'Pertemuan 8', subtitle: 'AutoComplete & Spinner'),
    Pertemuan(title: 'Pertemuan 9', subtitle: 'Date & Time Picker'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LIST PERTEMUAN "),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        itemCount: pertemuan.length,
        itemBuilder: (context, index) {
          final data = pertemuan[index];
          return Card(
            child: ListTile(
              leading: Icon(Icons.list),
              title: Text(data.title),
              subtitle: Text(data.subtitle),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PertemuanPage(pertemuan: data),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class Pertemuan {
  final String title;
  final String subtitle;

  Pertemuan({required this.title, required this.subtitle});
}
