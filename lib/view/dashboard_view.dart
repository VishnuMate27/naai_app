import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:naai_app/res/colors/app_color.dart';
import 'package:naai_app/view/employee_view.dart';
import 'package:naai_app/view_model/controller/dashboard_view_model.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  final dashboardVM = Get.put(DashboardViewModel());
  @override
  Widget build(BuildContext context) {
    dashboardVM.readJson();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
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
                height: 30.h,
              ),
              //Dashboard Text
              GestureDetector(
                onTap: (){
                },
                child: Text(
                  'Dashboard',
                  style: TextStyle(fontSize: 36.sp, fontWeight: FontWeight.w400),
                ),
              ),
              //Gap
              SizedBox(
                height: 35.h,
              ),

              ///!Employee Cards
              GetBuilder<DashboardViewModel>(
                builder: (dashboardVM) {
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: dashboardVM.items.length,
                    itemBuilder: (context, index) {
                      List<String> services = List<String>.from(
                          dashboardVM.items[index]["services"]);
                      return Column(
                        children: [
                          Card(
                            //key: ValueKey(_items[index]["id"]),
                            child: Container(
                              height: 120.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.sp),
                                border: Border.all(
                                    color: AppColor.secondaryColor,
                                    style: BorderStyle.solid),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  //Gap
                                  SizedBox(
                                    width: 15.w,
                                  ),
                                  //Employee CircleAvatar
                                  CircleAvatar(
                                    radius: 50.sp,
                                    foregroundImage: NetworkImage(
                                        dashboardVM.items[index]["avatar"]),
                                  ),
                                  //Gap
                                  SizedBox(
                                    width: 21.w,
                                  ),
                                  //Employee Details
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 20.h),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        //Employee Name
                                        Text(
                                            dashboardVM.items[index]["name"],
                                            style: TextStyle(
                                                fontSize: 24.sp,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        //Gap
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        //Services offered
                                        Text(
                                          services[0] +
                                              ', ' +
                                              services[1] +
                                              " " +
                                              (services.length - 2).toString() +
                                              "+",
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        //Gap
                                        SizedBox(
                                          height: 8.h,
                                        ),
                                        //Prices and Ratings
                                        Row(
                                          children: [
                                            Text(
                                              "\$" +
                                                  dashboardVM.items[index]
                                                          ["price"]
                                                      .toString(),
                                              style: TextStyle(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            //Gap
                                            SizedBox(
                                              width: 13.h,
                                            ),
                                            RatingBarIndicator(
                                              rating: dashboardVM.items[index]
                                                  ["rating"],
                                              itemBuilder: (context, index) =>
                                                  Icon(
                                                Icons.star,
                                                color: AppColor.starColor,
                                              ),
                                              itemCount: 5,
                                              itemSize: 10.h,
                                              unratedColor: AppColor.starColor
                                                  .withAlpha(50),
                                              direction: Axis.horizontal,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  //Gap
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  //Book Me Button
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(EmployeeView(), arguments: index);
                                    },
                                    child: Container(
                                      width: 85.w,
                                      height: 45.h,
                                      decoration: BoxDecoration(
                                        color: AppColor.primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(5.r),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Book Me',
                                          style: TextStyle(
                                              color: AppColor.whiteColor),
                                        ),
                                      ),
                                    ),
                                  ),
                                  //Gap
                                  SizedBox(
                                    width: 15.w,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          )
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
