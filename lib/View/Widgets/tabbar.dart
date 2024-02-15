import 'package:adminpanel_hardwarepro/View/Widgets/centerd_view.dart';
import 'package:adminpanel_hardwarepro/utils/colors.dart';
import 'package:adminpanel_hardwarepro/utils/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tabbar extends StatelessWidget {
  const Tabbar({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return CenterdView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "ProductCarePro.",
                style: interStyle(FontWeight.w600, lightGrey, 20),
              ),
              Text(
                "Admin",
                style: interStyle(FontWeight.w600, lightGrey, 20),
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.home_filled,
                    size: 30,
                  )),
              Text("|", style: interStyle(FontWeight.normal, lightGrey, 20)),
              SizedBox(
                width: width * .1,
                child: ListTile(
                  leading: const Icon(
                    CupertinoIcons.person_alt_circle_fill,
                    size: 30,
                  ),
                  title: Text(
                    "Account",
                    style: interStyle(FontWeight.w700, lightGrey, 20),
                  ),
                ),
              ),
              Text("|", style: interStyle(FontWeight.normal, lightGrey, 20)),
              SizedBox(
                width: width * .1,
                child: ListTile(
                  leading: const Icon(
                    Icons.login_outlined,
                    size: 30,
                  ),
                  title: Text(
                    "Logout",
                    style: interStyle(FontWeight.w700, lightGrey, 20),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
