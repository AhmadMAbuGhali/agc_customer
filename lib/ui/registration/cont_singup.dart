import 'dart:collection';

import 'package:agc_customer/ui/registration/wait_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../componant/componant.dart';
import '../../resources/assets_manager.dart';
import '../../servisers/auth_provider.dart';
import 'login.dart';

class CountSingUP extends StatelessWidget {
  var dateFromSingup = Get.arguments;

  TextEditingController bakeryNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  // Initial Selected Value

  // List of items in our dropdown menu
  final GlobalKey<FormState> _signUpFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<AuthProvider>(builder: (context, provider, x) {
        return Form(
          key: _signUpFormKey,
          child: SafeArea(
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
                        child: Container(
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(ImageAssets.reg),
                          )),
                        ),
                      ),
                      Positioned(
                          top: 21,
                          right: 350,
                          left: 0,
                          child: IconButton(
                              onPressed: () => Get.back(),
                              icon: Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ))),
                      const Positioned(
                        top: 21,
                        right: 110,
                        left: 0,
                        child: Text(
                          'تسجيل حساب جديد ',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Positioned(
                        top: 71,
                        right: 150,
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
                        right: 50,
                        left: 0,
                        child: Text(
                          'أنشيء حسابك للتمتع بكافة الميزات ',
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
                    hintText: 'اسم المخبز ',
                    inputType: TextInputType.text,
                    controller: bakeryNameController,
                  ),
                ),
                Container(
                  width: 295.w,
                  height: 35.h,
                  margin: EdgeInsets.only(top: 23.h, left: 40.w, right: 40.w),
                  child: WidgetTextField(
                    hintText: 'العنوان',
                    inputType: TextInputType.emailAddress,
                    controller: addressController,
                  ),
                ),
                Container(
                  width: 295.w,
                  height: 35.h,
                  margin: EdgeInsets.only(top: 23.h, left: 40.w, right: 40.w),
                  child: WidgetTextField(
                    hintText: 'رقم الجوال',
                    inputType: TextInputType.number,
                    controller: phoneController,
                  ),
                ),
                SizedBox(
                  height: 75.h,
                ),
                Center(
                    child: SizedBox(
                  width: 250.w,
                  height: 45.h,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_signUpFormKey.currentState!.validate()) {
                        _signUpFormKey.currentState!.save();
                        provider.register(
                            context,
                            dateFromSingup[0],
                            dateFromSingup[1],
                            dateFromSingup[2],
                            bakeryNameController.text.trim(),
                            phoneController.text.trim(),
                            addressController.text.trim());
                      }
                      ()=> Get.off(WaitPage());
                    },
                    child: Text('تسجيل'),
                  ),
                )),
                SizedBox(
                  height: 5.h,
                ),
              ],
            ),
          )),
        );
      }),
    );
  }
}
