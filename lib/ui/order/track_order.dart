import 'package:agc_customer/servisers/firebase_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/styles_manager.dart';
import '../../servisers/auth_provider.dart';
import '../registration/login.dart';

class TrackOrder extends StatelessWidget {
  const TrackOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   SafeArea(
      child: Scaffold(
        body: Consumer<FireBaseProvider>(
          builder: (context,provider,x){
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text('تتبع الطلبية ',style: getBoldStyle(color: ColorManager.primary),),
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
                SizedBox(height: 50.h,),
                Expanded(
                    child: ListView.builder(itemBuilder: (context,index){
                  return   Container(
                    margin: EdgeInsets.symmetric(vertical: 10.h),
                    height: 80.h,
                    width: 350.w,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 0,
                        blurRadius: 2,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ], borderRadius: BorderRadius.circular(15.r)),
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              IconAssets.tracking,
                              height: 25.h,
                              width: 25.w,
                              color: ColorManager.primary,
                            ),
                            SizedBox(width: 15.w,),
                            Text( provider.allCustomerOrder[index].status=='shipped'?'تم شحن طلبيتك  يرجى انظار التسليم':
                            provider.allCustomerOrder[index].status=='watingshipped'?'طلبيتك قيد التعبئة ....':
                            provider.allCustomerOrder[index].status=='accept'?'تم الموافقة على طلبيتك':
                            provider.allCustomerOrder[index].status=='waiting'?'يرجى الانتظار ريثما يتم الموافقة على الطلب':
                            'عذرا يرجى التحققق من الشركة  لمعرفة تفاصيل الطلبية')
                          ],
                        ),


                      ],
                    ),
                  );
                },itemCount: provider.allCustomerOrder.length,)),



              ],
            ),
          );}
        ),
      ),
    );;
  }
}
