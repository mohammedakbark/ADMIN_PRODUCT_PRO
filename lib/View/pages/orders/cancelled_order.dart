import 'package:adminpanel_hardwarepro/View/Widgets/navigate_to_previouse.dart';
import 'package:adminpanel_hardwarepro/View/Widgets/tabbar.dart';
import 'package:adminpanel_hardwarepro/utils/colors.dart';
import 'package:adminpanel_hardwarepro/utils/style.dart';
import 'package:flutter/material.dart';

class CancelledOrderPage extends StatelessWidget {
  const CancelledOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: appBgColor,
      body: Column(
        children: [
          const Tabbar(),
          SizedBox(
            height: height * .08,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: NavigateToPreviouse(
              title: "Cancelled Orders",
            ),
          ),
          SizedBox(
            height: height * .05,
          ),
          SizedBox(
            width: width * .5,
            height: height * .7,
            child: ListView.separated(
                itemBuilder: (context, index) => Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: .5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          title: Text(
                            "USER 1",
                            style: poppinsStyle(FontWeight.w600, balck, 20),
                          ),
                        ),
                        ListTile(
                            leading: Container(
                              color: Colors.red,
                              height: height * .3,
                              width: 100,
                            ),
                            title: Text(
                              "CUFF EALTH ",
                              style: poppinsStyle(FontWeight.w600, balck, 18),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "₹ 12345",
                                  style:
                                      poppinsStyle(FontWeight.w500, balck, 18),
                                ),
                                Text(
                                  "Qty:1",
                                  style:
                                      poppinsStyle(FontWeight.w500, balck, 18),
                                ),
                              ],
                            ),
                            trailing: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                border: Border.all(width: .5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                "Cancelled",
                                style: poppinsStyle(FontWeight.w400, balck, 16),
                              ),
                            )),
                      ],
                    )),
                separatorBuilder: (context, index) =>
                    SizedBox(height: height * .05),
                itemCount: 3),
          )
        ],
      ),
    );
  }
}
