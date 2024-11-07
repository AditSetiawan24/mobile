import 'package:flutter/material.dart';
import '../model/pasien.dart';

class UbahPasienPage extends StatefulWidget {
  final Pasien pasien;

  const UbahPasienPage({super.key, required this.pasien});

  @override
  State<UbahPasienPage> createState() => _UbahPasienPageState();
}

class _UbahPasienPageState extends State<UbahPasienPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nomorRMController;
  late TextEditingController _namaController;
  late TextEditingController _tanggalLahirController;
  late TextEditingController _nomorTeleponController;
  late TextEditingController _alamatController;

  @override
  void initState() {
    super.initState();
    _nomorRMController = TextEditingController(text: widget.pasien.nomorRM);
    _namaController = TextEditingController(text: widget.pasien.nama);
    _tanggalLahirController = TextEditingController(text: widget.pasien.tanggalLahir);
    _nomorTeleponController = TextEditingController(text: widget.pasien.nomorTelepon);
    _alamatController = TextEditingController(text: widget.pasien.alamat);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ubah Pasien"),
        backgroundColor: Colors.blue,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _buildTextFormField(_nomorRMController, "Nomor RM", "Nomor RM tidak boleh kosong"),
                _buildTextFormField(_namaController, "Nama", "Nama tidak boleh kosong"),
                _buildTextFormField(_tanggalLahirController, "Tanggal Lahir", "Tanggal lahir tidak boleh kosong"),
                _buildTextFormField(_nomorTeleponController, "Nomor Telepon", "Nomor telepon tidak boleh kosong"),
                _buildTextFormField(_alamatController, "Alamat", "Alamat tidak boleh kosong"),
                const SizedBox(height: 20),
                _buildSaveButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildTextFormField(TextEditingController controller, String labelText, String validationMessage) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: labelText),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validationMessage;
        }
        return null;
      },
    );
  }

  _buildSaveButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          Pasien updatedPasien = Pasien(
            nomorRM: _nomorRMController.text,
            nama: _namaController.text,
            tanggalLahir: _tanggalLahirController.text,
            nomorTelepon: _nomorTeleponController.text,
            alamat: _alamatController.text,
          );
          Navigator.pop(context, updatedPasien);
        }
      },
      child: const Text(
        "Simpan",
        style: TextStyle(color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
    );
  }

  @override
  void dispose() {
    _nomorRMController.dispose();
    _namaController.dispose();
    _tanggalLahirController.dispose();
    _nomorTeleponController.dispose();
    _alamatController.dispose();
    super.dispose();
  }
}