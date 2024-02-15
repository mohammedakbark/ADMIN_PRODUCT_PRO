import 'package:adminpanel_hardwarepro/View/Widgets/centerd_view.dart';
import 'package:adminpanel_hardwarepro/View/homepage.dart';
import 'package:adminpanel_hardwarepro/utils/colors.dart';
import 'package:adminpanel_hardwarepro/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome back!",
                        style: poppinsStyle(FontWeight.w600, Colors.black, 25),
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
                            onPressed: () {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()),
                                  (route) => false);
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
