import 'package:adminpanel_hardwarepro/View/Widgets/navigate_to_previouse.dart';
import 'package:adminpanel_hardwarepro/View/Widgets/tabbar.dart';
import 'package:adminpanel_hardwarepro/View/pages/orders/cancelled_order.dart';
import 'package:adminpanel_hardwarepro/View/pages/orders/completed_order.dart';
import 'package:adminpanel_hardwarepro/utils/colors.dart';
import 'package:adminpanel_hardwarepro/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderPage extends StatelessWidget {
  OrderPage({super.key});

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
          Column(
            // mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: NavigateToPreviouse(
                  title: "Orders",
                  isEnableButton: true,
                  additionalButtonTitle: "Completed",
                  page: const CompletedOrderpage(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 100),
                child: SizedBox(
                  height: 50,
                  width: 300,
                  child: OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const CancelledOrderPage()));
                      },
                      child: ListTile(
                        title: Text(
                          "Cancelled",
                          style: poppinsStyle(FontWeight.w400, balck, 18),
                        ),
                        trailing: const Icon(
                          Icons.arrow_right_alt_outlined,
                          color: balck,
                          size: 40,
                        ),
                      )),
                ),
              )
            ],
          ),
          SizedBox(
            height: height * .05,
          ),
          SizedBox(
            width: width * .5,
            height: height * .6,
            child: ListView.separated(
                itemBuilder: (context, index) => Column(
                      children: [
                        Container(
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
                                    style: poppinsStyle(
                                        FontWeight.w600, balck, 20),
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
                                      style: poppinsStyle(
                                          FontWeight.w600, balck, 18),
                                    ),
                                    subtitle: Text(
                                      "₹ 12345",
                                      style: poppinsStyle(
                                          FontWeight.w500, balck, 18),
                                    ),
                                    trailing: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Text(
                                        "Qty:1",
                                        style: GoogleFonts.poppins(
                                            backgroundColor: white,
                                            color: darkRed,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    )),
                              ],
                            )),
                        SizedBox(
                          height: height * .02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // Expanded(child: SizedBox()),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: darkGreen),
                                onPressed: () {},
                                child: Text(
                                  "Approve",
                                  style:
                                      poppinsStyle(FontWeight.w500, white, 15),
                                )),
                            const SizedBox(
                              width: 20,
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: darkRed),
                                onPressed: () {},
                                child: Text(
                                  "Reject",
                                  style:
                                      poppinsStyle(FontWeight.w500, white, 15),
                                )),
                          ],
                        ),
                      ],
                    ),
                separatorBuilder: (context, index) =>
                    SizedBox(height: height * .05),
                itemCount: 3),
          )
        ],
      ),
    );
  }
}
