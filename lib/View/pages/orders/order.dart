import 'package:adminpanel_hardwarepro/View/Widgets/navigate_to_previouse.dart';
import 'package:adminpanel_hardwarepro/View/Widgets/tabbar.dart';
import 'package:adminpanel_hardwarepro/View/pages/orders/cancelled_order.dart';
import 'package:adminpanel_hardwarepro/View/pages/orders/completed_order.dart';
import 'package:adminpanel_hardwarepro/utils/colors.dart';
import 'package:adminpanel_hardwarepro/utils/style.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          const Tabbar(),
          SizedBox(
            height: height * .08,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: NavigateToPreviouse(
                title: "Orders",
                isEnableButton: true,
                additionalButtonTitle: "Completed",page:const CompletedOrderpage(),),
                
          ),
          SizedBox(
            height: height * .05,
          ),
          Row(
            children: [
              SizedBox(
                width: width * .5,
                height: height * .6,
                child: ListView.separated(
                    itemBuilder: (context, index) => Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: .5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          leading: Container(
                            color: Colors.red,
                            height: height * .3,
                            width: 100,
                          ),
                          title: Text("CUFF EALTH "),
                          subtitle: Text("₹ 12345"),
                          trailing: IconButton(
                              onPressed: () {}, icon: Icon(Icons.delete)),
                        )),
                    separatorBuilder: (context, index) => SizedBox(
                          height: 20,
                        ),
                    itemCount: 3),
              ),
              SizedBox(
                height: 50,
                width: 300,
                child: OutlinedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) =>const CancelledOrderPage()));
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
              )
            ],
          )
        ],
      ),
    );
  }
}
