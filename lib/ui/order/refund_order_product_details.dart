import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/styles_manager.dart';

class RefundOrderProductDetails extends StatefulWidget {
  const RefundOrderProductDetails({Key? key}) : super(key: key);

  @override
  State<RefundOrderProductDetails> createState() => _RefundOrderProuductDetailsState();
}

class _RefundOrderProuductDetailsState extends State<RefundOrderProductDetails> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
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
                image: AssetImage(ImageAssets.test),
                width: 388.w,
                height: 300.h,
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                'دقيق القدس',
                style: getBlackStyle(color: Colors.black),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                'هذا النص مثال عن التفاصيل ',
                style: getLightStyle(color: ColorManager.gray),
              ),
              SizedBox(
                height: 15.h,
              ),

              Row(
                children: [
                  const Text("الكمية التي تريد طلبها"),
                  SizedBox(
                    width: 30.w,
                  ),
                  Container(
                      width: 100.w,
                      height: 32.h,
                      child: TextFormField(
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
              SizedBox(height: 100.h,),
              GestureDetector(
                onTap: (){},
                child: Container(
                    width: double.infinity.w,
                    height: 52.h,
                    decoration: BoxDecoration(
                        color: ColorManager.textOrange,
                        borderRadius: BorderRadius.circular(15.r)
                    ),
                    child: Center(
                      child: Text(
                        'ارجاع',
                        style: getBoldStyle(color: ColorManager.white,),
                      ),
                    )),
              ),



            ],
          ),
        ),
      ),

    );
  }


}

