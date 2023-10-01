import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:naai_app/res/colors/app_color.dart';
import 'package:naai_app/view/booking_view.dart';
import 'package:naai_app/view_model/controller/dashboard_view_model.dart';

class EmployeeView extends StatefulWidget {
  const EmployeeView({super.key});

  @override
  State<EmployeeView> createState() => _EmployeeViewState();
}

class _EmployeeViewState extends State<EmployeeView> {
  final dashboardVM = Get.put(DashboardViewModel());
  int _itemNum = Get.arguments;
  @override
  Widget build(BuildContext context) {
    List<String> services1 =
        List<String>.from(dashboardVM.items[_itemNum]["services"]);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Gap
            SizedBox(
              height: 30.h,
            ),
            //Naai Logo
            Center(
              child: Image(
                width: 126.w,
                height: 84.h,
                image: AssetImage('assets/images/NaaiLogo.png'),
              ),
            ),
            //Gap
            SizedBox(
              height: 32.h,
            ),
            //Employee Name text
            Text(
              dashboardVM.items[_itemNum]["name"],
              style: TextStyle(
                  fontSize: 36.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColor.secondaryColor),
            ),
            //Gap
            SizedBox(
              height: 26.h,
            ),
            //Employee Photo
            Container(
              height: 200.h,
              width: 390.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: NetworkImage(
                    dashboardVM.items[_itemNum]["avatar"],
                  ),
                ),
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            //Gap
            SizedBox(
              height: 26.h,
            ),
            //Price & rating
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Price
                Text(
                  '\$' + dashboardVM.items[_itemNum]["price"].toString(),
                  style: TextStyle(
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColor.secondaryColor),
                ),
                // Ratings
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 6.h),
                  child: RatingBarIndicator(
                    rating: dashboardVM.items[_itemNum]["rating"],
                    itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: AppColor.starColor,
                    ),
                    itemCount: 5,
                    itemSize: 20.h,
                    unratedColor: AppColor.starColor.withAlpha(50),
                    direction: Axis.horizontal,
                  ),
                ),
              ],
            ),
            //Gap
            SizedBox(
              height: 30.h,
            ),
            Wrap(
              runSpacing: 25.h,
              spacing: 25.w,
              runAlignment: WrapAlignment.spaceBetween,
              alignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: List.generate(
                services1.length,
                (index) => Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 17.w, vertical: 11.h),
                  decoration: BoxDecoration(
                      color: AppColor.greyColor,
                      borderRadius: BorderRadius.circular(20.r)),
                  child: Text(
                    services1[index],
                    style: TextStyle(color: AppColor.secondaryColor),
                  ),
                ),
              ),
            ),
            ///Gap
            SizedBox(
              height: 40.h,
            ),
            //Checkout Button
            Container(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  Get.to(BookingView(), arguments: _itemNum);
                },
                child: Container(
                  width: 115.w,
                  height: 48.h,
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: Center(
                    child: Text(
                      'Checkout',
                      style: TextStyle(
                          color: AppColor.whiteColor,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
