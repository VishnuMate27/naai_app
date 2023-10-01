import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:naai_app/res/colors/app_color.dart';
import 'package:naai_app/res/components/custom_input_field.dart';
import 'package:naai_app/view_model/controller/login_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final loginVM = Get.put(LoginViewModel());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
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
                  height: 156.h,
                ),
                //Login Text
                Text(
                  'Login',
                  style:
                      TextStyle(fontSize: 36.sp, fontWeight: FontWeight.w400),
                ),
                //Gap
                SizedBox(
                  height: 75.h,
                ),
                //Email TextField
                CustomInputField(
                  controller: loginVM.emailController,
                  act: false,
                  text: 'Email',
                  emptyValidation: true,
                  validaton: (String? value) {
                    if (value!.isEmpty || !value.contains('@')) {
                      return 'Please Enter valid Email';
                    } else {
                      return null;
                    }
                  },
                ),
                //Gap
                SizedBox(
                  height: 34.h,
                ),
                //Password TextField
                CustomInputField(
                  controller: loginVM.passwordController,
                  secure: true,
                  act: false,
                  text: 'Password',
                  emptyValidation: true,
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: AppColor.secondaryColor,
                    ),
                    onPressed: () {},
                  ),
                ),
                //Gap
                SizedBox(
                  height: 60.h,
                ),
                //Login Button
                GestureDetector(
                  onTap: () {
                    // Validate will return true if the form is valid, or false if
                    // the form is invalid.
                    if (_formKey.currentState!.validate()) {
                      // Process data.
                      loginVM.loginApi();
                    }
                  },
                  child: Container(
                    width: 345.w,
                    height: 62.h,
                    decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 32.sp, color: AppColor.whiteColor),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
