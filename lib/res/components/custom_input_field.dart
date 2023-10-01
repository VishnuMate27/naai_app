import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naai_app/res/colors/app_color.dart';

class CustomInputField extends StatelessWidget {
  final bool act;
  final String text;
  final bool emptyValidation;
  final Function(String)? onchaged;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final bool secure;
  final bool kt;
  var keyboardType;
  var validaton;
  CustomInputField(
      {super.key,
      required this.act,
      required this.text,
      this.validaton,
      this.emptyValidation = true,
      this.controller,
      this.onchaged,
      this.secure = false,
      this.suffixIcon,
      this.keyboardType = TextInputType.name,
      this.kt = false});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColor.secondaryColor,
      onChanged: onchaged,
      validator: emptyValidation
          ? (value) {
              if (value == null || value.isEmpty) {
                return '$text Required';
              }
              return null;
            }
          : validaton,
      style: TextStyle(
          color: AppColor.secondaryColor,
          fontSize: 18.sp,
          fontWeight: FontWeight.w700),
      // keyboardType: TextInputType.number,
      obscureText: secure,
      decoration: InputDecoration(
        hintText: text,
        fillColor: Colors.transparent,
        filled: kt,
        // errorStyle: TextStyle(color: AppColor.primaryColor, fontWeight: FontWeight.w400, fontSize: 15.sp),
        // errorText: "Enter valid $text",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.r),
          borderSide:
              BorderSide(color: AppColor.secondaryColor, width: kt ? 0.0 : 1.0),
        ),
        suffixIcon: suffixIcon,
        contentPadding:
            EdgeInsets.only(left: 20.w, top: 25.h, bottom: 25.h),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.r),
          borderSide:
              BorderSide(color: AppColor.secondaryColor, width: kt ? 0.0 : 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.r),
          borderSide:
              BorderSide(color: AppColor.secondaryColor, width: kt ? 0.0 : 1.0),
        ),
        hintStyle: TextStyle(
          color: AppColor.secondaryColor,
          fontWeight: FontWeight.w400,
          fontSize: 16.sp,
        ),
      ),
      controller: controller,
    );
  }
}
