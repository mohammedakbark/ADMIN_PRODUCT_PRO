import 'package:adminpanel_hardwarepro/View/homepage.dart';
import 'package:adminpanel_hardwarepro/View/login_page.dart';
import 'package:adminpanel_hardwarepro/ViewModel/controller.dart';
import 'package:adminpanel_hardwarepro/ViewModel/firebasedatabase.dart';
import 'package:adminpanel_hardwarepro/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:provider/provider.dart';

void main() async {
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
      return MultiProvider(
        providers: [
          ChangeNotifierProvider<FirebaseDatabase>(
              create: (_) => FirebaseDatabase()),
          ChangeNotifierProvider<Controller>(create: (_) => Controller())
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: false,
          ),
          home: FirebaseAuth.instance.currentUser == null
              ? LoginScreen()
              : HomeScreen(),
        ),
      );
    });
  }
}
