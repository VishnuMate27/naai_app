import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:naai_app/res/colors/app_color.dart';

class Utils {
  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessage(String messsage) {
    Fluttertoast.showToast(
      msg: messsage,
      backgroundColor: AppColor.primaryColor,
      textColor: AppColor.whiteColor,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_LONG,
    );
  }

  static toastMessageCenter(String messsage) {
    Fluttertoast.showToast(
      msg: messsage,
      backgroundColor: AppColor.secondaryColor,
      textColor: AppColor.whiteColor,
      gravity: ToastGravity.CENTER,
      toastLength: Toast.LENGTH_LONG,
    );
  }

  static snackBar(String title, String message) {
    Get.snackbar(
        title,
        message,
        colorText: AppColor.whiteColor,
        duration: Duration(seconds: 5),
        backgroundColor: AppColor.primaryColor
    );
  }
}
