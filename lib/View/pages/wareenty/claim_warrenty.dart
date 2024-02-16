import 'package:adminpanel_hardwarepro/View/Widgets/navigate_to_previouse.dart';
import 'package:adminpanel_hardwarepro/View/Widgets/tabbar.dart';
import 'package:adminpanel_hardwarepro/utils/colors.dart';
import 'package:adminpanel_hardwarepro/utils/style.dart';
import 'package:flutter/material.dart';

class ClaimWarrentyPage extends StatelessWidget {
  const ClaimWarrentyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: appBgColor,
      body: Column(
        children: [
          Tabbar(),
          SizedBox(
            height: height * .08,
          ),
          NavigateToPreviouse(
            title: "Wrrenty Claims",
          ),
          SizedBox(
            height: height * .05,
          ),
          SizedBox(
            width: width * .8,
            height: height * .7,
            child: ListView.separated(
                itemBuilder: (context, index) => const SizedBox(
                      height: 20,
                    ),
                separatorBuilder: (context, index) => Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(20),
                          width: width * .8,
                          decoration: BoxDecoration(
                            border: Border.all(width: .5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "USER 1",
                                style: poppinsStyle(FontWeight.w600, balck, 22),
                              ),
                              roww("Product name", "product"),
                              roww("Order no", "123"),
                              roww("Serial no", "123"),
                              roww("Warrenty no", "1234")
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: darkRed),
                              onPressed: () {},
                              child: Text(
                                "Review",
                                style: poppinsStyle(FontWeight.w500, white, 15),
                              )),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                itemCount: 7),
          )
        ],
      ),
    );
  }

  Text roww(String productName, String product) {
    return Text(
      "$productName :   ${product.toUpperCase()} ",
      style: poppinsStyle(FontWeight.normal, darkGrey, 18),
    );
  }
}
