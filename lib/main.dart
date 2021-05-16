import 'package:cvmaker/views/lifecycle.dart';
import 'package:cvmaker/views/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Color(0xFF2dc46a),
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.white,
    ),
  );
  runApp(Splash());
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LifeCycle(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CVmaker',
        theme: ThemeData(
          fontFamily: 'Ubuntu',
          primarySwatch: Colors.deepPurple,
        ),
        home: Scaffold(
          body: SplashScreen(
            seconds: 2,
            navigateAfterSeconds: MainPage(),
            title: Text(
              'CVGenerator',
              style: TextStyle(
                fontFamily: 'Ubuntu',
                letterSpacing: 1,
              ),
            ),
            image: Image.asset('assets/images/logo.png'),
            backgroundColor: Colors.white,
            photoSize: 100.0,
            useLoader: false,
            loadingText: Text(
              'from prasad',
              style: TextStyle(
                fontFamily: 'Ubuntu',
                letterSpacing: 0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
