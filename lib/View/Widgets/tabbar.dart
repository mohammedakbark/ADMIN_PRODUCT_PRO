import 'package:adminpanel_hardwarepro/View/Widgets/centerd_view.dart';
import 'package:adminpanel_hardwarepro/View/homepage.dart';
import 'package:adminpanel_hardwarepro/View/profile.dart';
import 'package:adminpanel_hardwarepro/utils/colors.dart';
import 'package:adminpanel_hardwarepro/utils/objects.dart';
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
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                        (route) => false);
                  },
                  icon: const Icon(
                    Icons.home_filled,
                    size: 30,
                  )),
              Text("|", style: interStyle(FontWeight.normal, lightGrey, 20)),
              SizedBox(
                width: width * .1,
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ProfilePage()));
                  },
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
                  onTap: () {
                   showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            actionsAlignment: MainAxisAlignment.spaceEvenly,
                            title: const Center(child: Text("Signout..?")),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    "No",
                                    style: TextStyle(color: Colors.red),
                                  )),
                              TextButton(
                                  onPressed: () {
                                  
                                    auth
                                        .signOutFromMAil(context);
                                  },
                                  child: const Text(
                                    "Yes",
                                    style: TextStyle(color: Colors.green),
                                  ))
                            ],
                          );
                        },
                      );
                  },
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
