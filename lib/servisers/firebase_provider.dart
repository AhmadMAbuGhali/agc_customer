



import 'dart:developer';


import 'package:agc_customer/model/customer_model.dart';
import 'package:agc_customer/model/order.dart';
import 'package:agc_customer/model/product_model.dart';
import 'package:agc_customer/resources/constants_manager.dart';
import 'package:flutter/material.dart';

import 'fierbase/firestore_helper.dart';

class FireBaseProvider extends ChangeNotifier {
  FireBaseProvider() {
    getAllWaitingCustomer();
    getAllCustomer();
    getAllProduct();
    getAllCustomerOrder();
  }

  List<CustomerModel> watingCustomer=[];
  List<CustomerModel> allCustomer=[];
  List<ProductModel> allProduct=[];
  List<ProductModel> cartProduct=[];
  List<Order> allCustomerOrder=[];
  List<Order> completedOrder=[];
  deleteFromCart(int index){
    cartProduct.removeAt(index);
    notifyListeners();
  }
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
  addOrder(Order order) async {
    await FirestoreHelper.firestoreHelper.addOrder(order);
    await getAllCustomerOrder();
    notifyListeners();
  }

  getAllCustomerOrder() async {
    allCustomerOrder=[];
    List<Order> orderList=[];
    orderList=await FirestoreHelper.firestoreHelper.getOrderfromWaiting();
    allCustomerOrder.addAll(orderList);
    orderList=await FirestoreHelper.firestoreHelper.getOrderFromAccepted();
    allCustomerOrder.addAll(orderList);
    orderList=await FirestoreHelper.firestoreHelper.getOrderfromStoreKeaper();
    allCustomerOrder.addAll(orderList);
    orderList=await FirestoreHelper.firestoreHelper.getOrderFromDriver();
    allCustomerOrder.addAll(orderList);
    orderList=await FirestoreHelper.firestoreHelper.getOrderFromDriverPinding();
    allCustomerOrder.addAll(orderList);
    orderList=await FirestoreHelper.firestoreHelper.getCompletedOrder();
    allCustomerOrder.addAll(orderList);
    allCustomerOrder.removeWhere((element) => element.customerId !=AppConstants.loggedCustomer!.id);
    completedOrder=allCustomerOrder.where((element) => element.status=='Completed').toList();
    allCustomerOrder.removeWhere((element) => element.status =='Completed');
    notifyListeners();
  }


  //search
  TextEditingController searchController = TextEditingController();
  List<Order> searchOrder=[];
  bool noResulr=false;
  runFilter(List<Order> allOrder) {
    searchOrder = allOrder;
    if (searchController.text.length==0) {
      searchOrder = [];
      noResulr=false;
      notifyListeners();
    } else {
      searchOrder=allOrder
          .where((order) =>
          order.orderNumber!.toLowerCase().contains(searchController.text.toLowerCase().trim()))
          .toList();
      if(searchOrder.isEmpty){
        noResulr=true;
      }else{
        noResulr=false;
      }
    }
    notifyListeners();

  }


}