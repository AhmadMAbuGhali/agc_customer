// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';
import '../ui/order/new_order_product_details.dart';
import '../ui/order/refund_order_product_details.dart';

Widget WidgetTextField({
  required String hintText,
  required TextInputType inputType,
  required TextEditingController controller,
  Icon? icon,
  Icon? endIcon,
  bool isPassword = false,
}) =>
    TextFormField(
      style: TextStyle(color: Colors.black),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      obscureText: isPassword,
      keyboardType: inputType,
      decoration: InputDecoration(
        // border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
        prefixIcon: icon != null ? icon : null,
        suffixIcon: endIcon != null ? endIcon : null,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.black, fontSize: 16),
        labelStyle: TextStyle(color: Colors.black, fontSize: 25),
      ),
    );



Widget OrderDetails() => Container(
      height: 70.h,
      margin: EdgeInsets.symmetric(vertical: 18.h, horizontal: 20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: ColorManager.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 6,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 7.h),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 0,
                blurRadius: 6,
                offset: Offset(0, 0), // changes position of shadow
              ),
            ], borderRadius: BorderRadius.circular(30.r)),
            child: const CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(
                  'https://miro.medium.com/max/1000/1*wnKTi_JRAZJ58WeWaCn7yw.jpeg'),
              backgroundColor: Colors.transparent,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 6.h,
                ),
                Text(
                  'دقيق حيفا',
                  style: getBoldStyle(
                      color: ColorManager.black, fontSize: FontSize.s14),
                ),
                SizedBox(
                  height: 6.h,
                ),
                Row(
                  children: [
                    Text(
                      'وزن 25 كجم: ',
                      style: getMediumStyle(
                          color: ColorManager.black, fontSize: FontSize.s12.sp),
                    ),
                    Text(
                      '100',
                      style: getRegularStyle(
                          color: ColorManager.gray, fontSize: FontSize.s14.sp),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
Widget NewOrderProductList() => Container(
  height: 100.h,
  margin: EdgeInsets.symmetric(vertical: 18.h),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(8.r),
    color: ColorManager.white,
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.2),
        spreadRadius: 0,
        blurRadius: 6,
        offset: Offset(0, 2), // changes position of shadow
      ),
    ],
  ),
  child: Row(

    children: [
      Container(
        margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 7.h),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 6,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ], borderRadius: BorderRadius.circular(30.r)),
        child: const CircleAvatar(
          radius: 30.0,
          backgroundImage: NetworkImage(
              'https://miro.medium.com/max/1000/1*wnKTi_JRAZJ58WeWaCn7yw.jpeg'),
          backgroundColor: Colors.transparent,
        ),
      ),
      Spacer(flex: 1,),
      Text(
        'دقيق حيفا',
        style: getBoldStyle(
            color: ColorManager.black, fontSize: FontSize.s14),
      ),
      Spacer(flex: 1,),
      ElevatedButton(onPressed: ()=>Get.to(NewOrderProductDetails()), child: Text('اطلب الان',style: getMediumStyle(color: ColorManager.white),))
    ],
  ),
);
Widget RefundOrderProductList() => Container(
  height: 100.h,
  margin: EdgeInsets.symmetric(vertical: 18.h),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(8.r),
    color: ColorManager.white,
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.2),
        spreadRadius: 0,
        blurRadius: 6,
        offset: Offset(0, 2), // changes position of shadow
      ),
    ],
  ),
  child: Row(

    children: [
      Container(
        margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 7.h),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 6,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ], borderRadius: BorderRadius.circular(30.r)),
        child: const CircleAvatar(
          radius: 30.0,
          backgroundImage: NetworkImage(
              'https://miro.medium.com/max/1000/1*wnKTi_JRAZJ58WeWaCn7yw.jpeg'),
          backgroundColor: Colors.transparent,
        ),
      ),
      Spacer(flex: 1,),
      Text(
        'دقيق حيفا',
        style: getBoldStyle(
            color: ColorManager.black, fontSize: FontSize.s14),
      ),
      Spacer(flex: 1,),
      ElevatedButton(onPressed: ()=>Get.to(RefundOrderProductDetails()), child: Text('اطلب الان',style: getMediumStyle(color: ColorManager.white),))
    ],
  ),
);

