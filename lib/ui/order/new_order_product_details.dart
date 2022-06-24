import 'package:agc_customer/model/product_model.dart';
import 'package:agc_customer/servisers/firebase_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/styles_manager.dart';

class NewOrderProductDetails extends StatelessWidget {
    NewOrderProductDetails({Key? key,required this.productModel}) : super(key: key);
  ProductModel productModel;
TextEditingController controllerQuntity=TextEditingController();
  DateTime _selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Consumer<FireBaseProvider>(
          builder:(index,provider,x){
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () => Get.back(),
                        icon: Icon(Icons.arrow_forward)),
                    Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset(
                        IconAssets.cart,
                        height: 25.h,
                        width: 25.w,
                        color: ColorManager.primary,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset(
                        IconAssets.person,
                        height: 25.h,
                        width: 25.w,
                        color: ColorManager.primary,
                      ),
                    ),
                  ],
                ),
                Image(
                  image:NetworkImage(productModel.imagePath!),
                  width: 388.w,
                  height: 300.h,
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  productModel.productName,
                  style: getBlackStyle(color: Colors.black),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  productModel.description,
                  style: getLightStyle(color: ColorManager.gray),
                ),
                SizedBox(
                  height: 15.h,
                ),

                Row(
                  children: [
                    const Text("الكمية التي تريد طلبها "),
                    SizedBox(
                      width: 30.w,
                    ),
                    Container(
                        width: 100.w,
                        height: 32.h,
                        child: TextFormField(
                          controller: controllerQuntity,
                          style: TextStyle(fontSize: 16.0, color: Colors.black),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              fillColor: ColorManager.gray),
                          keyboardType: TextInputType.numberWithOptions(),
                        ))
                  ],
                ),
                SizedBox(
                  height: 70.h,
                ),
                Row(
                  children: [
                    GestureDetector(
                     onTap: (){
                       productModel.quantity=int.parse(controllerQuntity.text);
                       provider.cartProduct.add(productModel);

                     },
                      child: Container(
                          width: 150.w,
                          height: 52.h,
                          decoration: BoxDecoration(
                            color: ColorManager.textOrange,
                            borderRadius: BorderRadius.circular(15.r)
                          ),
                          child: Center(
                            child: Text(
                              'إضافة الى السلة',
                              style: getBoldStyle(color: ColorManager.white,),
                            ),
                          )),
                    ),
                    SizedBox(
                      width: 25.w,
                    ),
                    GestureDetector(
                      onTap: (){
                        _getDateFromUser(context);
                      },
                      child: Container(
                          width: 150.w,
                          height: 52.h,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: ColorManager.textOrange,
                                width: 1
                              ),
                              color: ColorManager.white,
                              borderRadius: BorderRadius.circular(15.r)

                          ),
                          child: Center(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  IconAssets.calendar,
                                  height: 25.h,
                                  width: 25.w,
                                  color: ColorManager.textOrange,
                                ),
                                Text(
                                  'طلب مجدول',
                                  style: getBoldStyle(color: ColorManager.textOrange,),
                                ),
                              ],
                            ),
                          )),
                    ),
                  ],
                )
              ],
            ),
          );}
        ),
      ),

    );

  }
    _getDateFromUser(BuildContext context) async {
      DateTime? _pickedDate = await showDatePicker(
          context: context,
          initialDate: _selectedDate,
          firstDate: DateTime(2015),
          lastDate: DateTime(2030));

      if (_pickedDate != null) {

          _selectedDate = _pickedDate;

      } else {
        print('');
      }
    }

}

