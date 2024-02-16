import 'package:adminpanel_hardwarepro/View/homepage.dart';
import 'package:adminpanel_hardwarepro/View/login_page.dart';
import 'package:adminpanel_hardwarepro/View/pages/manage_complaints.dart';
import 'package:adminpanel_hardwarepro/View/pages/manage_user.dart';
import 'package:adminpanel_hardwarepro/View/pages/myshop.dart';
import 'package:adminpanel_hardwarepro/View/pages/orders/cancelled_order.dart';
import 'package:adminpanel_hardwarepro/View/pages/orders/completed_order.dart';
import 'package:adminpanel_hardwarepro/View/pages/orders/order.dart';
import 'package:adminpanel_hardwarepro/View/pages/products/add_product.dart';
import 'package:adminpanel_hardwarepro/View/pages/products/product.dart';
import 'package:adminpanel_hardwarepro/View/pages/wareenty/claim_warrenty.dart';
import 'package:adminpanel_hardwarepro/View/pages/wareenty/manage_warrenty.dart';
import 'package:adminpanel_hardwarepro/View/profile.dart';
import 'package:adminpanel_hardwarepro/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSizer(builder: (context, orientation, screentype) {
      return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: LoginScreen(),
      );
    });
  }
}
