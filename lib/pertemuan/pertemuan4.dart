import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:simple_alert_dialog/simple_alert_dialog.dart';

import '../data/data_profile.dart';
import '../main.dart'; // 🔥 WAJIB (buat pindah tab)

class BerandaPage extends StatefulWidget {
  const BerandaPage({super.key});

  @override
  State<BerandaPage> createState() => _BerandaPage();
}

class _BerandaPage extends State<BerandaPage> {

  TextEditingController summaryController = TextEditingController();
  TextEditingController pengalamanController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Pertemuan 4"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            SizedBox(height: 20),

            // ================= FORM =================
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  TextField(
                    controller: summaryController,
                    decoration: InputDecoration(
                      labelText: "Summary",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextField(
                    controller: pengalamanController,
                    maxLines: 6,
                    decoration: InputDecoration(
                      labelText: "Pengalaman (pisahkan enter)",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),

            // ================= SUBMIT =================
            InkWell(
              onTap: () {
                SimpleAlertDialog.show(
                  context,
                  assetImagepath: AnimatedImage.confirm,
                  buttonsColor: Colors.green,
                  title: AlertTitleText("Apakah kamu yakin?"),
                  content: AlertContentText(
                    "Apakah kamu ingin menambahkan data",
                  ),
                  onConfirmButtonPressed: (ctx) {

                    setState(() {
                      summaryGlobal = summaryController.text;

                      pengalamanList = pengalamanController.text
                          .split('\n')
                          .where((e) => e.trim().isNotEmpty)
                          .toList();
                    });

                    CherryToast.success(
                      inheritThemeColors: true,
                      title: Text("Berhasil menambahkan data!"),
                      borderRadius: 0,
                    ).show(context);

                    Navigator.pop(context);

                    // 🔥 PINDAH KE PROFILE
                    pageIndexNotifier.value = 1;
                  },
                );
              },
              child: Container(
                padding: EdgeInsets.all(12),
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Submit",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 10),

            // ================= DELETE =================
            InkWell(
              onTap: () {
                SimpleAlertDialog.show(
                  context,
                  assetImagepath: AnimatedImage.warning,
                  buttonsColor: Colors.red,
                  title: AlertTitleText("Apakah kamu yakin?"),
                  content: AlertContentText("Hapus semua data?"),
                  onConfirmButtonPressed: (ctx) {

                    setState(() {
                      summaryGlobal = "";
                      pengalamanList = [];
                    });

                    CherryToast.success(
                      inheritThemeColors: true,
                      title: Text("Data berhasil dihapus!"),
                      borderRadius: 0,
                    ).show(context);

                    Navigator.pop(context);

                    // 🔥 REFRESH PROFILE
                    pageIndexNotifier.value = 1;
                  },
                );
              },
              child: Container(
                padding: EdgeInsets.all(12),
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Delete",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),

            // ================= DIALOG =================
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("Info"),
                    content: Text("Isi form lalu klik submit ya 👌"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Tutup"),
                      ),
                    ],
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.all(12),
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Show Dialog",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}