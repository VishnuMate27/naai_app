import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:naai_app/res/Utils/utils.dart';
import 'package:naai_app/res/colors/app_color.dart';
import 'package:naai_app/view/confirmation_view.dart';
import 'package:naai_app/view/dashboard_view.dart';
import 'package:naai_app/view_model/controller/booking_view_model.dart';
import 'package:naai_app/view_model/controller/dashboard_view_model.dart';

class BookingView extends StatefulWidget {
  const BookingView({super.key});

  @override
  State<BookingView> createState() => _BookingViewState();
}

class _BookingViewState extends State<BookingView> {
  @override
  Widget build(BuildContext context) {
    final bookingVM = Get.put(BookingViewModel());
    final dashboardVM = Get.put(DashboardViewModel());
    int itemNum = Get.arguments;
    List<String> services1 =
        List<String>.from(dashboardVM.items[itemNum]["services"]);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
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
              //Checkout text
              Center(
                child: Text(
                  'Checkout',
                  style: TextStyle(
                    fontSize: 36.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColor.secondaryColor,
                  ),
                ),
              ),
              //Gap
              SizedBox(
                height: 36.h,
              ),
              //Employee CircleAvatar
              Center(
                child: CircleAvatar(
                  radius: 50.sp,
                  foregroundImage:
                      NetworkImage(dashboardVM.items[itemNum]["avatar"]),
                ),
              ),
              //Gap
              SizedBox(
                height: 18.h,
              ),
              // Employee Name text
              Center(
                child: Text(
                  dashboardVM.items[itemNum]["name"],
                  style:
                      TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w400),
                ),
              ),
              //Gap
              SizedBox(
                height: 25.h,
              ),
              ListView.builder(
                scrollDirection: Axis.vertical,
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: services1.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        height: 63.h,
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //Service Title
                            Flexible(
                              fit: FlexFit.loose,
                              child: Text(
                                services1[index],
                                style: TextStyle(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            //Add Button
                            GestureDetector(
                              onTap: () {
                                Utils.toastMessage(services1[index] + " added");
                                bookingVM.selectedServices
                                    .add(services1[index]);
                                bookingVM
                                    .updateCost(bookingVM.selectedServices);
                                print(bookingVM.selectedServices);
                              },
                              child: Container(
                                padding: EdgeInsets.all(5.sp),
                                decoration: BoxDecoration(
                                    color: AppColor.primaryColor,
                                    shape: BoxShape.circle),
                                child: Icon(
                                  Icons.add,
                                  size: 20.sp,
                                  color: AppColor.whiteColor,
                                ),
                              ),
                            )
                            // Row(
                            //   children: [
                            //     //Remove Button
                            //     GestureDetector(
                            //       onTap: (){
                            //         bookingVM.decrement();
                            //       },
                            //       child: Container(
                            //         padding: EdgeInsets.all(5.sp),
                            //         decoration: BoxDecoration(
                            //             color: AppColor.primaryColor,
                            //             shape: BoxShape.circle),
                            //         child: Icon(
                            //           Icons.remove,
                            //           size: 20.sp,
                            //           color: AppColor.whiteColor,
                            //         ),
                            //       ),
                            //     ),
                            //     //Count Text
                            //
                            //     Padding(
                            //       padding:
                            //           EdgeInsets.symmetric(horizontal: 12.w),
                            //       child: Obx(
                            //         () => Text(
                            //           bookingVM.count.toString(),
                            //           style: TextStyle(
                            //             fontSize: 24.sp,
                            //             fontWeight: FontWeight.w400,
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            //     //Add Button
                            //     GestureDetector(
                            //       onTap:(){
                            //         bookingVM.increment();
                            //       },
                            //       child: Container(
                            //         padding: EdgeInsets.all(5.sp),
                            //         decoration: BoxDecoration(
                            //             color: AppColor.primaryColor,
                            //             shape: BoxShape.circle),
                            //         child: Icon(
                            //           Icons.add,
                            //           size: 20.sp,
                            //           color: AppColor.whiteColor,
                            //         ),
                            //       ),
                            //     )
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                      //Gap
                      SizedBox(
                        height: 18.h,
                      ),
                    ],
                  );
                },
              ),
              //Choose Date text
              Text(
                'Choose Date:',
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w400),
              ),
              //Gap
              SizedBox(
                height: 15.h,
              ),
              //Date Box
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                height: 63.h,
                width: 202.w,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Service Title
                    Flexible(
                      fit: FlexFit.loose,
                      child: Obx(
                        () => Text(
                          DateFormat('dd/MM/yyyy')
                              .format(bookingVM.selectedDate.value)
                              .toString(),
                          //.format(bookingVM.selectedDate.value).toString(),
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    //Calender Icon
                    IconButton(
                        onPressed: () {
                          bookingVM.chooseDate();
                        },
                        icon: Icon(Icons.calendar_month))
                  ],
                ),
              ),
              //Gap
              SizedBox(
                height: 23.h,
              ),
              //Choose Time text
              Text(
                'Choose Time:',
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w400),
              ),
              //Gap
              SizedBox(
                height: 15.h,
              ),
              //Date Box
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                height: 63.h,
                width: 202.w,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Service Title
                    Flexible(
                      fit: FlexFit.loose,
                      child: Obx(
                        () => Text(
                          "${bookingVM.selectedTime.value.hour}:${bookingVM.selectedTime.value.minute}",
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    //Calender Icon
                    IconButton(
                        onPressed: () {
                          bookingVM.chooseTime();
                        }, icon: Icon(Icons.access_time_filled))
                  ],
                ),
              ),
              //Gap
              SizedBox(
                height: 20.h,
              ),
              GetBuilder<BookingViewModel>(
                builder: (_) => Text(
                  'Selected services:' + bookingVM.selectedServices.toString(),
                  style:
                      TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w400),
                ),
              ),
              //Gap
              SizedBox(
                height: 20.h,
              ),

              ///Grand total and Book Now Button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Grand total text
                  GetBuilder<BookingViewModel>(
                    builder: (_) => Text(
                      'Grand total: \$ ${bookingVM.cost}',
                      style: TextStyle(
                          fontSize: 24.sp, fontWeight: FontWeight.w400),
                    ),
                  ),

                  //Book Now Button
                  Container(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        Get.to(ConfirmationView(), arguments: itemNum);
                      },
                      child: Container(
                        width: 115.w,
                        height: 48.h,
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 12.h),
                        decoration: BoxDecoration(
                          color: AppColor.primaryColor,
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        child: Center(
                          child: Text(
                            'Book Now',
                            style: TextStyle(
                                color: AppColor.whiteColor,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
