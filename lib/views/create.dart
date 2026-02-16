import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:biodata_flutter/models/api.dart';
import 'package:biodata_flutter/widgets/form.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  CreateState createState() => CreateState();
}

class CreateState extends State<Create> {
  final formkey = GlobalKey<FormState>();

  TextEditingController nisController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  TextEditingController tplahirController = TextEditingController();
  TextEditingController tglahirController = TextEditingController();
  TextEditingController kelaminController = TextEditingController();
  TextEditingController agamaController = TextEditingController();
  TextEditingController alamatController = TextEditingController();

  Future createSw() async {
    return await http.post(
      Uri.parse(BaseUrl.tambah),
      body: {
        'nis': nisController.text,
        'nama': namaController.text,
        'tmplahir': tplahirController.text,
        'tglahir': tglahirController.text,
        'kelamin': kelaminController.text,
        'agama': agamaController.text,
        'alamat': alamatController.text,
      },
    );
  }

  void _onConfirm(context) async {
    try {
      http.Response response = await createSw();
      final data = json.decode(response.body);
      if (data['status']) {
        Fluttertoast.showToast(
          msg: "Data Berhasil Disimpan",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        Navigator.of(
          context,
        ).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
      } else {
        Fluttertoast.showToast(
          msg: "Gagal Menyimpan Data",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Error: $e",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tambah Data Siswa'), centerTitle: true),
      backgroundColor: Colors.blue,
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          onPressed: () {
            if (formkey.currentState!.validate()) {
              _onConfirm(context);
            }
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.green,
            textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          child: Text('Simpan'),
        ),
      ),
      body: Container(
        height: double.infinity,
        padding: EdgeInsets.all(20),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(12),
            child: AppForm(
              formkey: formkey,
              nisController: nisController,
              namaController: namaController,
              tpController: tplahirController,
              tgController: tglahirController,
              kelaminController: kelaminController,
              agamaController: agamaController,
              alamatController: alamatController,
            ),
          ),
        ),
      ),
    );
  }
}
