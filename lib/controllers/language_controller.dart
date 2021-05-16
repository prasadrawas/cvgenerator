import 'package:get/get.dart';

class LanguageController extends GetxController {
  List<String> levels = [
    'Select Level',
    'Native Speaker',
    'High proficient in Speaking',
    'Very good command',
    'Good working knowledge',
    'Working knowledge',
    'A1',
    'A2',
    'B1',
    'B2',
    'C1',
    'C2'
  ];

  String selectedLevel = 'Select Level';
  updateLevel(level) {
    selectedLevel = level;
    update();
  }
}
