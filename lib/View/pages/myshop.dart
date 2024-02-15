import 'package:adminpanel_hardwarepro/View/Widgets/navigate_to_previouse.dart';
import 'package:adminpanel_hardwarepro/View/Widgets/tabbar.dart';
import 'package:flutter/material.dart';

class MyshopPage extends StatelessWidget {
  const MyshopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          const Tabbar(),
          SizedBox(
            height: height * .08,
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: NavigateToPreviouse(title: "My Shop")),
          SizedBox(
            height: height * .05,
          ),
        ],
      ),
    );
  }
}
