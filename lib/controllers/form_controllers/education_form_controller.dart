import 'package:get/get.dart';

class EducationFormController extends GetxController {
  List<dynamic> educations = [];

  deleteForm(index) {
    educations.removeAt(index);
    update();
  }

  addForm(form) {
    educations.add(form);
    update();
  }

  clearAll() {
    educations.clear();
    update();
  }
}
