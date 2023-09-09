import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> GetData() async {
    CollectionReference mahasiswa = firestore.collection('Mahasiswa');

    return mahasiswa.get();
  }

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference mahasiswa = firestore.collection('Mahasiswa');
    return mahasiswa.snapshots();
  }

  void deleteProduct(String id) {
    DocumentReference docRef = firestore.collection("Mahasiswa").doc(id);

    try {
      Get.defaultDialog(
        title: "info",
        middleText: "Apakah anda ingin mmenghapus data ini?",
        onConfirm: () {
          docRef.delete();
          Get.back();
        },
        textConfirm: "Yess",
        textCancel: "Cancel",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi kesalahan",
        middleText: "Tidak berhasil menghapus data",
      );
    }
  }

}