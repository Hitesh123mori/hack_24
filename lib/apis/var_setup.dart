import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';


class FirebaseAPIs {

  static final FirebaseAuth auth = FirebaseAuth.instance;

  static final FirebaseFirestore firestore = FirebaseFirestore.instance;

  static User get user => auth.currentUser!;

}