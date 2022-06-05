import 'package:agc_customer/resources/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../resources/styles_manager.dart';

class WaitPage extends StatelessWidget {
  const WaitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 70.h,),
          Image(image: AssetImage(ImageAssets.wait) ,width: 400.w,height: 400.h,),
          SizedBox(height: 40.h,),
          Text("الرجاء الانتظار ريثما يتم قبولك ",style: getBoldStyle(color: Colors.black),)
        ],
      ),
    );
  }
}
