import 'package:adminpanel_hardwarepro/View/Widgets/navigate_to_previouse.dart';
import 'package:adminpanel_hardwarepro/View/Widgets/tabbar.dart';
import 'package:adminpanel_hardwarepro/utils/colors.dart';
import 'package:adminpanel_hardwarepro/utils/style.dart';
import 'package:flutter/material.dart';

class ManageComplaints extends StatelessWidget {
  const ManageComplaints({super.key});

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
              child: NavigateToPreviouse(title: "Manage Complaints")),
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
                          decoration: BoxDecoration(
                            border: Border.all(width: .5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                leading: Text(
                                  "USER 1",
                                  style: poppinsStyle(
                                      FontWeight.w600, darkRed, 18),
                                ),
                              ),
                              ListTile(
                                minLeadingWidth: 100,
                                leading: Text(
                                  "Complaint",
                                  style:
                                      poppinsStyle(FontWeight.w600, balck, 15),
                                ),
                                title: Container(
                                  padding: EdgeInsets.only(left: 6),
                                  decoration: BoxDecoration(
                                    border: Border.all(width: .5),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text(
                                    " complaintdjhcbakjcbn",
                                    style: poppinsStyle(
                                        FontWeight.w500,
                                        const Color.fromARGB(255, 90, 90, 90),
                                        15),
                                  ),
                                ),
                              ),
                              ListTile(
                                minLeadingWidth: 100,
                                leading: Text(
                                  "Description",
                                  style:
                                      poppinsStyle(FontWeight.w600, balck, 15),
                                ),
                                title: Container(
                                  padding: EdgeInsets.only(left: 6),
                                  decoration: BoxDecoration(
                                    border: Border.all(width: .5),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text(
                                    " description",
                                    style: poppinsStyle(
                                        FontWeight.w500,
                                        const Color.fromARGB(255, 90, 90, 90),
                                        15),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(child: SizedBox()),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 4, 0, 211)),
                                onPressed: () {},
                                child: Text(
                                  "Review",
                                  style:
                                      poppinsStyle(FontWeight.w500, white, 15),
                                )),
                            const SizedBox(
                              width: 20,
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 97, 96, 96)),
                                onPressed: () {},
                                child: Text(
                                  "Contact",
                                  style:
                                      poppinsStyle(FontWeight.w500, white, 15),
                                )),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                itemCount: 8),
          )
        ],
      ),
    );
  }
}
