import 'package:adminpanel_hardwarepro/View/Widgets/navigate_to_previouse.dart';
import 'package:adminpanel_hardwarepro/View/Widgets/tabbar.dart';
import 'package:adminpanel_hardwarepro/utils/colors.dart';
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
        ],
      ),
    );
  }
}
