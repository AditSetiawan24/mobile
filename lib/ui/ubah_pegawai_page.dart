import 'package:flutter/material.dart';
import '../model/pegawai.dart';

class UbahPegawaiPage extends StatefulWidget {
  final Pegawai pegawai;

  const UbahPegawaiPage({super.key, required this.pegawai});

  @override
  State<UbahPegawaiPage> createState() => _UbahPegawaiPageState();
}

class _UbahPegawaiPageState extends State<UbahPegawaiPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nipController;
  late TextEditingController _namaController;
  late TextEditingController _tanggalLahirController;
  late TextEditingController _nomorTeleponController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _nipController = TextEditingController(text: widget.pegawai.nip);
    _namaController = TextEditingController(text: widget.pegawai.nama);
    _tanggalLahirController = TextEditingController(text: widget.pegawai.tanggalLahir);
    _nomorTeleponController = TextEditingController(text: widget.pegawai.nomorTelepon);
    _emailController = TextEditingController(text: widget.pegawai.email);
    _passwordController = TextEditingController(text: widget.pegawai.password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ubah Pegawai"),
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
                _buildTextFormField(_nipController, "NIP", "NIP tidak boleh kosong"),
                _buildTextFormField(_namaController, "Nama", "Nama tidak boleh kosong"),
                _buildTextFormField(_tanggalLahirController, "Tanggal Lahir", "Tanggal lahir tidak boleh kosong"),
                _buildTextFormField(_nomorTeleponController, "Nomor Telepon", "Nomor telepon tidak boleh kosong"),
                _buildTextFormField(_emailController, "Email", "Email tidak boleh kosong"),
                _buildTextFormField(_passwordController, "Password", "Password tidak boleh kosong"),
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
          Pegawai updatedPegawai = Pegawai(
            nip: _nipController.text,
            nama: _namaController.text,
            tanggalLahir: _tanggalLahirController.text,
            nomorTelepon: _nomorTeleponController.text,
            email: _emailController.text,
            password: _passwordController.text,
          );
          Navigator.pop(context, updatedPegawai);
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
    _nipController.dispose();
    _namaController.dispose();
    _tanggalLahirController.dispose();
    _nomorTeleponController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}