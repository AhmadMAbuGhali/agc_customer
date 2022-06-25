import 'package:agc_customer/componant/componant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/styles_manager.dart';
import '../../servisers/auth_provider.dart';
import '../registration/login.dart';

class CompleteOrder extends StatelessWidget {
  TextEditingController SearchController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return   SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text('الطلبيات المكتملة ',style: getBoldStyle(color: ColorManager.primary),),
              SizedBox(height: 15.h,),
              Row(
                children: [
                  WidgetSearchField(inputType: TextInputType.text, controller: SearchController, icon: Icon(Icons.search)),
                  Spacer(),
                  GestureDetector(
                    onTap: (){},
                    child: SvgPicture.asset(
                      IconAssets.cart,
                      height: 25.h,
                      width: 25.w,
                      color: ColorManager.primary,
                    ),
                  ),
                  SizedBox(width: 10.w,),
                  GestureDetector(
                    onTap: (){
                      Provider.of<AuthProvider>(context,listen: false).logOut();
                      Get.to(Login());
                    },
                    child: IconButton(
                        onPressed: () {},
                        icon:  Icon(
                          Icons.logout,
                          size: 27,
                          color: ColorManager.primary,
                        )),
                  ),
                ],
              ),
              SizedBox(height: 25.h,),
              CompletedOrder()


            ],
          ),
        ),
      ),
    );;
  }
}
