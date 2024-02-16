import 'package:adminpanel_hardwarepro/View/Widgets/centerd_view.dart';
import 'package:adminpanel_hardwarepro/View/Widgets/navigate_to_previouse.dart';
import 'package:adminpanel_hardwarepro/utils/colors.dart';
import 'package:adminpanel_hardwarepro/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: appBgColor,
      body: CenterdView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "ProductCarePro.",
            style: interStyle(FontWeight.w600, lightGrey, 16),
          ),
          Text(
            "Admin",
            style: interStyle(FontWeight.w600, lightGrey, 16),
          ),
          SizedBox(
            height: height * .08,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: NavigateToPreviouse(
              title: "Home",
            ),
          ),
          SizedBox(
            height: height * .05,
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.all(10),
              height: height * .3,
              width: width * .2,
              decoration: BoxDecoration(
                border: Border.all(width: .5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Your",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: darkGrey),
                    ),
                    const Text(
                      "Profile",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 45, 94, 133)),
                    ),
                    SizedBox(
                      height: height * .02,
                    ),
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: height * .05,
                            backgroundImage:
                                const AssetImage("assets/admnhome.png"),
                          ),
                          Text(
                            "Your Name",
                            style: TextStyle(
                                fontSize: 22.dp,
                                fontWeight: FontWeight.w600,
                                color: darkGrey),
                          ),
                          Text(
                            "Product Pro.",
                            style: TextStyle(
                                fontSize: 15.dp,
                                fontWeight: FontWeight.w600,
                                color: darkGrey),
                          ),
                          Text(
                            "Admin",
                            style: TextStyle(
                                fontSize: 18.dp,
                                fontWeight: FontWeight.w600,
                                color: darkGrey),
                          ),
                        ],
                      ),
                    )
                  ]),
            ),
          )
        ]),
      ),
    );
  }
}
