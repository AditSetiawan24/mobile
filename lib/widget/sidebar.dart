import 'package:flutter/material.dart';
import 'package:tugas5/main.dart';
import '../ui/beranda.dart';
import '../ui/pasien_page.dart';
import '../ui/pegawai_page.dart';
import '../ui/login.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('Adit Setiawan'),
            accountEmail: const Text('202301043@student.stikomyos.ac.id'),
            currentAccountPicture: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, size: 35, color: Colors.blue),
            ),
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Beranda'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Beranda()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.local_hospital),
            title: const Text('Poli'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text('Pegawai'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => PegawaiPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.personal_injury),
            title: const Text('Pasien'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => PasienPage()));
            },
          ),
          Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Keluar'),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => Login()
                ),
                (Route<dynamic> route) => false);
            },
          ),
        ],
      ),
    );
  }
}