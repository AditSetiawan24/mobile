import 'package:flutter/material.dart';
import '../model/pasien.dart';
import 'tambah_pasien_page.dart';
import '../pasien_detail.dart';

class PasienPage extends StatefulWidget {
  const PasienPage({super.key});

  @override
  State<PasienPage> createState() => _PasienPageState();
}

class _PasienPageState extends State<PasienPage> {
  List<Pasien> pasienList = [
    Pasien(
      nomorRM: '001',
      nama: 'Kipli',
      tanggalLahir: '03-03-1995',
      nomorTelepon: '081234567892',
      alamat: 'Jl. Pantai Logending No. 5',
    ),
    Pasien(
      nomorRM: '002',
      nama: 'Rina',
      tanggalLahir: '1997-04-04',
      nomorTelepon: '081234567893',
      alamat: 'Jl. Mangga Besar No. 7',
    ),
    Pasien(
      nomorRM: "003",
      nama: "Indah",
      tanggalLahir: "1998-11-20",
      nomorTelepon: "081234567894",
      alamat: "Jl. Bunga Mawar No. 23"
    ),
    Pasien(
      nomorRM: "004",
      nama: "Dewi",
      tanggalLahir: "1999-02-15",
      nomorTelepon: "081234567895",
      alamat: "Jl. Kebon Jeruk No. 5",
    ),
    Pasien(
      nomorRM: "005",
      nama: "Rahmi",
      tanggalLahir: "2000-05-25",
      nomorTelepon: "081234567896",
      alamat: "Jl. Mangga Besar No. 7",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Pasien"),
        backgroundColor: Colors.blue,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TambahPasienPage()),
              ).then((newPasien) {
                if (newPasien != null) {
                  setState(() {
                    pasienList.add(newPasien);
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
        itemCount: pasienList.length,
        itemBuilder: (context, index) {
          final pasien = pasienList[index];
          return GestureDetector(
            child: Card(
              child: ListTile(
                title: Text(pasien.nama),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PasienDetail(pasien: pasien),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
