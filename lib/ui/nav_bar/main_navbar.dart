
import 'package:agc_customer/ui/order/complete_order.dart';
import 'package:agc_customer/ui/order/new_order.dart';
import 'package:agc_customer/ui/order/refund_order.dart';
import 'package:agc_customer/ui/order/track_order.dart';
import '../order/notification.dart';
import '../registration/wait_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';

class MainNavBar extends StatefulWidget {
  MainNavBar({Key? key}) : super(key: key);
  @override
  State<MainNavBar> createState() => _MainNavBarState();
}

class _MainNavBarState extends State<MainNavBar> {
  final pages = [
    NewOrder(),
    RefundOrder(),
    TrackOrder(),
    CompleteOrder(),
    NotificationPage(),

  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: pages[index],
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              // border: Border(top: BorderSide(color: Colors.red, width: 1.0)),

              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(24.r),
                  topLeft: Radius.circular(24.r)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24.r),
                topRight: Radius.circular(24.r),
              ),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                elevation: 0.0,
                currentIndex: index,
                onTap: (newindex) {
                  setState(() {
                    index = newindex;
                  });
                  setState(() {});
                },
                items: [
                  BottomNavigationBarItem(
                      label: '',
                      icon: index == 0
                          ? SvgPicture.asset(
                        IconAssets.newOrder,
                        height: 25.h,
                        width: 25.w,
                        color: ColorManager.textOrange,
                      )
                          : SvgPicture.asset(
                        IconAssets.newOrder,
                        height: 25.h,
                        width: 25.w,
                         color: ColorManager.primary,
                      )),
                  BottomNavigationBarItem(
                      label: '',
                      icon: index == 1
                          ? SvgPicture.asset(
                        IconAssets.refund,
                        height: 25.h,
                        width: 25.w,
                        color: ColorManager.textOrange,
                      )
                          : SvgPicture.asset(
                        IconAssets.refund,
                        height: 25.h,
                        width: 25.w,
                         color: ColorManager.primary,
                      )),
                  BottomNavigationBarItem(
                      label: '',
                      icon: index == 2
                          ? SvgPicture.asset(
                        IconAssets.tracking,
                        height: 25.h,
                        width: 25.w,
                        color: ColorManager.textOrange,
                      )
                          : SvgPicture.asset(
                        IconAssets.tracking,
                        height: 25.h,
                        width: 25.w,
                         color: ColorManager.primary,
                      )),
                  BottomNavigationBarItem(
                      label: '',
                      icon: index == 3
                          ? SvgPicture.asset(
                        IconAssets.complete_order,
                        height: 25.h,
                        width: 25.w,
                        color: ColorManager.textOrange,
                      )
                          : SvgPicture.asset(
                        IconAssets.complete_order,
                        height: 25.h,
                        width: 25.w,
                         color: ColorManager.primary,
                      )),
                  BottomNavigationBarItem(
                      label: '',
                      icon: index == 4
                          ? SvgPicture.asset(
                        IconAssets.notification,
                        height: 25.h,
                        width: 25.w,
                        color: ColorManager.textOrange,
                      )
                          : SvgPicture.asset(
                        IconAssets.notification,
                        height: 25.h,
                        width: 25.w,
                        color: ColorManager.primary,
                      )),
                ],
              ),
            ),
          ),
        ));
  }

}