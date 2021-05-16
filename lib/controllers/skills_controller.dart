import 'package:get/get.dart';

class SkillsController extends GetxController {
  List<String> levels = [
    'Select Level',
    'Expert',
    'Experienced',
    'Skillful',
    'Intermediate',
    'Beginner'
  ];
  String selectedLevel = 'Select Level';

  updateLevel(level) {
    selectedLevel = level;
    update();
  }
}
