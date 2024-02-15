import 'package:adminpanel_hardwarepro/View/Widgets/navigate_to_previouse.dart';
import 'package:adminpanel_hardwarepro/View/Widgets/tabbar.dart';
import 'package:adminpanel_hardwarepro/utils/colors.dart';
import 'package:adminpanel_hardwarepro/utils/style.dart';
import 'package:flutter/material.dart';

class ManageUser extends StatelessWidget {
  const ManageUser({super.key});

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
              child: NavigateToPreviouse(title: "Manage Users")),
          SizedBox(
            height: height * .05,
          ),
          SizedBox(
              width: width * .8,
              height: height * .5,
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
                itemCount: 100,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: .5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            "USER",
                            style: poppinsStyle(FontWeight.w600, balck, 15),
                          ),
                        ),
                        const Expanded(
                          child: SizedBox(
                            width: 50,
                          ),
                        ),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.delete))
                      ],
                    ),
                  );
                },
              ))
        ],
      ),
    );
  }
}
