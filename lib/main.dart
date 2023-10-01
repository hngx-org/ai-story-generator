import 'package:ai_story_generator/screens/auth/sign_in.dart';
import 'package:ai_story_generator/themes/app_theme.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';


AppTheme appTheme = AppTheme();
void main() async {
  await GetStorage.init();
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              // fontFamily: GoogleFonts.abhayaLibre,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: SignInScreen(),
          );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AI Stories'),
      ),
      body: Center(
        child: Text('AI Stories'),
      ),
    );
  }
}
