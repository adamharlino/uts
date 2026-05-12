import 'package:flutter/material.dart';

class ColumnRowPage extends StatelessWidget {
  const ColumnRowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pertemuan 2")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            Text("Column", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 10),

            Column(
              children: [
                Text("Item 1"),
                Text("Item 2"),
                Text("Item 3"),
              ],
            ),

            SizedBox(height: 30),

            Text("Row", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Item 1"),
                SizedBox(width: 10),
                Text("Item 2"),
                SizedBox(width: 10),
                Text("Item 3"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}