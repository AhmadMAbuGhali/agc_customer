import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../model/product_model.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/styles_manager.dart';
import '../../servisers/firebase_provider.dart';

class RefundOrderProductDetails extends StatelessWidget {
  RefundOrderProductDetails({Key? key, required this.productModel})
      : super(key: key);
  ProductModel productModel;
  TextEditingController controllerQuntity=TextEditingController();

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
                image: NetworkImage(productModel.imagePath!),
                width: 388.w,
                height: 300.h,
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                productModel.productName + " " + productModel.wight,
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
                  const Text("الكمية التي تريد ارجاعها "),
                  SizedBox(
                    width: 30.w,
                  ),
                  Container(
                      width: 100.w,
                      height: 32.h,
                      child: TextFormField(
                        style: TextStyle(fontSize: 16.0, color: Colors.black),
                        controller: controllerQuntity,
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
                height: 100.h,
              ),
              GestureDetector(
                onTap: () {
                  productModel.quantity=int.parse(controllerQuntity.text);
                  provider.cartProduct.add(productModel);
                },
                child: Container(
                    width: double.infinity.w,
                    height: 52.h,
                    decoration: BoxDecoration(
                        color: ColorManager.textOrange,
                        borderRadius: BorderRadius.circular(15.r)),
                    child: Center(
                      child: Text(
                        'ارجاع',
                        style: getBoldStyle(
                          color: ColorManager.white,
                        ),
                      ),
                    )),
              ),
            ],
          ),
        );}
      )),
    );
  }
}
