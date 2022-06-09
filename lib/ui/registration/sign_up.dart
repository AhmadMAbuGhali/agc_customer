
import 'dart:collection';


import 'package:agc_customer/ui/registration/cont_singup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../componant/componant.dart';
import '../../resources/assets_manager.dart';
import 'login.dart';


class SingUP extends StatelessWidget {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  // Initial Selected Value




  // List of items in our dropdown menu


  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight =  MediaQuery.of(context).size.height;
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 334.h,
              width: 416.w,
              child: Stack(
                children: [
                  Positioned(
                    top: -19,
                    right: 0,
                    left: 0,
                    height: 353.h,
                    child:  Container(
                      decoration: const  BoxDecoration(
                          image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(ImageAssets.reg),
                      )),
                    ),
                  ),
                  const Positioned(
                    top: 21,
                    right: 120,
                    left: 0,
                    child:  Text(
                      'تسجيل حساب جديد ',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Positioned(
                    top: 71,
                    right: 165,
                    left: 0,
                    child: Text(
                      'مرحباً ',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Positioned(
                    top: 131,
                    right: 120,
                    left: 0,
                    child: Text(
                      'أنشيء حسابك للتمتع بكافة الميزات',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 295.w,
              height: 35.h,
              margin: EdgeInsets.only(top: 40.h, left: 40.w, right: 40.w),
              child: WidgetTextField(
                hintText: 'الأسم ',
                inputType: TextInputType.text,
                controller: nameController,

              ),
            ),
            Container(
              width: 295.w,
              height: 35.h,
              margin: EdgeInsets.only(top: 23.h, left: 40.w, right: 40.w),
              child: WidgetTextField(
                hintText: 'البريد الالكتروني ',
                inputType: TextInputType.emailAddress,
                controller: emailController,

              ),
            ),
            Container(
              width: 295.w,
              height: 35.h,
              margin: EdgeInsets.only(top: 23.h, left: 40.w, right: 40.w),
              child: WidgetTextField(
                hintText: 'كلمة المرور',
                inputType: TextInputType.visiblePassword,
                controller: passController,
                isPassword: true,
              ),
            ),

            SizedBox(
              height: 85.h,
            ),
            Center(

                child: SizedBox(
                  width: 250.w,
                  height: 45.h,
                  child: ElevatedButton(onPressed:()=> Get.to(() => CountSingUP(), arguments: [
                   nameController.text.trim(),emailController.text.trim(),passController.text.trim()
                  ]),
                    child:Text('التالي '),),
                )
            ),
            SizedBox(
              height: 5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'لديك حساب مسبقا؟  ',
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
                TextButton(
                    onPressed: () {
                     Get.off(Login());
                    },
                    child: const Text(
                      ' تسجيل الدخول ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ))
              ],
            )
          ],
        ),
      )),
    );
  }
}
