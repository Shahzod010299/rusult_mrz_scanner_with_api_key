import 'package:flutter/material.dart';
import 'package:flutter_ocr_sdk/mrz_result.dart';

class ResultPage extends StatelessWidget {
   ResultPage(
      {super.key, required this.information, this.isViewOnly = false});

  // final List<MrzLine> area;
  final MrzResult information;
  final bool isViewOnly;

  @override
  Widget build(BuildContext context) {

    TextEditingController typeController = TextEditingController();
    TextEditingController nationalityController = TextEditingController();
    TextEditingController surnameController = TextEditingController();
    TextEditingController givenNameController = TextEditingController();
    TextEditingController passportNumberController = TextEditingController();
    TextEditingController birthDateController = TextEditingController();
    TextEditingController genderController = TextEditingController();
    TextEditingController expirationController = TextEditingController();

    typeController.text = information.type!;
    nationalityController.text = information.nationality!;
    surnameController.text = information.surname!;
    givenNameController.text = information.givenName!;
    passportNumberController.text = information.passportNumber!;
    birthDateController.text = information.birthDate!;
    genderController.text = information.gender!;
    expirationController.text = information.expiration!;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Natija')),
      body: SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  cursorColor: Colors.black,
                  readOnly: true,
                  controller: typeController,
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Hujjat turi:',
                    labelStyle: TextStyle(color: Colors.blue),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                const Divider(
                  color: Colors.blue,
                  indent: 2,
                ),
                TextField(
                  cursorColor: Colors.black,
                  controller: nationalityController,
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Millati:',
                    labelStyle: TextStyle(color: Colors.blue),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                const Divider(
                  color: Colors.blue,
                  indent: 2,
                ),
                TextField(
                  cursorColor: Colors.black,
                  controller: givenNameController,
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Ism:',
                    labelStyle: TextStyle(color: Colors.blue),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                const Divider(
                  color: Colors.blue,
                  indent: 2,
                ),
                TextField(
                  cursorColor: Colors.black,
                  controller: surnameController,
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Familiya:',
                    labelStyle: TextStyle(color: Colors.blue),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                const Divider(
                  color: Colors.blue,
                  indent: 2,
                ),
                TextField(
                  cursorColor: Colors.black,
                  controller: passportNumberController,
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Pasport raqami:',
                    labelStyle: TextStyle(color: Colors.blue),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                const Divider(
                  color: Colors.blue,
                  indent: 2,
                ),
                TextField(
                  cursorColor: Colors.black,
                  controller: birthDateController,
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Tug\'ilgan kun:',
                    labelStyle: TextStyle(color: Colors.blue),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                const Divider(
                  color: Colors.blue,
                  indent: 2,
                ),
                TextField(
                  cursorColor: Colors.black,
                  controller: genderController,
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Jins:',
                    labelStyle: TextStyle(color: Colors.blue),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                const Divider(
                  color: Colors.blue,
                  indent: 2,
                ),
                TextField(
                  cursorColor: Colors.black,
                  controller: expirationController,
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Amal qilish muddati:',
                    labelStyle: TextStyle(color: Colors.blue),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                const Divider(
                  color: Colors.blue,
                  indent: 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
