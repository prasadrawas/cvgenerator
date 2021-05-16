import 'package:get/get.dart';

class ProjectFormController extends GetxController {
  List<dynamic> projects = [];

  void deleteForm(int index) {
    projects.removeAt(index);
    update();
  }

  void addForm(form) {
    projects.add(form);
    update();
  }

  void clearAll() {
    projects.clear();
    update();
  }
}
