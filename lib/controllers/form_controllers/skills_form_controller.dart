import 'package:get/get.dart';

class SkillsFormController extends GetxController {
  List<dynamic> skills = [];

  deleteForm(index) {
    skills.removeAt(index);
    update();
  }

  addForm(form) {
    skills.add(form);
    update();
  }

  clearAll() {
    skills.clear();
    update();
  }
}
