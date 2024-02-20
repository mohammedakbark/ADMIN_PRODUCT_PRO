import 'package:adminpanel_hardwarepro/View/Widgets/navigate_to_previouse.dart';
import 'package:adminpanel_hardwarepro/View/Widgets/show_message.dart';
import 'package:adminpanel_hardwarepro/View/Widgets/tabbar.dart';
import 'package:adminpanel_hardwarepro/ViewModel/firebasedatabase.dart';
import 'package:adminpanel_hardwarepro/utils/colors.dart';
import 'package:adminpanel_hardwarepro/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ManageUser extends StatelessWidget {
  const ManageUser({super.key});

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
              child: NavigateToPreviouse(title: "Manage Users")),
          SizedBox(
            height: height * .05,
          ),
          Consumer<FirebaseDatabase>(builder: (context, firestore, child) {
            return FutureBuilder(
                future: firestore.fetchAllUser(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return showIndicator();
                  }
                  return SizedBox(
                      width: width * .8,
                      height: height * .7,
                      child: firestore.userList.isEmpty
                          ? const Center(
                              child: Text("No users found"),
                            )
                          : ListView.separated(
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                height: 20,
                              ),
                              itemCount: firestore.userList.length,
                              itemBuilder: (context, index) {
                                final data = firestore.userList[index];
                                return Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(width: .5),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Text(
                                          data.userName.toUpperCase(),
                                          style: poppinsStyle(
                                              FontWeight.w600, balck, 15),
                                        ),
                                      ),
                                      const Expanded(
                                        child: SizedBox(
                                          width: 50,
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  actionsAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  title: Center(
                                                      child: Text(
                                                          "Delete ${data.userName}")),
                                                  actions: [
                                                    TextButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: const Text(
                                                          "No",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.red),
                                                        )),
                                                    TextButton(
                                                        onPressed: () {
                                                          firestore.deleteUser(
                                                              data.uid);
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: const Text(
                                                          "Yes",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.green),
                                                        ))
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          icon: const Icon(Icons.delete))
                                    ],
                                  ),
                                );
                              },
                            ));
                });
          })
        ],
      ),
    );
  }
}
