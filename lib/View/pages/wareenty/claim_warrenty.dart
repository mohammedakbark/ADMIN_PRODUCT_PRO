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

class ClaimWarrentyPage extends StatelessWidget {
  ClaimWarrentyPage({super.key});
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
            title: "Wrrenty Claims",
          ),
          SizedBox(
            height: height * .05,
          ),
          Consumer<FirebaseDatabase>(builder: (context, fire, child) {
            return FutureBuilder(
                future: fire.fetchClaimedWarrentyforConfirm(),
                builder: (context, snaoshot) {
                  if (snaoshot.connectionState == ConnectionState.waiting) {
                    return showIndicator();
                  }

                  return SizedBox(
                    width: width * .8,
                    height: height * .7,
                    child: ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 20,
                            ),
                        itemBuilder: (context, index) {
                          final data = fire.claimedWarrentyList[index];
                          return Column(
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
                                      data.name,
                                      style: poppinsStyle(
                                          FontWeight.w600, balck, 22),
                                    ),
                                    roww("Product name",
                                        data.product.toUpperCase()),
                                    roww("Order no", data.orderId),
                                    roww("Serial no", data.srialnumber),
                                    roww("Warrenty no", data.warrentyId!),
                                    Align(
                                        alignment: Alignment.bottomRight,
                                        child: claimStatusText(
                                            data.claimStatus, data.productid))
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              data.claimStatus == "REQUESTED"
                                  ? Align(
                                      alignment: Alignment.centerRight,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: darkRed),
                                          onPressed: () {
                                            fire.updateClaimStatus(
                                                data.warrentyId,
                                                "ONGOING",
                                                data.uid,
                                                NotificationModel(
                                                    notification:
                                                        "Your warrenty request (Warrenty Id : ${data.warrentyId}) is reviwed .We will connect you shortly ",
                                                    date: date,
                                                    time: time));
                                          },
                                          child: Text(
                                            "Review",
                                            style: poppinsStyle(
                                                FontWeight.w500, white, 15),
                                          )),
                                    )
                                  : const SizedBox(),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          );
                        },
                        itemCount: fire.claimedWarrentyList.length),
                  );
                });
          })
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

  Column claimStatusText(claimStatus, confirmationId) {
    switch (claimStatus) {
      case "ONGOING":
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "Ongoing",
              style: poppinsStyle(FontWeight.normal,
                  const Color.fromARGB(255, 189, 142, 0), 18),
            ),
            Text('(Confirmation Id: $confirmationId )')
          ],
        );
      case "CLAIMED":
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "Claimed",
              style: poppinsStyle(
                  FontWeight.normal, const Color.fromARGB(255, 0, 148, 5), 18),
            ),
            Text("(Confirmation Id:$confirmationId )")
          ],
        );
      default:
        return const Column();
    }
  }
}
