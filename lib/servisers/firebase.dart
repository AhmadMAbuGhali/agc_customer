import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/user_model.dart';
import '../resources/constants_manager.dart';

class Firebase{

  final FirebaseFirestore _firebaseFirestore=FirebaseFirestore.instance;


  static AddUser(UserModel user) async {
    await firebaseFirestore
        .collection('waitingUser')

        .add({
      'id': user.id,
      'name': user.name,
      'email': user.email,
      'password': user.password,
      'phoneNumber': user.phoneNumber,
      'jobTitle': user.jobTitle,
      'isAccept': false,
      'isReject': false,
      'disable': false,

    });
  }





  // Future<bool> createAccount ({required User user})async{
  //
  //
  //   return await _firebaseFirestore.collection('waitinguser')
  //       .add(user.toMap())
  //       .then((value) => true)
  //       .onError((error, stackTrace) => false);
  //
  //
  //
  // }





  }