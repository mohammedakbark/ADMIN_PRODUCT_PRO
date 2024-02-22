import 'package:adminpanel_hardwarepro/View/Widgets/navigate_to_previouse.dart';
import 'package:adminpanel_hardwarepro/View/Widgets/show_message.dart';
import 'package:adminpanel_hardwarepro/View/Widgets/tabbar.dart';
import 'package:adminpanel_hardwarepro/View/pages/products/add_product.dart';
import 'package:adminpanel_hardwarepro/ViewModel/firebasedatabase.dart';
import 'package:adminpanel_hardwarepro/utils/colors.dart';
import 'package:adminpanel_hardwarepro/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
              page: AddProductPage(),
            ),
          ),
          SizedBox(
            height: height * .05,
          ),
          Consumer<FirebaseDatabase>(builder: (context, store, child) {
            return FutureBuilder(
                future: store.fetchAllProduct(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return showIndicator();
                  }
                  final data = store.productList;
                  return data.isEmpty
                      ? const Center(
                          child: Text("Add product..."),
                        )
                      : SizedBox(
                          width: width * .5,
                          height: height * .7,
                          child: ListView.separated(
                              itemBuilder: (context, index) => Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(width: .5),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: ListTile(
                                    leading: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          image: DecorationImage(
                                              scale: 2,
                                              image: NetworkImage(
                                                  data[index].productImage))),
                                      height: height * .3,
                                      width: 100,
                                    ),
                                    title: Text(
                                      data[index].productName.toUpperCase(),
                                      style: poppinsStyle(
                                          FontWeight.w600, balck, 18),
                                    ),
                                    subtitle: Text(
                                      "₹ ${data[index].price}",
                                      style: poppinsStyle(
                                          FontWeight.w500, balck, 18),
                                    ),
                                    trailing: IconButton(
                                        onPressed: () {
                                          store.deleteSelectedProduct(
                                              data[index].productId);
                                        },
                                        icon: const Icon(Icons.delete)),
                                  )),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                    height: 20,
                                  ),
                              itemCount: data.length),
                        );
                });
          })
        ],
      ),
    );
  }
}
