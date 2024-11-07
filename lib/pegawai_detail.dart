// pasien_detail.dart

import 'package:flutter/material.dart';
import '../model/pegawai.dart';
import '../ui/ubah_pegawai_page.dart';

class PegawaiDetail extends StatefulWidget {
  final Pegawai pegawai;

  const PegawaiDetail({super.key, required this.pegawai});

  @override
  State<PegawaiDetail> createState() => _PegawaiDetailState();
}

class _PegawaiDetailState extends State<PegawaiDetail> {  // Changed to State<PasienDetail>
  late Pegawai pegawai;

  @override
  void initState() {
    super.initState();
    pegawai = widget.pegawai;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Pegawai"),
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
            Text("Nip: ${pegawai.nip}", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text("Nama: ${pegawai.nama}", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text("Tanggal Lahir: ${pegawai.tanggalLahir}", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text("Nomor Telepon: ${pegawai.nomorTelepon}", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text("Email: ${pegawai.email}", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text("Password: ${pegawai.password}", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    final updatedPegawai = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UbahPegawaiPage(pegawai: pegawai)
                      ),
                    );
                    if (updatedPegawai != null) {
                      setState(() {
                        pegawai = updatedPegawai; // Update pasien with new data
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
                    print("Hapus pegawai: ${pegawai.nama}");
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