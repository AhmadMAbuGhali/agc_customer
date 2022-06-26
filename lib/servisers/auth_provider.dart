import 'dart:developer';

import 'package:agc_customer/model/customer_model.dart';
import 'package:agc_customer/ui/nav_bar/main_navbar.dart';
import 'package:agc_customer/ui/registration/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../resources/constants_manager.dart';
import 'fierbase/auth_helper.dart';
import 'fierbase/firestore_helper.dart';

class AuthProvider extends ChangeNotifier {
  AuthProvider();

  SnackBar snackBar = const SnackBar(
    content: Text('Enter All Field!'),
    backgroundColor: Colors.red,
    duration: Duration(milliseconds: 2000),
  );

  register(BuildContext context, String name, String email, String password,
      String bakeryName, String phoneNumber, String address) async {
    log('start register');
    CustomerModel customerModel = CustomerModel(
        name: name,
        email: email,
        phoneNumber: phoneNumber,
        password: password,
        address: address,
        bakeryName: bakeryName);
    try {
      UserCredential? x = await AuthHelper.authHelper.createNewAccount(
          customerModel.email.trim(), customerModel.password.trim());
      customerModel.id = x!.user!.uid;
      await FirestoreHelper.firestoreHelper.waitingCustomer(customerModel);
      AppConstants.loggedCustomer = customerModel;
      log('تم التسجيل بنجاح ');
    } on Exception catch (e) {
      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString().split(']').last),
        backgroundColor: Colors.red,
      ));
    }
  }

  login(BuildContext context, String email, String password) async {
    try {
      UserCredential? userCredential =
          await AuthHelper.authHelper.signIn(email, password);
      if (AuthHelper.authHelper.success) {
        String? email = await FirebaseAuth.instance.currentUser!.email;

        await getCustomerFromFirebase();
        if (AppConstants.loggedCustomer != null) {
          if (AppConstants.loggedCustomer!.isAccept == false &&
              AppConstants.loggedCustomer!.isReject == false) {
            return showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: const Text('Waiting for Accept'),
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: Text('Ok'),
                        ),
                      ],
                    ),
                  ],
                );
              },
            );
          }
          else if (AppConstants.loggedCustomer!.isAccept == true) {
            Get.to(MainNavBar());
          } else {
            return showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: const Text('Reject from app'),
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: Text('Ok'),
                        ),
                      ],
                    ),
                  ],
                );
              },
            );
          }
        } else {
          return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('خطأ في البريد أو كلمة المرور'),
            backgroundColor: Colors.red,
          ));
        }
      }
    } on Exception catch (e) {
      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString().split(']').last),
        backgroundColor: Colors.red,
      ));
    }
  }

  getCustomerFromFirebase() async {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    AppConstants.loggedCustomer =
        await FirestoreHelper.firestoreHelper.getUserFromWaiting(userId);
    notifyListeners();
  }

  logOut() async {
    AppConstants.loggedCustomer = null;
    await AuthHelper.authHelper.logout();
    Get.off(Login());
  }

  forgetPassword(String email) async {
    AuthHelper.authHelper.forgetPassword(email);
  }
}
