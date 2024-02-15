import 'package:adminpanel_hardwarepro/View/Widgets/navigate_to_previouse.dart';
import 'package:adminpanel_hardwarepro/View/Widgets/tabbar.dart';
import 'package:adminpanel_hardwarepro/View/pages/products/add_product.dart';
import 'package:adminpanel_hardwarepro/utils/colors.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

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
              title: "Products",
              isEnableButton: true,
              additionalButtonTitle: "Add Products",
              page:  AddProductPage(),
            ),
          ),
          SizedBox(
            height: height * .05,
          ),
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
          )
        ],
      ),
    );
  }
}
