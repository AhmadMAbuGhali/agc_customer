import 'package:agc_customer/resources/constants_manager.dart';
import 'package:agc_customer/servisers/auth_provider.dart';
import 'package:agc_customer/ui/nav_bar/main_navbar.dart';
import 'package:agc_customer/ui/router_class.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class Splash2 extends StatelessWidget {
   Splash2({ Key? key}) : super(key: key);
   User? user;
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 0)).then((v) async{
      await Provider.of<AuthProvider>(context,listen: false).getCustomerFromFirebase();
      user = FirebaseAuth.instance.currentUser;
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
          RouterClass.routerClass.pushWidgetReplacement(MainNavBar());

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
      }

    });
    return Scaffold(
      body: Container(),
    );
  }
}