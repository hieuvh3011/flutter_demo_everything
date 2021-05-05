import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:show_off/model/user.dart';

class FireStoreIntegration {
  String collectionUserPath = 'user';

  Future<void> uploadUserInfo(User user) async {
    await FirebaseFirestore.instance
        .collection(collectionUserPath)
        .add(user.toJson());
  }

  getUserByEmail(String email) async {
    return await FirebaseFirestore.instance
        .collection(collectionUserPath)
        .where("email", isEqualTo: email)
        .get();
  }
}
