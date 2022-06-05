import 'package:agc_customer/ui/registration/login.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';

class CustomerNavBar extends StatefulWidget {
  @override
  State<CustomerNavBar> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<CustomerNavBar> {
  final int _pageCount = 4;
  int _pageIndex = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          height: 50.0,
          items: <Widget>[
            SvgPicture.asset(
              IconAssets.newOrder,width: 20.w,height: 20.h,
            ),
            SvgPicture.asset(
              IconAssets.newOrder,width: 20.w,height: 20.h,
            ),
            SvgPicture.asset(
              IconAssets.newOrder,width: 20.w,height: 20.h,
            ),
            SvgPicture.asset(
              IconAssets.newOrder,width: 20.w,height: 20.h,
            ),
            SvgPicture.asset(
              IconAssets.newOrder,width: 20.w,height: 20.h,
            ),


          ],
          color: Colors.white.withOpacity(0.11),
          buttonBackgroundColor: ColorManager.button,
          backgroundColor: ColorManager.white,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _pageIndex = index;
            });
          },
          letIndexChange: (index) => true,
        ),
        body: _body());
  }

  Widget _body() {
    return Stack(
      children: List<Widget>.generate(_pageCount, (int index) {
        return IgnorePointer(
          ignoring: index != _pageIndex,
          child: Opacity(
            opacity: _pageIndex == index ? 1.0 : 0.0,
            child: Navigator(
              onGenerateRoute: (RouteSettings settings) {
                return MaterialPageRoute(
                  builder: (_) => ppage(index),
                  settings: settings,
                  // Hello
                );
              },
            ),
          ),
        );
      }),
    );
  }

  Widget ppage(int index) {
    switch (index) {
      case 0:
        return Login();
      case 1:
        return Login();
      case 2:
        return Login();
      case 3:
        return Login();
        case 4:
        return Login();
    }
    throw "Invalid index $index";
  }
}
