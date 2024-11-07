import 'package:flutter/material.dart';
import '../model/pegawai.dart';

class TambahPegawaiPage extends StatelessWidget {
  const TambahPegawaiPage({super.key});

  @override
  Widget build(BuildContext context) {
    final nipController = TextEditingController();
    final namaController = TextEditingController();
    final tanggalLahirController = TextEditingController();
    final nomorTeleponController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Pegawai"),
        backgroundColor: Colors.blue,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              _buildTextField(nipController, 'NIP'),
              _buildTextField(namaController, 'Nama'),
              _buildDateField(context, tanggalLahirController),
              _buildTextField(nomorTeleponController, 'Nomor Telepon'),
              _buildTextField(emailController, 'Email'),
              _buildTextField(passwordController, 'Password'),
              const SizedBox(height: 20),
              _buildSubmitButton(context, formKey, nipController, namaController, tanggalLahirController, nomorTeleponController, emailController, passwordController),
            ],
          ),
        ),
      ),
    );
  }

  _buildTextField(TextEditingController controller, String labelText) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: labelText),
    );
  }

  _buildDateField(BuildContext context, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: const InputDecoration(labelText: 'Tanggal Lahir'),
      readOnly: true,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );

        if (pickedDate != null) {
          String formattedDate = "${pickedDate.day.toString().padLeft(2, '0')}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.year}";
          controller.text = formattedDate;
        }
      },
    );
  }

  _buildSubmitButton(
    BuildContext context,
    GlobalKey<FormState> formKey,
    TextEditingController nipController,
    TextEditingController namaController,
    TextEditingController tanggalLahirController,
    TextEditingController nomorTeleponController,
    TextEditingController emailController,
    TextEditingController passwordController,
  ) {
    return ElevatedButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          final newPegawai = Pegawai(
            nip: nipController.text,
            nama: namaController.text,
            tanggalLahir: tanggalLahirController.text,
            nomorTelepon: nomorTeleponController.text,
            email: emailController.text,
            password: passwordController.text,
          );
          Navigator.pop(context, newPegawai);
        }
      },
      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
      child: const Text(
        'Tambah',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}