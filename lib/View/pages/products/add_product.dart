import 'package:adminpanel_hardwarepro/View/Widgets/navigate_to_previouse.dart';
import 'package:adminpanel_hardwarepro/View/Widgets/show_message.dart';
import 'package:adminpanel_hardwarepro/View/Widgets/tabbar.dart';
import 'package:adminpanel_hardwarepro/ViewModel/controller.dart';
import 'package:adminpanel_hardwarepro/utils/colors.dart';
import 'package:adminpanel_hardwarepro/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class AddProductPage extends StatelessWidget {
  AddProductPage({super.key});
  final productNameController = TextEditingController();
  final priceController = TextEditingController();
  final productDescriptionController = TextEditingController();
  final productFeatureController = TextEditingController();
  final offersController = TextEditingController();
  final categoryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: appBgColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Tabbar(),
            SizedBox(
              height: height * .08,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: NavigateToPreviouse(
                title: "Add Products",
                isEnableButton: false,
              ),
            ),
            SizedBox(
              height: height * .05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: width * .4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customeTextField(
                          "Product Name", productNameController, height),
                      customeTextField("Price", priceController, height),
                      customeTextField("Product description",
                          productDescriptionController, height),
                      customeTextField(
                          "Product features", productFeatureController, height),
                      customeTextField("Offers", offersController, height),
                      customeTextField("Category", categoryController, height)
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(color: lightGrey.withOpacity(.5)),
                  width: 3,
                  height: height * .4,
                ),
                SizedBox(
                  width: width * .2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Add image here",
                        style: poppinsStyle(FontWeight.w500, balck, 18),
                      ),
                      SizedBox(
                        height: height * .03,
                      ),
                      Consumer<Controller>(
                          builder: (context, controller, child) {
                        return InkWell(
                          onTap: () async {
                            controller.pickImage();
                            // requestStoragePermission();
                          },
                          child: controller.isImageLoading1
                              ? showIndicator()
                              : Container(
                                  height: height * .3,
                                  width: width * .2,
                                  decoration: BoxDecoration(
                                      color: white.withOpacity(.2),
                                      border: Border.all(width: .5),
                                      borderRadius: BorderRadius.circular(10),
                                      image: controller.productImage1 == null
                                          ? const DecorationImage(
                                              image:
                                                  AssetImage("assets/pin.png"))
                                          : DecorationImage(
                                              image: FileImage(
                                                  controller.productImage1!))),
                                ),
                        );
                      }),
                      SizedBox(
                        height: height * .25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // Expanded(child: SizedBox()),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: darkGreen),
                              onPressed: () {},
                              child: Text(
                                "Submit",
                                style: poppinsStyle(FontWeight.w500, white, 15),
                              )),
                          const SizedBox(
                            width: 20,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 97, 96, 96)),
                              onPressed: () {},
                              child: Text(
                                "Cancel",
                                style: poppinsStyle(FontWeight.w500, white, 15),
                              )),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget customeTextField(
      String title, TextEditingController controller, double height) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: poppinsStyle(FontWeight.w500, balck, 18),
        ),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
              filled: true,
              fillColor: white.withOpacity(.2),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: .5),
                  borderRadius: BorderRadius.circular(10)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: .5),
                  borderRadius: BorderRadius.circular(10))),
        ),
        SizedBox(
          height: height * .03,
        )
      ],
    );
  }
}

void requestStoragePermission() async {
  // Request the permission
  PermissionStatus status = await Permission.storage.request();

  // Check the permission status
  if (status.isGranted) {
    print("111111111111111111111111");
    // Permission granted
    print("Storage permission granted");
  } else if (status.isDenied) {
    print("222222222222222222222222222222");
    // Permission denied
    print("Storage permission denied");
  } else if (status.isPermanentlyDenied) {
    print("33333333333333333333333333333333");
    // Permission permanently denied
    // Open app settings to allow the user to grant the permission
    openAppSettings();
  }
}
