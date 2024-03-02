import 'package:adminpanel_hardwarepro/View/Widgets/navigate_to_previouse.dart';
import 'package:adminpanel_hardwarepro/View/Widgets/show_message.dart';
import 'package:adminpanel_hardwarepro/View/Widgets/tabbar.dart';
import 'package:adminpanel_hardwarepro/ViewModel/firebasedatabase.dart';
import 'package:adminpanel_hardwarepro/utils/colors.dart';
import 'package:adminpanel_hardwarepro/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyshopPage extends StatelessWidget {
  MyshopPage({super.key});
  int index = 1;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: appBgColor,
        body: Column(children: [
          const Tabbar(),
          SizedBox(
            height: height * .08,
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: NavigateToPreviouse(title: "My Shop")),
          SizedBox(
            height: height * .05,
          ),
          Consumer<FirebaseDatabase>(builder: (context, firb, child) {
            return FutureBuilder(
                future: firb.fetchAllProduct(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return showIndicator();
                  }
                  return DataTable(
                      border: TableBorder.all(),
                      // showCheckboxColumn: true,
                      // showBottomBorder: true,
                      // decoration: BoxDecoration(border: Border.all()),
                      columns: <DataColumn>[
                        DataColumn(
                            label: Text(
                          'SI.no',
                          style: poppinsStyle(FontWeight.w500, balck, 18),
                        )),
                        DataColumn(
                            label: Text(
                          'Product id',
                          style: poppinsStyle(FontWeight.w500, balck, 18),
                        )),
                        DataColumn(
                            label: Text(
                          'Product name',
                          style: poppinsStyle(FontWeight.w500, balck, 18),
                        )),
                        DataColumn(
                            label: Text(
                          'date',
                          style: poppinsStyle(FontWeight.w500, balck, 18),
                        )),
                        DataColumn(
                            label: Text(
                          'Category',
                          style: poppinsStyle(FontWeight.w500, balck, 18),
                        )),
                        DataColumn(
                            label: Text(
                          'Price',
                          style: poppinsStyle(FontWeight.w500, balck, 18),
                        )),
                      ],
                      rows: firb.productList.map((e) {
                        ;
                        return DataRow(cells: [
                          DataCell(Text(
                            '${index++}',
                            style: poppinsStyle(FontWeight.w400, darkGrey, 16),
                          )),
                          DataCell(Text(
                            e.productId.toString(),
                            style: poppinsStyle(FontWeight.w400, darkGrey, 16),
                          )),
                          DataCell(Text(
                            e.productName.toUpperCase(),
                            style: poppinsStyle(FontWeight.w400, darkGrey, 16),
                          )),
                          DataCell(Text(
                            '-----',
                            style: poppinsStyle(FontWeight.w400, darkGrey, 16),
                          )),
                          DataCell(Text(
                            e.category.toUpperCase(),
                            style: poppinsStyle(FontWeight.w400, darkGrey, 16),
                          )),
                          DataCell(Text(
                            e.price.toString(),
                            style: poppinsStyle(FontWeight.w400, darkGrey, 16),
                          )),
                        ]);
                      }).toList());
                });
          })
        ]));
  }
}
