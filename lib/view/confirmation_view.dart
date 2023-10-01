import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:naai_app/res/colors/app_color.dart';
import 'package:naai_app/view/dashboard_view.dart';
import 'package:naai_app/view_model/controller/booking_view_model.dart';
import 'package:naai_app/view_model/controller/dashboard_view_model.dart';

class ConfirmationView extends StatefulWidget {
  const ConfirmationView({super.key});

  @override
  State<ConfirmationView> createState() => _ConfirmationViewState();
}

class _ConfirmationViewState extends State<ConfirmationView> {
  final bookingVM = Get.put(BookingViewModel());
  final dashboardVM = Get.put(DashboardViewModel());
  int itemNum = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 42.w),
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
              height: 135.h,
            ),
            //Successmark Icon
            Center(
              child: Image(
                image: AssetImage('assets/icons/successmark.png'),
              ),
            ),
            //Gap
            SizedBox(
              height: 30.h,
            ),
            // Booking successful message
            Center(
              child: Text(
                'Your Appointment has been booked successfully!',
                softWrap: true,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.secondaryColor
                ),
              ),
            ),
            //Gap
            SizedBox(
              height: 33.h,
            ),
            // Booking Summary text
            Center(
              child: Text(
                'Booking Summary',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColor.secondaryColor
                ),
              ),
            ),
            //Gap
            SizedBox(
              height: 38.h,
            ),
            // Booking Date text
            Text(
              'Booking Date: ${DateFormat('dd/MM/yyyy')
                .format(bookingVM.selectedDate.value)
                .toString()}',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColor.secondaryColor
              ),
            ),
            //Gap
            SizedBox(
              height: 13.h,
            ),
            // Booking Date text
            Text(
              'Booking Time: ${bookingVM.selectedTime.value.hour}:${bookingVM.selectedTime.value.minute} (IST)',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColor.secondaryColor
              ),
            ),
            //Gap
            SizedBox(
              height: 13.h,
            ),
            //Selected services text: Hair Cutting, Nail Treatments
            GetBuilder<BookingViewModel>(
              builder: (_) => Text(
                'Selected services:' + bookingVM.selectedServices.toString(),
                style:
                TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400),
              ),
            ),
            //Gap
            SizedBox(
              height: 43.h,
            ),
            //Back to home Button
            Center(
              child: GestureDetector(
                onTap: (){
                  Get.to(DashboardView());
                  Get.deleteAll();
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 175.w,
                  padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 15.h),
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: BorderRadius.circular(58.r)
                  ),
                  child: Text(
                    '< Back to home',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColor.whiteColor
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
