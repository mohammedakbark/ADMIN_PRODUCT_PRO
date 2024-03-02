import 'package:adminpanel_hardwarepro/Model/notification-model.dart';
import 'package:adminpanel_hardwarepro/View/Widgets/navigate_to_previouse.dart';
import 'package:adminpanel_hardwarepro/View/Widgets/show_message.dart';
import 'package:adminpanel_hardwarepro/View/Widgets/tabbar.dart';
import 'package:adminpanel_hardwarepro/ViewModel/firebasedatabase.dart';
import 'package:adminpanel_hardwarepro/utils/colors.dart';
import 'package:adminpanel_hardwarepro/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ManageComplaints extends StatelessWidget {
  ManageComplaints({super.key});
  String time = DateFormat('h:mm a').format(DateTime.now());
  String date = DateFormat("dd/m/yyyy").format(DateTime.now());

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
          Consumer<FirebaseDatabase>(builder: (context, fireb, child) {
            return FutureBuilder(
                future: fireb.fetchAllComplaints(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return showIndicator();
                  }
                  return SizedBox(
                    width: width * .8,
                    height: height * .7,
                    child: fireb.complaintList.isEmpty
                        ? const Center(
                            child: Text("No Complaints"),
                          )
                        : ListView.separated(
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  height: 20,
                                ),
                            itemBuilder: (context, index) {
                              final data = fireb.complaintList[index];
                              return Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(width: .5),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        FutureBuilder(
                                            future: fireb.fetchSelectedUSerName(
                                                data.uid),
                                            builder: (context, snapshot) {
                                              return ListTile(
                                                leading: Text(
                                                  fireb.userName.toUpperCase(),
                                                  style: poppinsStyle(
                                                      FontWeight.w600,
                                                      darkRed,
                                                      18),
                                                ),
                                              );
                                            }),
                                        ListTile(
                                          minLeadingWidth: 100,
                                          leading: Text(
                                            "Complaint",
                                            style: poppinsStyle(
                                                FontWeight.w600, balck, 15),
                                          ),
                                          title: Container(
                                            padding: EdgeInsets.only(left: 6),
                                            decoration: BoxDecoration(
                                              border: Border.all(width: .5),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Text(
                                              data.complaint,
                                              style: poppinsStyle(
                                                  FontWeight.w500,
                                                  const Color.fromARGB(
                                                      255, 90, 90, 90),
                                                  15),
                                            ),
                                          ),
                                        ),
                                        ListTile(
                                          minLeadingWidth: 100,
                                          leading: Text(
                                            "Description",
                                            style: poppinsStyle(
                                                FontWeight.w600, balck, 15),
                                          ),
                                          title: Container(
                                            padding: EdgeInsets.only(left: 6),
                                            decoration: BoxDecoration(
                                              border: Border.all(width: .5),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Text(
                                              data.description,
                                              style: poppinsStyle(
                                                  FontWeight.w500,
                                                  const Color.fromARGB(
                                                      255, 90, 90, 90),
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
                                                  data.complaintStatus ==
                                                          "ONGOING"
                                                      ? darkGrey
                                                      : const Color.fromARGB(
                                                          255, 4, 0, 211)),
                                          onPressed: () {
                                            if (data.complaintStatus !=
                                                "ONGOING") {
                                              fireb.updateComplaintStatus(
                                                  data.complaintId,
                                                  "ONGOING",
                                                  data.uid,
                                                  NotificationModel(
                                                      notification:
                                                          "Your Complaint about ${data.productName} is reviewd.our team will contact you",
                                                      date: date,
                                                      time: time));
                                            }
                                          },
                                          child: Text(
                                            data.complaintStatus == "ONGOING"
                                                ? "Reviewd"
                                                : "Review",
                                            style: poppinsStyle(
                                                FontWeight.w500, white, 15),
                                          )),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  const Color.fromARGB(
                                                      255, 97, 96, 96)),
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) => AlertDialog(
                                                  title: Text(
                                                    "Contact Details",
                                                    style: poppinsStyle(
                                                        FontWeight.w500,
                                                        lightGrey,
                                                        20),
                                                  ),
                                                  content: SizedBox(
                                                    height: height * .1,
                                                    width: width * .15,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Email Address: ${fireb.email}",
                                                          style: poppinsStyle(
                                                              FontWeight.w500,
                                                              balck,
                                                              15),
                                                        ),
                                                        Text(
                                                          "Contact No: +91 ${data.contactNumber}",
                                                          style: poppinsStyle(
                                                              FontWeight.w500,
                                                              balck,
                                                              15),
                                                        )
                                                      ],
                                                    ),
                                                  )),
                                            );
                                          },
                                          child: Text(
                                            "Contact",
                                            style: poppinsStyle(
                                                FontWeight.w500, white, 15),
                                          )),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ],
                              );
                            },
                            itemCount: fireb.complaintList.length),
                  );
                });
          })
        ],
      ),
    );
  }
}
