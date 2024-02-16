import 'package:adminpanel_hardwarepro/View/Widgets/navigate_to_previouse.dart';
import 'package:adminpanel_hardwarepro/View/Widgets/tabbar.dart';
import 'package:adminpanel_hardwarepro/utils/colors.dart';
import 'package:adminpanel_hardwarepro/utils/style.dart';
import 'package:flutter/material.dart';

class MyshopPage extends StatelessWidget {
  const MyshopPage({super.key});

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
          DataTable(
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
            rows: [
              DataRow(cells: [
                DataCell(Text(
                  '1',
                  style: poppinsStyle(FontWeight.w400, darkGrey, 16),
                )),
                DataCell(Text(
                  '001',
                  style: poppinsStyle(FontWeight.w400, darkGrey, 16),
                )),
                DataCell(Text(
                  'PRODUCT NAME',
                  style: poppinsStyle(FontWeight.w400, darkGrey, 16),
                )),
                DataCell(Text(
                  '01-02-24',
                  style: poppinsStyle(FontWeight.w400, darkGrey, 16),
                )),
                DataCell(Text(
                  'ELECTRONICS',
                  style: poppinsStyle(FontWeight.w400, darkGrey, 16),
                )),
                DataCell(Text(
                  '1200',
                  style: poppinsStyle(FontWeight.w400, darkGrey, 16),
                )),
              ]),

              // Add more DataRow widgets as needed
            ],
          )
        ]));
  }
}
