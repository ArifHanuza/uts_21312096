import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductController extends GetxController {
  late TextEditingController cNama;
  late TextEditingController cNpm;

  //TODO: Implement AddProductController

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void addProduct(String nama, String npm) async{
    CollectionReference mahasiswa = firestore.collection("Mahasiswa");

    try {
      await mahasiswa.add({
        "nama": nama,
        "npm": npm,

      });
      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil menyimpan data product",
        onConfirm: () {
          cNama.clear();
          cNpm.clear();

          Get.back();
          Get.back();

          textConfirm:
          "Ok";
        });
    } catch (e) {
      
    }
  }

  @override
  void onInit() {
    cNama = TextEditingController();
    cNpm = TextEditingController();

    super.onInit();
  }

  @override
  void onClose() {
    cNama.dispose();
    cNpm.dispose();

    super.onClose();
  }
}
