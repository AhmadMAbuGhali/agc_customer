
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../model/user_model.dart';
import '../servisers/firebase.dart';

class RegistrationController extends GetxController{


  Rx<List<UserModel>> _userModel = Rx<List<UserModel>>([]);
  List<UserModel> get todos => _userModel.value;

  final FirebaseFirestore _firebaseFirestore=FirebaseFirestore.instance;

  @override
  void onReady() {
    // _userModel.bindStream(Firebase.todoStream());
  }

  // Future<bool> create({required UserModel user}) async {
  //   return await _firebaseFirestore
  //       .collection('waitinguser')
  //       .add(user.toMap())
  //       .then((DocumentReference value) {
  //     print(value.id);
  //     return true;
  //   }).onError((error, stackTrace) => false);}
  }










