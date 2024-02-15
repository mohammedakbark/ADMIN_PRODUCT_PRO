import 'package:adminpanel_hardwarepro/View/Widgets/centerd_view.dart';
import 'package:adminpanel_hardwarepro/View/pages/manage_complaints.dart';
import 'package:adminpanel_hardwarepro/View/pages/manage_user.dart';
import 'package:adminpanel_hardwarepro/View/pages/myshop.dart';
import 'package:adminpanel_hardwarepro/View/pages/orders/order.dart';
import 'package:adminpanel_hardwarepro/View/pages/products/product.dart';
import 'package:adminpanel_hardwarepro/View/pages/wareenty/manage_warrenty.dart';
import 'package:adminpanel_hardwarepro/utils/colors.dart';
import 'package:adminpanel_hardwarepro/utils/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  List<String> menuTitle = [
    "manage user",
    "manage complaints",
    "manage warrenty",
    "product",
    "orders",
    "my shop"
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: appBgColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CenterdView(
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
                    Text("|",
                        style: interStyle(FontWeight.normal, lightGrey, 20)),
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
          ),
          SizedBox(
            height: height * .1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  height: height * .50,
                  width: width * .45,
                  padding:
                      EdgeInsets.only(left: width * .03, right: width * .03),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(49, 255, 255, 255),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.elliptical(400, 300),
                        bottomRight: Radius.elliptical(400, 300)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const ManageUser()));
                              },
                              child: menuItem(menuTitle[0], context)),
                          const SizedBox(
                            width: 20,
                          ),
                          InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const ManageComplaints()));
                              },
                              child: menuItem(menuTitle[1], context)),
                          const SizedBox(
                            width: 20,
                          ),
                          InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const ManageWarrenty()));
                              },
                              child: menuItem(menuTitle[2], context))
                        ],
                      ),
                      SizedBox(
                        height: height * .05,
                      ),
                      Row(
                        children: [
                          InkWell(
                              onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const ProductPage()));
                              },
                              child: menuItem(menuTitle[3], context)),
                          const SizedBox(
                            width: 20,
                          ),
                          InkWell(
                              onTap: () {
                                 Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const OrderPage()));
                              },
                              child: menuItem(menuTitle[4], context)),
                          const SizedBox(
                            width: 20,
                          ),
                          InkWell(
                              onTap: () {
                                 Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const MyshopPage()));
                              },
                              child: menuItem(menuTitle[5], context))
                        ],
                      )
                    ],
                  )),
              Expanded(
                child: SizedBox(
                  child: Container(
                    height: height * .45,
                    width: width * .25,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/admnhome.png"))),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget menuItem(String title, context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: height * .15,
      width: width * .09,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          borderRadius: BorderRadiusDirectional.all(Radius.circular(10)),
          color: Color.fromARGB(255, 26, 22, 132)),
      child: Center(
        child: Text(
          title,
          style: poppinsStyle(FontWeight.w500, white, 16),
        ),
      ),
    );
  }
}
