import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('Users');

  final CollectionReference bookingCollection =
      FirebaseFirestore.instance.collection('Bookings');

  Future<void> updateUserData(
      String name, String email, String phone, String about) async {
    return await userCollection.doc(uid).set({
      'name': name,
      'email': email,
      'phone': phone,
      'about': about,
    });
  }

  Future<void> updateBookingData(
      String service,
      String patientName,
      String address,
      String phone,
      String gender,
      String details,
      DateTime date) async {
    return await bookingCollection.doc(patientName).set({
      'patient': patientName,
      'address': address,
      'phone': phone,
      'service': service,
      'gender': gender,
      'details': details,
      'date': date,
    });
  }
}
