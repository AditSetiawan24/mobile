import 'package:flutter/material.dart';
import '../model/pegawai.dart';
import 'tambah_pegawai_page.dart';
import '../pegawai_detail.dart';

class PegawaiPage extends StatefulWidget {
  const PegawaiPage({super.key});

  @override
  State<PegawaiPage> createState() => _PegawaiPageState();
}

class _PegawaiPageState extends State<PegawaiPage> {
  List<Pegawai> pegawaiList = [
    Pegawai(
      nip: '123456',
      nama: 'Adit',
      tanggalLahir: '24-11-2004',
      nomorTelepon: '081234567890',
      email: 'adit@gmail.com',
      password: 'password123',
    ),
    Pegawai(
      nip: '789012',
      nama: 'Setiawan',
      tanggalLahir: '1992-02-02',
      nomorTelepon: '081234567891',
      email: 'setiawan@gmail.com',
      password: 'password456',
    ),
    Pegawai(
      nip: '345678',
      nama: 'Caca',
      tanggalLahir: '1991-03-03',
      nomorTelepon: '081234567892',
      email: 'caca@gmail.com',
      password: 'password789',
    ),
    Pegawai(
      nip: '901234',
      nama: 'Dedi',
      tanggalLahir: '1993-04-04',
      nomorTelepon: '081234567893',
      email: 'dedi@gmail.com',
      password: 'password012',
    ),
    Pegawai(
      nip: '567890',
      nama: 'Eva',
      tanggalLahir: '1994-05-05',
      nomorTelepon: '081234567894',
      email: 'eva@gmail.com',
      password: 'password345',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Pegawai"),
        backgroundColor: Colors.blue,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TambahPegawaiPage()),
              ).then((newPegawai) {
                if (newPegawai != null) {
                  setState(() {
                    pegawaiList.add(newPegawai);
                  });
                }
              });
            },
            child: const Text(
              "+",
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: pegawaiList.length,
        itemBuilder: (context, index) {
          final pegawai = pegawaiList[index];
          return GestureDetector(
            child: Card(
              child: ListTile(
                title: Text(pegawai.nama),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PegawaiDetail(pegawai: pegawai),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
