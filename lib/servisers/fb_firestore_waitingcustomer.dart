import 'package:agc_customer/model/customer_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class FbFirestoreWaitingUser{

  final CollectionReference<Map<String, dynamic>> _collectionReference=FirebaseFirestore.instance.collection('waitingcustomer');

  final FirebaseFirestore _firebaseFirestore=FirebaseFirestore.instance;

  Future<bool> createAccount ({required CustomerModel customerModel})async{


    return await _firebaseFirestore.collection('waitingcustomer')
        .add(customerModel.toMap())
        .then((value) => true)
        .onError((error, stackTrace) => false);



  }
}
