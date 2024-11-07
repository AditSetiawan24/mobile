import 'package:flutter/material.dart';
import '/ui/pegawai_page.dart';  // Import PegawaiPage
import '/ui/pasien_page.dart';  // Import PasienPage

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Klinik APP',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Data Klinik"),
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
      backgroundColor: Colors.blue,),
      body: ListView(
        children: [
          GestureDetector(
            child: const Card(
              child: ListTile(
                title: Text('Pegawai'),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PegawaiPage()),
              );
            },
          ),
          GestureDetector(
            child: const Card(
              child: ListTile(
                title: Text("Pasien"),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PasienPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
