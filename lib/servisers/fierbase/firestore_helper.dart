import 'dart:developer';

import 'package:agc_customer/model/order.dart';
import 'package:agc_customer/model/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/customer_model.dart';

class FirestoreHelper{
  FirestoreHelper._();
  static FirestoreHelper firestoreHelper = FirestoreHelper._();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  waitingCustomer(CustomerModel customer) async {
    await firebaseFirestore.collection('customersWaiting').doc(customer.id).set(customer.toMap());
  }
  acceptedCustomer(CustomerModel customer) async {
    await firebaseFirestore.collection('customers').doc(customer.id).set(customer.toMap());
  }
  rejectedCustomer(CustomerModel customer) async {
    await firebaseFirestore.collection('customersRejected').doc(customer.id).set(customer.toMap());
  }
  deletefromCustomerAwaiting(String userID)async{
    await firebaseFirestore.collection('customersWaiting').doc(userID).delete();
  }
  Future<CustomerModel> getUserFromWaiting(String userid) async {
    DocumentSnapshot<Map<String, dynamic>> document =
    await firebaseFirestore.collection('customersWaiting').doc(userid).get();

    Map<String, dynamic>? customerData = document.data();
    customerData?['id'] = document.id;

    if(customerData !=null) {
      CustomerModel gdCustomer = CustomerModel.fromMap(customerData);
      return gdCustomer;
    }
    return getCustomerFromAccepted(userid);
  }
  Future<CustomerModel> getCustomerFromAccepted(String userid) async {
    DocumentSnapshot<Map<String, dynamic>> document =
    await firebaseFirestore.collection('Customer').doc(userid).get();
    Map<String, dynamic>? customersData = document.data();
    customersData?['id'] = document.id;
    if(customersData !=null) {
      CustomerModel gdCustomer = CustomerModel.fromMap(customersData);
      return gdCustomer;
    }
    return getCustomerFromReject(userid);
  }
  Future<CustomerModel> getCustomerFromReject(String userid) async {
    DocumentSnapshot<Map<String, dynamic>>? document =
    await firebaseFirestore.collection('CustomersRejected').doc(userid).get();
    Map<String, dynamic>? customersData = document.data();
    customersData?['id'] = document.id;
    CustomerModel gdCustomer = CustomerModel?.fromMap(customersData!);
    return gdCustomer;
  }
  Future<List<CustomerModel>> getAllCustomersWaiting() async {
    QuerySnapshot<Map<String, dynamic>> allAssetSnapshot =
    await firebaseFirestore.collection('customersWaiting').get();
    List<CustomerModel> allAsset = allAssetSnapshot.docs.map((e) {
      Map<String, dynamic> documentMap = e.data();
      documentMap['id'] = e.id;
      log('firestore helper e.id: ${e.id}');
      log("firestore helper documentMap['id']: ${documentMap['id']}");
      CustomerModel customerModel = CustomerModel.fromMap(documentMap);
      return customerModel;
    }).toList();
    return allAsset;
  }
  Future<List<CustomerModel>> getAllCustomers() async {
    QuerySnapshot<Map<String, dynamic>> allAssetSnapshot =
    await firebaseFirestore.collection('customers').get();
    List<CustomerModel> allAsset = allAssetSnapshot.docs.map((e) {
      Map<String, dynamic> documentMap = e.data();
      documentMap['id'] = e.id;
      log('firestore helper e.id: ${e.id}');
      log("firestore helper documentMap['id']: ${documentMap['id']}");
      CustomerModel customerModel = CustomerModel.fromMap(documentMap);
      return customerModel;
    }).toList();
    return allAsset;
  }
  Future<List<ProductModel>> getAllProduct() async {
    QuerySnapshot<Map<String, dynamic>> allAssetSnapshot =
    await firebaseFirestore.collection('Product').get();
    List<ProductModel> allAsset = allAssetSnapshot.docs.map((e) {
      Map<String, dynamic> documentMap = e.data();
      documentMap['id'] = e.id;
      log('firestore helper e.id: ${e.id}');
      log("firestore helper documentMap['id']: ${documentMap['id']}");
      ProductModel productModel = ProductModel.fromMap(documentMap);
      return productModel;
    }).toList();
    return allAsset;
  }
  addOrder(Order order) async{
    String id = firebaseFirestore.collection('SalesPersonOrderWaiting').doc().id;
    order.id=id;
    await firebaseFirestore.collection('SalesPersonOrderWaiting').doc(id).set(order.toMap());
  }

  getOrder() async{
    QuerySnapshot<Map<String, dynamic>> allAssetSnapshot =
    await firebaseFirestore.collection('SalesPersonOrderWaiting').get();
    List<Order> allAsset = allAssetSnapshot.docs.map((e) {
      Map<String, dynamic> documentMap = e.data();
      documentMap['id'] = e.id;
      Order productModel = Order.fromMap(documentMap);
      return productModel;
    }).toList();
    return allAsset;
  }
}