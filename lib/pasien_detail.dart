// pasien_detail.dart

import 'package:flutter/material.dart';
import '../model/pasien.dart';
import '../ui/ubah_pasien_page.dart';

class PasienDetail extends StatefulWidget {
  final Pasien pasien;

  const PasienDetail({super.key, required this.pasien});

  @override
  State<PasienDetail> createState() => _PasienDetailState();
}

class _PasienDetailState extends State<PasienDetail> {  // Changed to State<PasienDetail>
  late Pasien pasien;

  @override
  void initState() {
    super.initState();
    pasien = widget.pasien;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Pasien"),
        backgroundColor: Colors.blue,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Nomor RM: ${pasien.nomorRM}", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text("Nama: ${pasien.nama}", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text("Tanggal Lahir: ${pasien.tanggalLahir}", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text("Nomor Telepon: ${pasien.nomorTelepon}", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text("Alamat: ${pasien.alamat}", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    final updatedPasien = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UbahPasienPage(pasien: pasien)
                      ),
                    );
                    if (updatedPasien != null) {
                      setState(() {
                        pasien = updatedPasien; // Update pasien with new data
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text('Ubah', style: TextStyle(color: Colors.white)),
                ),
                ElevatedButton(
                  onPressed: () {
                    print("Hapus pasien: ${pasien.nama}");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: const Text('Hapus', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}