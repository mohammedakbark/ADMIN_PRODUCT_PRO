import 'package:adminpanel_hardwarepro/View/Widgets/navigate_to_previouse.dart';
import 'package:adminpanel_hardwarepro/View/Widgets/show_message.dart';
import 'package:adminpanel_hardwarepro/View/Widgets/tabbar.dart';
import 'package:adminpanel_hardwarepro/ViewModel/firebasedatabase.dart';
import 'package:adminpanel_hardwarepro/utils/colors.dart';
import 'package:adminpanel_hardwarepro/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CancelledOrderPage extends StatelessWidget {
  const CancelledOrderPage({super.key});

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
            child: NavigateToPreviouse(
              title: "Cancelled Orders",
            ),
          ),
          SizedBox(
            height: height * .05,
          ),
          Consumer<FirebaseDatabase>(builder: (context, fire, child) {
            return FutureBuilder(
                future: fire.fetchOrders("REJECTED"),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return showIndicator();
                  }
                  final data = fire.orderList;
                  return SizedBox(
                    width: width * .5,
                    height: height * .7,
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
                                    padding: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.green)),
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
                                                          subtitle: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                "₹ ${singlcart.productModel.productName}",
                                                                style: poppinsStyle(
                                                                    FontWeight
                                                                        .w500,
                                                                    balck,
                                                                    18),
                                                              ),
                                                              Text(
                                                                "Qty:${singlcart.quantity}",
                                                                style: poppinsStyle(
                                                                    FontWeight
                                                                        .w500,
                                                                    balck,
                                                                    18),
                                                              ),
                                                            ],
                                                          ),
                                                          trailing: Container(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    5),
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                      width:
                                                                          .5),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                            child: Text(
                                                              "Cancelled",
                                                              style:
                                                                  poppinsStyle(
                                                                      FontWeight
                                                                          .w400,
                                                                      balck,
                                                                      16),
                                                            ),
                                                          )),
                                                    ],
                                                  )),
                                              SizedBox(
                                                height: height * .02,
                                              ),
                                            ],
                                          );
                                        }),
                                  ),
                                ],
                              );
                              
                            },
                            separatorBuilder: (context, index) =>
                                SizedBox(height: height * .05),
                            itemCount: data.length),
                  );
                });
          })
        ],
      ),
    );
  }
}
