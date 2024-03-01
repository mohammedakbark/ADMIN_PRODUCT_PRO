import 'package:adminpanel_hardwarepro/Model/notification-model.dart';
import 'package:adminpanel_hardwarepro/View/Widgets/navigate_to_previouse.dart';
import 'package:adminpanel_hardwarepro/View/Widgets/show_message.dart';
import 'package:adminpanel_hardwarepro/View/Widgets/tabbar.dart';
import 'package:adminpanel_hardwarepro/View/pages/wareenty/claim_warrenty.dart';
import 'package:adminpanel_hardwarepro/ViewModel/firebasedatabase.dart';
import 'package:adminpanel_hardwarepro/utils/colors.dart';
import 'package:adminpanel_hardwarepro/utils/objects.dart';
import 'package:adminpanel_hardwarepro/utils/style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ManageWarrenty extends StatelessWidget {
  ManageWarrenty({super.key});
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
          NavigateToPreviouse(
            title: "Manage Warrenty",
            isEnableButton: true,
            additionalButtonTitle: "Warrenty Claims",
            page:  ClaimWarrentyPage(),
          ),
          SizedBox(
            height: height * .05,
          ),
          Consumer<FirebaseDatabase>(builder: (context, fire, child) {
            return FutureBuilder(
                future: fire.fetchAllWarrenty(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return showIndicator();
                  }
                  final list = fire.warrentyList;

                  // print(fire.warrentyList.length);
                  // print("6789${fire.warrentyList[0].email}");
                  return SizedBox(
                    width: width * .8,
                    height: height * .7,
                    child: list.isEmpty
                        ? const Center(
                            child: Text("No pending warrenty. "),
                          )
                        : ListView.separated(
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  height: 20,
                                ),
                            itemBuilder: (context, index) {
                              // final data = list[index];
                              // print(data.name);
                              // print("jhvjh");
                              return Column(
                                children: [
                                  Container(
                                      padding: const EdgeInsets.all(20),
                                      width: width * .8,
                                      decoration: BoxDecoration(
                                        border: Border.all(width: .5),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                list[index].name.toUpperCase(),
                                                style: poppinsStyle(
                                                    FontWeight.w600,
                                                    darkRed,
                                                    22),
                                              ),
                                              Text(
                                                "Product Name",
                                                style: poppinsStyle(
                                                    FontWeight.w600, balck, 18),
                                              ),
                                              Container(
                                                padding: const EdgeInsets.only(
                                                    left: 6),
                                                width: width * .4,
                                                decoration: BoxDecoration(
                                                  border: Border.all(width: .5),
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: Text(
                                                  list[index].product,
                                                  style: poppinsStyle(
                                                      FontWeight.w500,
                                                      const Color.fromARGB(
                                                          255, 90, 90, 90),
                                                      15),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "Product Id",
                                                style: poppinsStyle(
                                                    FontWeight.w600, balck, 18),
                                              ),
                                              Container(
                                                padding: const EdgeInsets.only(
                                                    left: 6),
                                                width: width * .4,
                                                decoration: BoxDecoration(
                                                  border: Border.all(width: .5),
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: Text(
                                                  list[index].productid,
                                                  style: poppinsStyle(
                                                      FontWeight.w500,
                                                      const Color.fromARGB(
                                                          255, 90, 90, 90),
                                                      15),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "Order No",
                                                style: poppinsStyle(
                                                    FontWeight.w600, balck, 18),
                                              ),
                                              Container(
                                                padding: const EdgeInsets.only(
                                                    left: 6),
                                                width: width * .4,
                                                decoration: BoxDecoration(
                                                  border: Border.all(width: .5),
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: Text(
                                                  list[index].orderId,
                                                  style: poppinsStyle(
                                                      FontWeight.w500,
                                                      const Color.fromARGB(
                                                          255, 90, 90, 90),
                                                      15),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Expanded(
                                              flex: 2, child: SizedBox()),
                                          FutureBuilder(
                                              future: fire
                                                  .fetchSelectedProductImage(
                                                      list[index].productid),
                                              builder: (context, snapshot) {
                                                return SizedBox(
                                                  width: width * .1,
                                                  height: height * .15,
                                                  child:
                                                      snapshot.connectionState ==
                                                              ConnectionState
                                                                  .waiting
                                                          ? showIndicator()
                                                          : Image.network(
                                                              fire.proImage,
                                                              fit: BoxFit.fill,
                                                            ),
                                                );
                                              }),
                                          const Expanded(
                                              flex: 2, child: SizedBox()),
                                        ],
                                      )),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  list[index].warrentyStatus != "PENDING"
                                      ? Container(
                                          alignment: Alignment.center,
                                          width: width * .05,
                                          height: height * .03,
                                          decoration: BoxDecoration(
                                              color: warrentyStatusColor(
                                                  list[index].warrentyStatus),
                                              borderRadius:
                                                  BorderRadius.circular(7)),
                                          child: Text(
                                            list[index].warrentyStatus,
                                            style: poppinsStyle(
                                                FontWeight.w500, white, 15),
                                          ))
                                      : Row(
                                          children: [
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor: darkRed),
                                                onPressed: () {
                                                  fire.updateWarrentyStatus(
                                                      list[index].warrentyId,
                                                      "REJECTED",
                                                      list[index].uid,
                                                      NotificationModel(
                                                          notification:
                                                              "[Warrenty No. ${list[index].warrentyId}]\nYour request for warrenty registration is rejected by some reason",
                                                          date: date,
                                                          time: time));
                                                },
                                                child: Text(
                                                  "Reject",
                                                  style: poppinsStyle(
                                                      FontWeight.w500,
                                                      white,
                                                      15),
                                                )),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor: darkGreen),
                                                onPressed: () {
                                                  fire.updateWarrentyStatus(
                                                      list[index].warrentyId,
                                                      "APPROVED",
                                                      list[index].uid,
                                                      NotificationModel(
                                                          notification:
                                                              "[Warrenty No. ${list[index].warrentyId}]\nYour request for warrenty registration is approved",
                                                          date: date,
                                                          time: time));
                                                },
                                                child: Text(
                                                  "Approve",
                                                  style: poppinsStyle(
                                                      FontWeight.w500,
                                                      white,
                                                      15),
                                                )),
                                            const Expanded(child: SizedBox()),
                                          ],
                                        ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ],
                              );
                            },
                            itemCount: list.length),
                  );
                });
          })
        ],
      ),
    );
  }
}
