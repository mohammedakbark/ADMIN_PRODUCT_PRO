import 'package:adminpanel_hardwarepro/View/pages/wareenty/claim_warrenty.dart';
import 'package:adminpanel_hardwarepro/utils/colors.dart';
import 'package:adminpanel_hardwarepro/utils/style.dart';
import 'package:flutter/material.dart';

class NavigateToPreviouse extends StatelessWidget {
  String title;
  bool? isEnableButton = false;
  String? additionalButtonTitle;
  dynamic page;

  NavigateToPreviouse(
      {super.key,
      required this.title,
      this.isEnableButton,
      this.additionalButtonTitle,this.page});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(left: 100, right: 100),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: SizedBox(
              width: width * .2,
              child: Row(
                children: [
                  const Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: balck,
                    size: 30,
                  ),
                  Text(
                    title,
                    style: poppinsStyle(FontWeight.w600, balck, 20),
                  )
                ],
              ),
            ),
          ),
          isEnableButton == true
              ? SizedBox(
                  height: 50,
                  width: 300,
                  child: OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => page));
                      },
                      child: ListTile(
                        title: Text(
                          additionalButtonTitle!,
                          style: poppinsStyle(FontWeight.w400, balck, 18),
                        ),
                        trailing: const Icon(
                          Icons.arrow_right_alt_outlined,
                          color: balck,
                          size: 40,
                        ),
                      )),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
