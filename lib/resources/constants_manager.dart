import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';


   const int splashDelay = 2;

  final Future<FirebaseApp> firebaseInitialization = Firebase.initializeApp();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

