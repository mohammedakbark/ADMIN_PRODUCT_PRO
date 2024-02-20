import 'package:adminpanel_hardwarepro/View/Widgets/centerd_view.dart';
import 'package:adminpanel_hardwarepro/View/homepage.dart';
import 'package:adminpanel_hardwarepro/utils/colors.dart';
import 'package:adminpanel_hardwarepro/utils/objects.dart';
import 'package:adminpanel_hardwarepro/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  final adminEmail = "adminpanelpro@gmail.com";
  final adminPassword = "123456";
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: appBgColor,
      body: CenterdView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "ProductCarePro.",
              style: interStyle(FontWeight.w600, lightGrey, 16),
            ),
            Text(
              "Admin",
              style: interStyle(FontWeight.w600, lightGrey, 16),
            ),
            SizedBox(
              height: height * .1,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 50, top: 50, right: 50),
                  height: height * .55,
                  width: width * .35,
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(50)),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome back!",
                          style:
                              poppinsStyle(FontWeight.w600, Colors.black, 25),
                        ),
                        Text(
                          "Enter your Credentials to access your account",
                          style: poppinsStyle(FontWeight.w500, balck, 18),
                        ),
                        SizedBox(
                          height: height * .05,
                        ),
                        Text(
                          "Enter emai address",
                          style: poppinsStyle(FontWeight.w500, balck, 15),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 10.w),
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "field is required";
                              } else if (value != adminEmail) {
                                return "email is incorrect";
                              } else {
                                return null;
                              }
                            },
                            controller: emailController,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ),
                        SizedBox(
                          height: height * .03,
                        ),
                        Text(
                          "Password",
                          style: poppinsStyle(FontWeight.w500, balck, 15),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 10.w),
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "field is required";
                              } else if (value != adminPassword) {
                                return "password is incorrect";
                              } else {
                                return null;
                              }
                            },
                            controller: passwordController,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ),
                        SizedBox(
                          height: height * .05,
                        ),
                        SizedBox(
                          width: width,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  backgroundColor: themePurple),
                              onPressed: ()async {
                                if (_formKey.currentState!.validate()) {
                               await   auth.login(
                                      emailController.text,
                                      passwordController.text,
                                      context,
                                      HomeScreen());
                                  // Navigator.of(context).pushAndRemoveUntil(
                                  //     MaterialPageRoute(
                                  //         builder: (context) => HomeScreen()),
                                  //     (route) => false);
                                }
                              },
                              child: Text(
                                "Login",
                                style: poppinsStyle(FontWeight.w600, white, 15),
                              )),
                        ),
                        // Center(
                        //   child: TextButton(
                        //       onPressed: () {},
                        //       child: Text(
                        //         "forget password",
                        //         style: poppinsStyle(FontWeight.w500,
                        //             const Color.fromRGBO(12, 42, 144, 1), 10),
                        //       )),
                        // )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: height * .45,
                  width: width * .25,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/adminLog.png"))),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
