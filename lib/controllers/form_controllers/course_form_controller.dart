import 'package:get/get.dart';

class CoursesFormController extends GetxController {
  List<dynamic> courses = [];

  deleteForm(index) {
    courses.removeAt(index);
    update();
  }

  addForm(form) {
    courses.add(form);
    update();
  }

  clearAll() {
    courses.clear();
    update();
  }
}
