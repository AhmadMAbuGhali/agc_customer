import 'dart:math';

import 'package:agc_customer/servisers/auth_provider.dart';
import 'package:agc_customer/ui/order/cart_screen.dart';
import 'package:agc_customer/ui/order/new_order_product_details.dart';
import 'package:agc_customer/ui/registration/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../componant/componant.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/styles_manager.dart';
import '../../servisers/firebase_provider.dart';

class NewOrder extends StatelessWidget {
  const NewOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Consumer<FireBaseProvider>(
        builder:(index,provider,x){
         return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text('طلبة جديدة ',style: getBoldStyle(color: ColorManager.primary),),
                    const Spacer(),
                    InkWell(
                      onTap: (){
                        Get.to(CartScreen());
                      },
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
                Expanded(
                  child: ListView.builder(itemCount: provider.allProduct.length,itemBuilder:
                  (context,index){
                    return NewOrderProductList(provider.allProduct[index]);
                  }),
                )

              ],
            ),
          );}
        ),
      ),
    );
  }
}
