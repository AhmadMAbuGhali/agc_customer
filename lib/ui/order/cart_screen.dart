import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/styles_manager.dart';
import '../../servisers/auth_provider.dart';
import '../nav_bar/main_navbar.dart';

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
        body: Consumer<AuthProvider>(builder: (context, provider, x) {
          return provider.productInWishList.isEmpty
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
                image:
                    DecorationImage(image: AssetImage(ImageAssets.cartEpty))),
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
          SizedBox(
              width: 194.w,
              height: 44.h,
              child: ElevatedButton(
                  onPressed: () {
                    // RouterClass.routerClass
                    //     .pushWidgetRemovePrev(MainNavBar(), context);
                  },
                  child: Text(
                    'تصفح في مارسيلا ',
                    style: getBoldStyle(
                        color: ColorManager.black, fontSize: FontSize.s14.sp),
                  )))
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
      child: Consumer<AuthProvider>(builder: (context, provider, x) {
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
                    itemCount: provider.productInWishList.length,
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
                          product: provider.productInWishList[index],
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
                                        provider.deleteWishlistProduct(index);
                                        Navigator.of(context).pop(true);
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
                          child: Icon(
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
                      width: 250.w,
                      height: 44.h,
                      child: ElevatedButton(
                          onPressed: () {
                            // RouterClass.routerClass
                            //     .pushWidget(ConfirmOrderScreen());
                            // // DioClient.dioClient.login();
                          },
                          child: Text(
                            'التقدم لإتمام الطلب',
                            style: getBoldStyle(
                                color: ColorManager.black,
                                fontSize: FontSize.s14.sp),
                          ))),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    children: [
                      Text(
                        'المجموع الكلي',
                        style: getMediumStyle(
                            color: ColorManager.black, fontSize: FontSize.s14),
                      ),
                      Text(
                        provider.allPrice.toString(),
                        style: getBoldStyle(
                            color: ColorManager.cartPrice,
                            fontSize: FontSize.s16),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        );
      }),
    ),
  );
}

class cartWidget extends StatelessWidget {
  cartWidget({Key? key, required this.product, required this.ind})
      : super(key: key);
  Product product;
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
                    image: NetworkImage(product.images!.first.src!),
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
                    product.name!,
                    style: getBoldStyle(
                        color: ColorManager.black, fontSize: FontSize.s14),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Row(
                    children: [
                      Text(
                        'المقاس :' + provider.sized[ind],
                        style: getMediumStyle(
                            color: ColorManager.black,
                            fontSize: FontSize.s14.sp),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Text(
                        'اللون :' + 'أسود',
                        style: getMediumStyle(
                            color: ColorManager.black,
                            fontSize: FontSize.s14.sp),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Text(
                    product.price!,
                    style: getBoldStyle(
                        color: ColorManager.black,
                        fontSize: FontSize.s18.sp),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(children: [
                    InkWell(
                      onTap: () {
                        provider.addQuntity(ind);
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
                        provider.quntityp[ind].toString(),
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
                        // if(provider.quntityp[ind]>1){
                        //   provider.deleteQuntity(ind);
                        // }
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
