import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import '../model/customer_model.dart';

class AppConstants {
  static const int splashDelay = 2;
  static CustomerModel? loggedCustomer;
}

