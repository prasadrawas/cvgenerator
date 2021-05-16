import 'package:get/get.dart';

class HobbiesFormController extends GetxController {
  List<dynamic> hobbies = [];

  deleteForm(index) {
    hobbies.removeAt(index);
    update();
  }

  addForm(form) {
    hobbies.add(form);
    update();
  }

  clearAll() {
    hobbies.clear();
    update();
  }
}
