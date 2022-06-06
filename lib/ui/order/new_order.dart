import 'package:agc_customer/ui/order/new_order_product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../componant/componant.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/styles_manager.dart';

class NewOrder extends StatelessWidget {
  const NewOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text('طلبة جديدة ',style: getBoldStyle(color: ColorManager.primary),),
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
                    onTap: (){},
                    child: SvgPicture.asset(
                      IconAssets.person,
                      height: 25.h,
                      width: 25.w,
                      color: ColorManager.primary,
                    ),
                  ),
                ],
              ),
              NewOrderProductList(),
            ],
          ),
        ),
      ),
    );
  }
}
