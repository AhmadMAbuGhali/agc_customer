



import 'dart:developer';


import 'package:agc_customer/model/customer_model.dart';
import 'package:agc_customer/model/product_model.dart';
import 'package:flutter/material.dart';

import 'fierbase/firestore_helper.dart';

class FireBaseProvider extends ChangeNotifier {
  FireBaseProvider() {
    getAllWaitingCustomer();
    getAllCustomer();
    getAllProduct();
  }

  List<CustomerModel> watingCustomer=[];
  List<CustomerModel> allCustomer=[];
  List<ProductModel> allProduct=[];
  List<ProductModel> cartProduct=[];
  getAllWaitingCustomer()async{
    watingCustomer=await FirestoreHelper.firestoreHelper.getAllCustomersWaiting();
    log(watingCustomer.length.toString());
    notifyListeners();
  }
  getAllCustomer()async{
    allCustomer=await FirestoreHelper.firestoreHelper.getAllCustomers();
    log(allCustomer.length.toString());
    notifyListeners();
  }

  acceptedUser(CustomerModel customerModel)async{
    await FirestoreHelper.firestoreHelper.acceptedCustomer(customerModel);
    getAllWaitingCustomer();
    notifyListeners();
  }
  rejectedUser(CustomerModel customerModel)async{
    await FirestoreHelper.firestoreHelper.rejectedCustomer(customerModel);
    getAllWaitingCustomer();
    notifyListeners();
  }
  deleteFromWating(String userId)async{
    await  FirestoreHelper.firestoreHelper.deletefromCustomerAwaiting(userId);
    notifyListeners();
  }
  getAllProduct() async {
    allProduct= await FirestoreHelper.firestoreHelper.getAllProduct();
    notifyListeners();
  }



}