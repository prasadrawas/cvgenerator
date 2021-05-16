import 'package:get/get.dart';

class WorkExperienceFormController extends GetxController {
  List<dynamic> workExperienceForms = [];

  deleteForm(index) {
    workExperienceForms.removeAt(index);
    update();
  }

  addForm(form) {
    workExperienceForms.add(form);
    update();
  }

  clearAll() {
    workExperienceForms.clear();
    update();
  }
}
