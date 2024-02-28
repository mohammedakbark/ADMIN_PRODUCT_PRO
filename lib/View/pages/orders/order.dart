import 'package:adminpanel_hardwarepro/View/Widgets/navigate_to_previouse.dart';
import 'package:adminpanel_hardwarepro/View/Widgets/show_message.dart';
import 'package:adminpanel_hardwarepro/View/Widgets/tabbar.dart';
import 'package:adminpanel_hardwarepro/View/pages/orders/cancelled_order.dart';
import 'package:adminpanel_hardwarepro/View/pages/orders/completed_order.dart';
import 'package:adminpanel_hardwarepro/ViewModel/firebasedatabase.dart';
import 'package:adminpanel_hardwarepro/utils/colors.dart';
import 'package:adminpanel_hardwarepro/utils/style.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
          Consumer<FirebaseDatabase>(builder: (context, fire, child) {
            return FutureBuilder(
                future: fire.fetchOrders("PENDING"),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return showIndicator();
                  }
                  final data = fire.orderList;
                  return SizedBox(
                    width: width * .5,
                    height: height * .6,
                    child: data.isEmpty
                        ? const Center(
                            child: Text("No order found"),
                          )
                        : ListView.separated(
                            itemBuilder: (context, indexOrder) {
                              final user = data[indexOrder].userAddressModel;
                              final cartList = data[indexOrder].cartModel;

                              final address =
                                  "${user.address}\n${user.area}${user.city}${user.state}\nPin :${user.pincode}\nPhone Number:${user.phoneNumber}";

                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListTile(
                                    title: Text(
                                      user.name.toUpperCase(),
                                      style: poppinsStyle(
                                          FontWeight.w600, balck, 20),
                                    ),
                                  ),
                                  Text(
                                      "Order Id :${data[indexOrder].orderId?.substring(data[indexOrder].orderId!.length - 8)}"),
                                  Text(
                                      "Payement mode :${data[indexOrder].paymentMode}"),
                                  Text("Address :${address}"),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                          "Order date :${data[indexOrder].date.substring(0, 10)}"),
                                      Text(
                                          "Total amount :${data[indexOrder].totalAmount}"),
                                    ],
                                  ),
                                  Container(
                                    color: const Color.fromARGB(
                                        255, 255, 241, 197),
                                    height: height * .2,
                                    width: width * .5,
                                    child: ListView.separated(
                                        separatorBuilder: (context, index) =>
                                            const SizedBox(
                                              height: 20,
                                            ),
                                        itemCount: cartList.length,
                                        itemBuilder: (context, indexcart) {
                                          final singlcart = cartList[indexcart];
                                          return Column(
                                            children: [
                                              Container(
                                                  decoration: BoxDecoration(
                                                    border:
                                                        Border.all(width: .5),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      ListTile(
                                                          leading: SizedBox(
                                                            // height: height * .3,
                                                            width: 100,
                                                            child: Image.network(
                                                                singlcart
                                                                    .productModel
                                                                    .productImage),
                                                          ),
                                                          title: Text(
                                                            singlcart
                                                                .productModel
                                                                .productName
                                                                .toUpperCase(),
                                                            style: poppinsStyle(
                                                                FontWeight.w600,
                                                                balck,
                                                                18),
                                                          ),
                                                          subtitle: Text(
                                                            "₹ ${singlcart.productModel.productName}",
                                                            style: poppinsStyle(
                                                                FontWeight.w500,
                                                                balck,
                                                                18),
                                                          ),
                                                          trailing: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                            child: Text(
                                                              "Qty:${singlcart.quantity}",
                                                              style: GoogleFonts.poppins(
                                                                  backgroundColor:
                                                                      white,
                                                                  color:
                                                                      darkRed,
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                          )),
                                                    ],
                                                  )),
                                              SizedBox(
                                                height: height * .02,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  // Expanded(child: SizedBox()),
                                                  ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                              backgroundColor:
                                                                  darkGreen),
                                                      onPressed: () {
                                                        // fire.updateStatus(
                                                        //     'COMPLETED',
                                                        //     data[indexOrder]
                                                        //         .orderId,
                                                        //     indexcart);
                                                      },
                                                      child: Text(
                                                        "Approve",
                                                        style: poppinsStyle(
                                                            FontWeight.w500,
                                                            white,
                                                            15),
                                                      )),
                                                  const SizedBox(
                                                    width: 20,
                                                  ),
                                                  ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                              backgroundColor:
                                                                  darkRed),
                                                      onPressed: () {
                                                        // fire.updateStatus(
                                                        //     'REJECTED',
                                                        //     data[indexOrder]
                                                        //         .orderId,
                                                        //     indexcart);
                                                      },
                                                      child: Text(
                                                        "Reject",
                                                        style: poppinsStyle(
                                                            FontWeight.w500,
                                                            white,
                                                            15),
                                                      )),
                                                ],
                                              ),
                                            ],
                                          );
                                        }),
                                  ),
                                ],
                              );
                            },
                            separatorBuilder: (context, indexCart) =>
                                const Divider(),
                            itemCount: fire.orderList.length),
                  );
                });
          })
        ],
      ),
    );
  }
}
