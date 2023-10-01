import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BookingViewModel extends GetxController {
  List selectedServices = [];
  var selectedDate = DateTime.now().obs;
  var selectedTime = TimeOfDay.now().obs;
  var cost = 0;
  void updateCost(List _selectedServices) {
    cost = _selectedServices.length * 50;
    update();
  }
  chooseDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: selectedDate.value,
        firstDate: DateTime(2000),
        lastDate: DateTime(2024),
        //initialEntryMode: DatePickerEntryMode.input,
        // initialDatePickerMode: DatePickerMode.year,
        helpText: 'Select Appointment Date',
        cancelText: 'Close',
        confirmText: 'Confirm',
        errorFormatText: 'Enter valid date',
        errorInvalidText: 'Enter valid date range',
        fieldLabelText: 'Appointment Date',
        fieldHintText: 'Date/Month/Year',
        );
    if (pickedDate != null && pickedDate != selectedDate.value) {
      selectedDate.value = pickedDate;
    }
  }
  bool disableDate(DateTime day) {
    if ((day.isAfter(DateTime.now().subtract(Duration(days: 1))) &&
        day.isBefore(DateTime.now().add(Duration(days: 5))))) {
      return true;
    }
    return false;
  }
  chooseTime() async {
    TimeOfDay? pickedTime = await showTimePicker(
        context: Get.context!,
        initialTime: selectedTime.value,
        builder: (context, child) {
          return Theme(data: ThemeData.light(), child: child!);
        },
        initialEntryMode: TimePickerEntryMode.input,
        helpText: 'Select Appointment Time',
        cancelText: 'Close',
        confirmText: 'Confirm',
        errorInvalidText: 'Provide valid time',
        hourLabelText: 'Select Hour',
        minuteLabelText: 'Select Minute');
    if (pickedTime != null && pickedTime != selectedTime.value) {
      selectedTime.value = pickedTime;
    }
  }

  // String bookingCost;
  // bookingCost = (selectedServices.length*50.obs).toString();
  // // int itemNum = Get.arguments;
  // // List items = [];
  // var count = 0.obs;
  // void increment(){
  //   count++;
  // }
  // void decrement(){
  //   count--;
  // }
}
