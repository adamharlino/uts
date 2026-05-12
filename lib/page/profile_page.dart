import 'package:flutter/material.dart';
import '../data/data_profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              // 🔥 HEADER + FOTO
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 220,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage('assets/images/header.jpg'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: -50,
                    child: CircleAvatar(
                      radius: 55,
                      backgroundColor: Colors.white,
                      child: const CircleAvatar(
                        radius: 50,
                        backgroundImage:
                            AssetImage('assets/images/profile.jpg'),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 60),

              // 🔥 NAMA & INFO
              const Text(
                "Adam Harlino",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 5),

              const Text(
                "Sistem Informasi",
                style: TextStyle(fontSize: 16, color: Colors.blueAccent),
              ),

              const SizedBox(height: 5),

              const Text(
                "NIM: 241011700990",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),

              const Text(
                "Kelas: 04SIFP010",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),

              const SizedBox(height: 20),

              // 🔥 CARD SUMMARY
              if (summaryGlobal.isNotEmpty)
                _buildCard(
                  title: "Summary",
                  child: Text(summaryGlobal),
                ),

              // 🔥 CARD PENGALAMAN
              if (pengalamanList.isNotEmpty)
                _buildCard(
                  title: "Pengalaman",
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: pengalamanList
                        .map((e) => Padding(
                              padding: const EdgeInsets.only(bottom: 6),
                              child: Text("• $e"),
                            ))
                        .toList(),
                  ),
                ),

              const SizedBox(height: 10),

              // 🔥 STATS
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 10,
                      color: Colors.black12,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildStat("Project", "67"),
                    buildStat("Followers", "6767"),
                    buildStat("Following", "67"),
                  ],
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  // 🔥 CARD REUSABLE
  Widget _buildCard({required String title, required Widget child}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            blurRadius: 8,
            color: Colors.black12,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          child,
        ],
      ),
    );
  }

  // 🔥 STATS ITEM
  Widget buildStat(String title, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
          ),
        ),
        const SizedBox(height: 5),
        Text(title, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}