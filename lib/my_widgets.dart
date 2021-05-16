import 'dart:math';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget GetSectionHeader(height, text, icon) {
  return Column(
    children: [
      ListTile(
        leading: Icon(
          icon,
          color: Colors.black87,
          size: height * 0.033,
        ),
        title: Text(
          text,
          style: TextStyle(
            color: Colors.black87,
            fontSize: height * 0.025,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      Divider(
        height: 1,
      ),
    ],
  );
}

Widget GetTextFormField(label, height, keyboardType) {
  return Padding(
    padding: EdgeInsets.only(
        left: height * 0.010,
        right: height * 0.010,
        top: height * 0.020,
        bottom: height * 0.020),
    child: TextFormField(
      controller: TextEditingController(),
      keyboardType: keyboardType,
      onChanged: (s) {},
      validator: (s) {
        return null;
      },
      decoration: InputDecoration(
        labelText: label,
      ),
    ),
  );
}

Widget GetTestField(label, height, keyboardType, setter, validator) {
  return Padding(
    padding: EdgeInsets.only(
        left: height * 0.010,
        right: height * 0.010,
        top: height * 0.020,
        bottom: height * 0.020),
    child: TextFormField(
      //controller: TextEditingController(),
      keyboardType: keyboardType,
      textCapitalization: TextCapitalization.sentences,
      onChanged: (s) {
        setter(s.trim());
      },
      validator: (s) => validator(s),
      decoration: InputDecoration(
        labelText: label,
      ),
    ),
  );
}

Widget GetTestFielde(
    label, height, keyboardType, setter, validator, focusNode) {
  return Padding(
    padding: EdgeInsets.only(
        left: height * 0.010,
        right: height * 0.010,
        top: height * 0.020,
        bottom: height * 0.020),
    child: TextFormField(
      focusNode: focusNode,
      //controller: TextEditingController(),
      keyboardType: keyboardType,
      textCapitalization: TextCapitalization.sentences,
      onChanged: (s) {
        setter(s.trim());
      },
      validator: (s) => validator(s),
      decoration: InputDecoration(
        labelText: label,
      ),
    ),
  );
}

class CurvedShape extends StatelessWidget {
  final CURVE_HEIGHT, AVATAR_RADIUS, AVATAR_DIAMETER;
  CurvedShape(this.CURVE_HEIGHT, this.AVATAR_RADIUS, this.AVATAR_DIAMETER);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: CURVE_HEIGHT,
      child: CustomPaint(
        painter: MyPainter(CURVE_HEIGHT, AVATAR_RADIUS, AVATAR_DIAMETER),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  var CURVE_HEIGHT, AVATAR_RADIUS, AVATAR_DIAMETER;
  MyPainter(this.CURVE_HEIGHT, this.AVATAR_RADIUS, this.AVATAR_DIAMETER);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..style = PaintingStyle.fill
      ..isAntiAlias = true
      ..color = Color(0xFF2dc46a);

    Offset circleCenter = Offset(size.width / 1, size.height - AVATAR_RADIUS);

    Offset topLeft = Offset(0, 0);
    Offset bottomLeft = Offset(0, size.height * 0.60);
    Offset topRight = Offset(size.width, 0);
    Offset bottomRight = Offset(size.width, size.height * 0.5);

    Offset leftCurveControlPoint =
        Offset(circleCenter.dx * 0.5, size.height - AVATAR_RADIUS * 1.5);
    Offset rightCurveControlPoint =
        Offset(circleCenter.dx * 1.6, size.height - AVATAR_RADIUS);

    final arcStartAngle = 200 / 101.3 * pi;
    final avatarLeftPointX =
        circleCenter.dx + AVATAR_RADIUS * cos(arcStartAngle);
    final avatarLeftPointY =
        circleCenter.dy + AVATAR_RADIUS * sin(arcStartAngle);
    Offset avatarLeftPoint =
        Offset(avatarLeftPointX, avatarLeftPointY); // the left point of the arc

    final arcEndAngle = -5 / 180 * pi;
    final avatarRightPointX =
        circleCenter.dx + AVATAR_RADIUS * cos(arcEndAngle);
    final avatarRightPointY =
        circleCenter.dy + AVATAR_RADIUS * sin(arcEndAngle);
    Offset avatarRightPoint = Offset(
        avatarRightPointX, avatarRightPointY); // the right point of the arc

    Path path = Path()
      ..moveTo(topLeft.dx,
          topLeft.dy) // this move isn't required since the start point is (0,0)
      ..lineTo(bottomLeft.dx, bottomLeft.dy)
      ..quadraticBezierTo(leftCurveControlPoint.dx, leftCurveControlPoint.dy,
          avatarLeftPoint.dx, avatarLeftPoint.dy)
      ..arcToPoint(avatarRightPoint, radius: Radius.circular(AVATAR_RADIUS))
      ..quadraticBezierTo(rightCurveControlPoint.dx, rightCurveControlPoint.dy,
          bottomRight.dx, bottomRight.dy)
      ..lineTo(topRight.dx, topRight.dy)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

Widget GetHeader(height, width, sectionText, progress) {
  return Container(
    height: height * 0.30,
    width: width,
    color: Color(0xFF2dc46a),
    child: Column(
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
          padding: EdgeInsets.all(height * 0.020),
          child: Center(
            child: Text(
              sectionText,
              style: TextStyle(
                color: Colors.white,
                fontSize: height * 0.035,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Container(
          height: height * 0.080,
          padding: EdgeInsets.only(
              top: height * 0.020, left: height * 0.015, right: height * 0.015),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: width,
                  height: height * 0.010,
                  child: LinearProgressIndicator(
                    backgroundColor: Color(0xFF81e1a9),
                    value: progress,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: height * 0.060,
                    width: height * 0.060,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Icon(
                      Icons.account_circle,
                      size: height * 0.030,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    height: height * 0.060,
                    width: height * 0.060,
                    decoration: BoxDecoration(
                      color: progress >= 0.5
                          ? Colors.deepPurple
                          : Color(0xFF81e1a9),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Icon(
                      FontAwesomeIcons.evernote,
                      size: height * 0.030,
                      color: progress >= 0.5 ? Colors.white : Color(0xFF25c769),
                    ),
                  ),
                  Container(
                    height: height * 0.060,
                    width: height * 0.060,
                    decoration: BoxDecoration(
                      color:
                          progress >= 1 ? Colors.deepPurple : Color(0xFF81e1a9),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Icon(
                      Icons.edit,
                      size: height * 0.030,
                      color: progress >= 1 ? Colors.white : Color(0xFF25c769),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Personal',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: height * 0.015,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Experience',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: height * 0.015,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Generate',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: height * 0.015,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );
}
