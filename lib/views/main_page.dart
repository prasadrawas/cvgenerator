import 'package:cvmaker/my_widgets.dart';
import 'package:cvmaker/views/user_input/personal_details_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    var CURVE_HEIGHT = height * 0.9;
    var AVATAR_RADIUS = CURVE_HEIGHT * 0.1;
    var AVATAR_DIAMETER = AVATAR_RADIUS * 3;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            CurvedShape(CURVE_HEIGHT, AVATAR_RADIUS, AVATAR_DIAMETER),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(height * 0.030),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'CV',
                          style: TextStyle(
                            fontSize: height * 0.035,
                            color: Color(0xFFcaf0d9),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: 'Generator',
                          style: TextStyle(
                            fontSize: height * 0.033,
                            color: Color(0xFFcaf0d9),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: height * 0.020,
                      right: height * 0.020,
                      top: height * 0.050,
                      bottom: height * 0.020),
                  child: Center(
                    child: Text(
                      'Create your \nprofessional Resume \nwith CV Generator',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: height * 0.040,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'Crete your very own professional \nResume and download it within 10\nminutes.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: height * 0.020,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(height * 0.1),
                  child: Center(
                    child: SizedBox(
                      height: height * 0.060,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.to(
                            () => PersonalDetailsInput(),
                            duration: Duration(milliseconds: 200),
                            transition: Transition.rightToLeft,
                          );
                        },
                        child: Text(
                          'Create your Resume',
                          style: TextStyle(
                            fontSize: height * 0.020,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
