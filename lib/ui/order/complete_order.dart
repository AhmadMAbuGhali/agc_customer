import 'package:agc_customer/componant/componant.dart';
import 'package:agc_customer/model/order.dart';
import 'package:agc_customer/servisers/firebase_provider.dart';
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
List<Order> orderList=[];
  @override
  Widget build(BuildContext context) {
    orderList=Provider.of<FireBaseProvider>(context,listen: false).completedOrder;
    return   SafeArea(
      child: Scaffold(
        body: Consumer<FireBaseProvider>(
          builder: (context,provider,x){
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text('الطلبيات المكتملة ',style: getBoldStyle(color: ColorManager.primary),),
                SizedBox(height: 15.h,),
                Row(
                  children: [
                    CustomSearchField(controller: provider.searchController,onChanged: (value)
                    {   provider.runFilter(orderList);},
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'هذا الحقل مطلوب';
                        }
                        return null;
                      },

                    ),
                    // WidgetSearchField(inputType: TextInputType.text, controller: provider.searchController, icon: Icon(Icons.search)),
                    Spacer(),
                    GestureDetector(
                      onTap: (){},
                      child: SvgPicture.asset(
                        IconAssets.cart,
                        height: 20.h,
                        width: 15.w,
                        color: ColorManager.primary,
                      ),
                    ),
                    SizedBox(width: 3.w,),
                    GestureDetector(
                      onTap: (){
                        Provider.of<AuthProvider>(context,listen: false).logOut();
                        Get.to(Login());
                      },
                      child: IconButton(
                          onPressed: () {},
                          icon:  Icon(
                            Icons.logout,
                            size: 22,
                            color: ColorManager.primary,
                          )),
                    ),
                  ],
                ),
                SizedBox(height: 25.h,),
              provider.noResulr? const Center(child: Text('not Exist'),):
              Expanded(child: ListView.builder(
                itemBuilder: (context,index){
                 return CompletedOrder(provider.searchOrder.isEmpty?provider.completedOrder[index]:provider.searchOrder[index]);
               },
                itemCount:provider.searchOrder.isEmpty? provider.completedOrder.length:provider.searchOrder.length, ))


              ],
            ),
          );}
        ),
      ),
    );;
  }
}
