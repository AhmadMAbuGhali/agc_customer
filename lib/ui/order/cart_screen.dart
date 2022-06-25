import 'package:agc_customer/model/order.dart';
import 'package:agc_customer/model/product_model.dart';
import 'package:agc_customer/resources/constants_manager.dart';
import 'package:agc_customer/servisers/firebase_provider.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/styles_manager.dart';
import '../../servisers/auth_provider.dart';

DateTime selectedDate = DateTime.now();

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);
  GlobalKey<NavigatorState> kkk = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: const Size(375, 812),
    );
    return Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.cart),
        ),
        body: Consumer<FireBaseProvider>(builder: (context, provider, x) {
          return provider.cartProduct.isEmpty
              ? emptyCart(context)
              : fullCart(context);
        }));
  }
}

Widget emptyCart(BuildContext context) {
  return Directionality(
    textDirection: TextDirection.rtl,
    child: SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(
            height: 185.h,
          ),
          Container(
            width: 200.w,
            height: 190.h,
            decoration: BoxDecoration(
                color: ColorManager.parent,
                image: DecorationImage(image: AssetImage(ImageAssets.empty_cart))),
          ),
          SizedBox(
            height: 18.h,
          ),
          Center(
            child: Text(
              'عربة التسوق فارغة',
              style: getBoldStyle(
                  color: ColorManager.primary, fontSize: FontSize.s14.sp),
            ),
          ),
          SizedBox(
            height: 23.h,
          ),
        ]),
      ),
    ),
  );
}

Widget fullCart(BuildContext context) {
  ScreenUtil.init(
    context,
    designSize: const Size(375, 812),
  );
  return Directionality(
    textDirection: TextDirection.rtl,
    child: SingleChildScrollView(
      child: Consumer<FireBaseProvider>(builder: (context, provider, x) {
        return Container(
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          child: ListView(
            children: [
              SizedBox(
                height: 35.h,
              ),
              SizedBox(
                height: 550.h,
                child: ListView.builder(
                    itemCount: provider.cartProduct.length,
                    itemBuilder: (context, index) {
                      ScreenUtil.init(
                        context,
                        designSize: const Size(375, 812),
                      );
                      return Dismissible(
                        key: UniqueKey(),
                        direction: DismissDirection.startToEnd,
                        onDismissed: (direction) {
                          // provider.itemCart.
                        },
                        child: cartWidget(
                          product: provider.cartProduct[index],
                          ind: index,
                        ),
                        confirmDismiss: (DismissDirection direction) async {
                          return await showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text("Confirm"),
                                content: const Text(
                                    "Are you sure you wish to delete this item?"),
                                actions: <Widget>[
                                  ElevatedButton(
                                      onPressed: () {
                                        // provider.deleteWishlistProduct(index);
                                        // Navigator.of(context).pop(true);
                                      },
                                      child: const Text("DELETE")),
                                  ElevatedButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(false),
                                    child: const Text("CANCEL"),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        background: Container(
                          decoration: BoxDecoration(
                              color: ColorManager.textOrange,
                              borderRadius: BorderRadius.circular(8.r)),
                          padding: EdgeInsets.only(right: 20.w),
                          alignment: Alignment.centerRight,
                          child: const Icon(
                            Icons.delete_forever,
                            color: Colors.white,
                          ),
                        ),
                      );
                    }),
              ),
              Row(
                children: [
                  SizedBox(
                      width: 150.w,
                      height: 44.h,
                      child: ElevatedButton(
                          onPressed: () {
                            getDateFromUser(context);

                          },
                          child: Text(
                            'تاريخ الطلب',
                            style: getBoldStyle(
                                color: ColorManager.black,
                                fontSize: FontSize.s14.sp),
                          ))),
                  SizedBox(width: 20,),
                  SizedBox(
                      width: 150.w,
                      height: 44.h,
                      child: ElevatedButton(
                          onPressed: () {
                            List<LineItemsPost> allItem = [];
                            for (int i = 0;
                                i < provider.cartProduct.length;
                                i++) {
                              LineItemsPost lineItem = LineItemsPost(
                                  productId: provider.cartProduct[i].id,
                                  quantity: provider.cartProduct[i].quantity);
                              allItem.add(lineItem);
                            }
                            Order order = Order(
                                lineItems: allItem,
                                customerId: AppConstants.loggedCustomer!.id,
                                date: selectedDate.toString(),
                                status: 'waiting',
                                customerName: AppConstants.loggedCustomer!.name,
                                company:
                                    AppConstants.loggedCustomer!.bakeryName,
                                phone:
                                    AppConstants.loggedCustomer!.phoneNumber);
                            provider.addOrder(order);
                            Get.back();
                          },
                          child: Text(
                            'التقدم لإتمام الطلب',
                            style: getBoldStyle(
                                color: ColorManager.black,
                                fontSize: FontSize.s14.sp),
                          ))),
                ],
              )
            ],
          ),
        );
      }),
    ),
  );
}

getDateFromUser(BuildContext context) async {

  DateTime? _pickedDate = await showDatePicker(

      context: context,
      initialDate: selectedDate,

      firstDate: DateTime(2015),
      lastDate: DateTime(2030));
      DateTimePickerType.date;
  if (_pickedDate != null) {
    selectedDate = _pickedDate;
  } else {
    print('');
  }

}

class cartWidget extends StatelessWidget {
  cartWidget({Key? key, required this.product, required this.ind})
      : super(key: key);
  ProductModel product;
  int ind;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: const Size(375, 812),
    );
    return Consumer<AuthProvider>(builder: (context, provider, x) {
      return Container(
        height: 128.h,
        margin: EdgeInsets.symmetric(vertical: 8.h),
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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 128.h,
              width: 100.w,
              decoration: BoxDecoration(
                  color: ColorManager.parent,
                  borderRadius: BorderRadius.circular(8.r),
                  image: DecorationImage(
                    image: NetworkImage(product.imagePath!),
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  )),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.productName + product.wight,
                    style: getBoldStyle(
                        color: ColorManager.black, fontSize: FontSize.s14),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(children: [
                    InkWell(
                      onTap: () {
                        product.quantity++;
                        provider.notifyListeners();
                        // provider.addQuntity(ind);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorManager.primary,
                        ),
                        child: Icon(Icons.add, size: 22),
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5.h),
                      child: Text(
                        product.quantity.toString(),
                        style: getBoldStyle(
                            color: ColorManager.black,
                            fontSize: FontSize.s16.sp),
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    InkWell(
                      onTap: () {
                        if (product.quantity > 1) {
                          product.quantity--;
                          provider.notifyListeners();
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorManager.primary.withOpacity(.4),
                        ),
                        child: Icon(Icons.remove, size: 22),
                      ),
                    )
                  ]),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