Widget CustomerOrder() => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 150.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: ColorManager.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 0,
              blurRadius: 6,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 5.h, right: 5.w),
              child: const CircleAvatar(
                radius: 38.0,
                backgroundImage: NetworkImage(
                    'https://miro.medium.com/max/1000/1*wnKTi_JRAZJ58WeWaCn7yw.jpeg'),
                backgroundColor: Colors.transparent,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'هذا النص هو مثال لنص',
                    style: getBoldStyle(
                        color: ColorManager.black, fontSize: FontSize.s14),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Row(
                    children: [
                      Text(
                        'وزن 25 كجم: ',
                        style: getMediumStyle(
                            color: ColorManager.black,
                            fontSize: FontSize.s14.sp),
                      ),
                      Text(
                        '100',
                        style: getMediumStyle(
                            color: ColorManager.gray,
                            fontSize: FontSize.s14.sp),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Text(
                        'الزبون: ',
                        style: getMediumStyle(
                            color: ColorManager.black,
                            fontSize: FontSize.s14.sp),
                      ),
                      Text(
                        'احمد سعيد',
                        style: getMediumStyle(
                            color: ColorManager.gray,
                            fontSize: FontSize.s14.sp),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Row(
                    children: [
                      Text(
                        'وزن 50 كجم: ',
                        style: getMediumStyle(
                            color: ColorManager.black,
                            fontSize: FontSize.s14.sp),
                      ),
                      Text(
                        '50',
                        style: getMediumStyle(
                            color: ColorManager.gray,
                            fontSize: FontSize.s14.sp),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Text(
                        'رقم الهاتف :  ',
                        style: getMediumStyle(
                            color: ColorManager.black,
                            fontSize: FontSize.s14.sp),
                      ),
                      Text(
                        '5217143',
                        style: getMediumStyle(
                            color: ColorManager.gray,
                            fontSize: FontSize.s14.sp),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Row(
                    children: [
                      Text(
                        'الكمية: ',
                        style: getMediumStyle(
                            color: ColorManager.black,
                            fontSize: FontSize.s14.sp),
                      ),
                      Text(
                        '150',
                        style: getMediumStyle(
                            color: ColorManager.gray,
                            fontSize: FontSize.s14.sp),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Text(
                        ': تاريخ الطلب: ',
                        style: getMediumStyle(
                            color: ColorManager.black,
                            fontSize: FontSize.s14.sp),
                      ),
                      Text(
                        '12/12/2021',
                        style: getMediumStyle(
                            color: ColorManager.gray,
                            fontSize: FontSize.s14.sp),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 55.w,
                        height: 20.h,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'قبول',
                            style: getRegularStyle(
                                color: ColorManager.white,
                                fontSize: FontSize.s10.sp),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: ColorManager.primary,
                              elevation: 1,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(AppSize.s5))),
                        ),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      SizedBox(
                        width: 55.w,
                        height: 20.h,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'رفض',
                            style: getRegularStyle(
                                color: ColorManager.reject,
                                fontSize: FontSize.s10.sp),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: ColorManager.white,
                              side: BorderSide(
                                width: 1.0,
                                color: ColorManager.reject,
                              ),
                              elevation: 1,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(AppSize.s5))),
                        ),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      SvgPicture.asset(
                        IconAssets.calendar,
                        width: 13.w,
                        height: 13.h,
                      ),
                      SizedBox(
                        width: 6.w,
                      ),
                      Text('منذ 3 ساعات ',
                          style: getRegularStyle(
                              color: ColorManager.grayTime,
                              fontSize: FontSize.s13)),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );



Widget WidgetSearchField({
  required TextInputType inputType,
  required TextEditingController controller,
  required Icon icon,
  Icon? endIcon,
  bool isPassword = false,
}) =>
    Container(
      height: 40.h,
      width: 270.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: ColorManager.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 6,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: TextFormField(
        style: TextStyle(color: Colors.black),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        obscureText: isPassword,
        maxLines: 1,
        keyboardType: inputType,
        decoration: InputDecoration(
          // border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
          suffixIcon: icon,
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(15),

          hintStyle: TextStyle(color: Colors.black, fontSize: 16),
          labelStyle: TextStyle(color: Colors.black, fontSize: 25),
        ),
      ),
    );





Widget CompletedOrder() => Container(
      height: 135.h,
      width: 350.w,


      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: ColorManager.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 6,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          Container(
            padding: EdgeInsets.only(top: 5.h, right: 5.w),
            decoration: BoxDecoration(),
            child: const CircleAvatar(
              radius: 38.0,
              backgroundImage: NetworkImage(
                  'https://miro.medium.com/max/1000/1*wnKTi_JRAZJ58WeWaCn7yw.jpeg'),
              backgroundColor: Colors.transparent,
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 9.h, horizontal: 10.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'هذا النص هو مثال لنص',
                  style: getBoldStyle(
                      color: ColorManager.black, fontSize: FontSize.s14),
                ),
                SizedBox(
                  height: 6.h,
                ),
                Row(
                  children: [
                    Text(
                      'وزن 25 كجم: ',
                      style: getMediumStyle(
                          color: ColorManager.black, fontSize: FontSize.s14.sp),
                    ),
                    Text(
                      '100',
                      style: getMediumStyle(
                          color: ColorManager.gray, fontSize: FontSize.s14.sp),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
              
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Text(
                      'وزن 50 كجم: ',
                      style: getMediumStyle(
                          color: ColorManager.black, fontSize: FontSize.s14.sp),
                    ),
                    Text(
                      '50',
                      style: getMediumStyle(
                          color: ColorManager.gray, fontSize: FontSize.s14.sp),
                    ),

                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),

                Row(
                  children: [
                    Text(
                      'رقم الطلبية: ',
                      style: getMediumStyle(
                          color: ColorManager.black, fontSize: FontSize.s14.sp),
                    ),
                    Text(
                      '400',
                      style: getMediumStyle(
                          color: ColorManager.gray, fontSize: FontSize.s14.sp),
                    ),
                    SizedBox(width:  40.w,),
                    SvgPicture.asset(
                      IconAssets.calendar,
                      height: 16.h,
                      width: 16.w,
                      color: ColorManager.primary,
                    ),
                    SizedBox(width: 4.w,),
                    Text('12/12/2022',style: getLightStyle(color: ColorManager.gray),)
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );









