import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:nogod/firebase_system.dart';
import 'package:nogod/pages/welcome_page.dart';
import 'package:nogod/static/all_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: AllColor.orangeColor),
      darkTheme: ThemeData(primarySwatch: AllColor.orangeColor),
      home: WelcomePage(),
      builder: EasyLoading.init(),
    );
  }
}
