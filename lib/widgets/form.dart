import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class AppForm extends StatefulWidget {
  final GlobalKey<FormState> formkey;
  final TextEditingController nisController,
      namaController,
      tpController,
      tgController,
      kelaminController,
      agamaController,
      alamatController;

  const AppForm({
    super.key,
    required this.formkey,
    required this.nisController,
    required this.namaController,
    required this.tpController,
    required this.tgController,
    required this.kelaminController,
    required this.agamaController,
    required this.alamatController,
  });

  @override
  AppFormState createState() => AppFormState();
}

class AppFormState extends State<AppForm> {
  final _status = ["Laki-laki", "Perempuan"];
  final List<String> items = [
    "Islam",
    "Katholik",
    "Protestan",
    "Hindu",
    "Budha",
    "Khonghucu",
    "Kepercayaan",
  ];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formkey,
      autovalidateMode: AutovalidateMode.always,
      child: SingleChildScrollView(
        child: Column(
          children: [
            txtNis(),
            SizedBox(height: 10),
            txtNama(),
            SizedBox(height: 10),
            txtTempat(),
            SizedBox(height: 10),
            txtTanggal(),
            SizedBox(height: 10),
            tbKelamin(),
            SizedBox(height: 10),
            tbAgama(),
            SizedBox(height: 10),
            tbAlamat(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget txtNis() {
    return TextFormField(
      controller: widget.nisController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "NIS",
        prefixIcon: Icon(Icons.card_membership),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Masukkan NIS Kelahiran Anda.';
        }
        return null;
      },
    );
  }

  Widget txtNama() {
    return TextFormField(
      controller: widget.namaController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "NAMA",
        prefixIcon: Icon(Icons.note),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Masukkan Nama Anda.';
        }
        return null;
      },
    );
  }

  Widget txtTempat() {
    return TextFormField(
      controller: widget.tpController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Tempat Lahir",
        prefixIcon: Icon(Icons.location_city),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Masukkan Kota Kelahiran Anda.';
        }
        return null;
      },
    );
  }

  Widget txtTanggal() {
    return TextFormField(
      readOnly: true,
      controller: widget.tgController,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.calendar_today),
        labelText: 'Tanggal Lahir',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      ),
      onTap: () async {
        await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        ).then((tglahir) {
          if (tglahir != null) {
            widget.tgController.text = DateFormat('yyyy-MM-dd').format(tglahir);
          }
        });
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Masukkan Tanggal Lahir Anda.';
        }
        return null;
      },
    );
  }

  Widget tbKelamin() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: 'Jenis Kelamin',
        prefixIcon: Icon(Icons.wc),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      ),
      initialValue:
          widget.kelaminController.text.isNotEmpty &&
              _status.contains(widget.kelaminController.text)
          ? widget.kelaminController.text
          : null,
      hint: Text('Pilih Jenis Kelamin'),
      onChanged: (String? newValue) {
        setState(() {
          widget.kelaminController.text = newValue!;
        });
      },
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Silakan Pilih Jenis Kelamin Anda.';
        }
        return null;
      },
      items: _status.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(value: value, child: Text(value));
      }).toList(),
    );
  }

  Widget tbAgama() {
    return DropdownButtonFormField2<String>(
      isExpanded: true,
      decoration: InputDecoration(
        labelText: 'Agama',
        prefixIcon: Icon(Icons.mosque),
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      ),
      value:
          widget.agamaController.text.isNotEmpty &&
              items.contains(widget.agamaController.text)
          ? widget.agamaController.text
          : null,
      hint: const Text('Pilih Agama', style: TextStyle(fontSize: 14)),
      items: items
          .map(
            (item) => DropdownMenuItem<String>(
              value: item,
              child: Text(item, style: const TextStyle(fontSize: 14)),
            ),
          )
          .toList(),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Silakan Pilih Agama.';
        }
        return null;
      },
      onChanged: (value) {
        setState(() {
          widget.agamaController.text = value.toString();
        });
      },
      onSaved: (value) {
        if (value != null) {
          widget.agamaController.text = value.toString();
        }
      },
      buttonStyleData: const ButtonStyleData(
        padding: EdgeInsets.only(right: 8),
      ),
      iconStyleData: const IconStyleData(
        icon: Icon(Icons.arrow_drop_down, color: Colors.black45),
        iconSize: 24,
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      ),
      menuItemStyleData: const MenuItemStyleData(
        padding: EdgeInsets.symmetric(horizontal: 16),
      ),
    );
  }

  Widget tbAlamat() {
    return TextFormField(
      controller: widget.alamatController,
      decoration: InputDecoration(
        labelText: 'Alamat',
        prefixIcon: Icon(Icons.location_on),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Silahkan Masukkan Alamat Anda.';
        }
        return null;
      },
    );
  }
}
