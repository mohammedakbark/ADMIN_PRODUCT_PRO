import 'dart:io';

import 'package:adminpanel_hardwarepro/Model/productmodel.dart';
import 'package:adminpanel_hardwarepro/View/Widgets/navigate_to_previouse.dart';
import 'package:adminpanel_hardwarepro/View/Widgets/show_message.dart';
import 'package:adminpanel_hardwarepro/View/Widgets/tabbar.dart';
import 'package:adminpanel_hardwarepro/ViewModel/controller.dart';
import 'package:adminpanel_hardwarepro/utils/colors.dart';
import 'package:adminpanel_hardwarepro/utils/objects.dart';
import 'package:adminpanel_hardwarepro/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class AddProductPage extends StatelessWidget {
  AddProductPage({super.key});
  RegExp regex = RegExp(r'^\d+$');
  final productNameController = TextEditingController();
  final priceController = TextEditingController();
  final productDescriptionController = TextEditingController();
  final productFeatureController = TextEditingController();
  final offersController = TextEditingController();
  final categoryController = TextEditingController();
  String? uRL;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: appBgColor,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
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
                            "Product Name", productNameController, height,
                            validator: (value) {
                          if (value!.isEmpty) {
                            return "field is required";
                          } else {
                            return null;
                          }
                        }),
                        customeTextField("Price", priceController, height,
                            validator: (value) {
                          if (value!.isEmpty) {
                            return "field is required";
                          } else if (!(regex.hasMatch(value))) {
                            return "only contain numeric";
                          } else {
                            return null;
                          }
                        }),
                        customeTextField(
                            "Product description",
                            productDescriptionController,
                            height, validator: (value) {
                          if (value!.isEmpty) {
                            return "field is required";
                          } else {
                            return null;
                          }
                        }),
                        customeTextField(
                            "Product features",
                            productFeatureController,
                            height, validator: (value) {
                          if (value!.isEmpty) {
                            return "field is required";
                          } else {
                            return null;
                          }
                        }),
                        customeTextField("Offers", offersController, height,
                            validator: (value) {
                          if (value!.isEmpty) {
                            return "field is required";
                          } else if (!(regex.hasMatch(value))) {
                            return "only contain numeric";
                          } else {
                            return null;
                          }
                        }),
                        customeTextField("Category", categoryController, height,
                            validator: (value) {
                          if (value!.isEmpty) {
                            return "field is required";
                          } else {
                            return null;
                          }
                        }),
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
                              await controller.pickImageinWeb();

                              // requestStoragePermission();
                            },
                            child: controller.processingImage
                                ? showIndicator()
                                : Container(
                                    height: height * .3,
                                    width: width * .2,
                                    decoration: BoxDecoration(
                                      color: white.withOpacity(.2),
                                      border: Border.all(width: .5),
                                      borderRadius: BorderRadius.circular(10),
                                      image: controller.blob == null
                                          ? const DecorationImage(
                                              image:
                                                  AssetImage("assets/pin.png"))
                                          : DecorationImage(
                                              image: MemoryImage(
                                                  controller.imageBytes!)),
                                    )),
                          );
                        }),
                        SizedBox(
                          height: height * .25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // Expanded(child: SizedBox()),
                            Consumer<Controller>(
                                builder: (context, ctlr, child) {
                              return ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: darkGreen),
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      if (ctlr.blob != null) {
                                        try {
                                          double pricee = double.parse(
                                              priceController.text);
                                          double off = double.parse(
                                              offersController.text);
                                          await firebaseDatabase.addProduct(
                                              ProductModel(
                                                  productImage:ctlr.imageurl!,
                                                  category:
                                                      categoryController.text,
                                                  offer: off,
                                                  price: pricee,
                                                  prodcutDescription:
                                                      productDescriptionController
                                                          .text,
                                                  productName:
                                                      productNameController
                                                          .text,
                                                  productfeature:
                                                      productFeatureController
                                                          .text),
                                              context);
                                        } catch (e) {
                                          throw showErrorMessage(context, "$e");
                                        }
                                      } else {
                                        return showErrorMessage(
                                            context, "Pick Image");
                                      }
                                    }
                                  },
                                  child: Text(
                                    "Submit",
                                    style: poppinsStyle(
                                        FontWeight.w500, white, 15),
                                  ));
                            }),
                            const SizedBox(
                              width: 20,
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 97, 96, 96)),
                                onPressed: () {
                                  Navigator.of(context).pop(true);
                                },
                                child: Text(
                                  "Cancel",
                                  style:
                                      poppinsStyle(FontWeight.w500, white, 15),
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
      ),
    );
  }

  Widget customeTextField(
    String title,
    TextEditingController controller,
    double height, {
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: poppinsStyle(FontWeight.w500, balck, 18),
        ),
        TextFormField(
          validator: validator,
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
