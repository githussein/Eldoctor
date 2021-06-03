import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('Users');

  Future<void> updateUserData(String name, String email, String phone) async {
    return await userCollection.doc(uid).set({
      'name': name,
      'email': email,
      'phone': phone,
    });
  }
}
