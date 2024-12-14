import 'package:flutter/material.dart';
import '../model/pasien.dart';

class TambahPasienPage extends StatelessWidget {
  const TambahPasienPage({super.key});

  @override
  Widget build(BuildContext context) {
    final nomorRMController = TextEditingController();
    final namaController = TextEditingController();
    final tanggalLahirController = TextEditingController();
    final nomorTeleponController = TextEditingController();
    final alamatController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Pasien"),
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
              _buildTextField(controller: nomorRMController, labelText: 'Nomor RM'),
              _buildTextField(controller: namaController, labelText: 'Nama'),
              _buildDateField(context, controller: tanggalLahirController, labelText: 'Tanggal Lahir'),
              _buildTextField(controller: nomorTeleponController, labelText: 'Nomor Telepon'),
              _buildTextField(controller: alamatController, labelText: 'Alamat'),
              const SizedBox(height: 20),
              _buildSubmitButton(context, formKey, nomorRMController, namaController, tanggalLahirController, nomorTeleponController, alamatController),
            ],
          ),
        ),
      ),
    );
  }

  _buildTextField({required TextEditingController controller, required String labelText}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: labelText),
    );
  }

  _buildDateField(BuildContext context, {required TextEditingController controller, required String labelText}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: labelText),
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
    TextEditingController nomorRMController,
    TextEditingController namaController,
    TextEditingController tanggalLahirController,
    TextEditingController nomorTeleponController,
    TextEditingController alamatController,
  ) {
    return ElevatedButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          final newPasien = Pasien(
            nomorRM: nomorRMController.text,
            nama: namaController.text,
            tanggalLahir: tanggalLahirController.text,
            nomorTelepon: nomorTeleponController.text,
            alamat: alamatController.text,
          );
          Navigator.pop(context, newPasien);
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