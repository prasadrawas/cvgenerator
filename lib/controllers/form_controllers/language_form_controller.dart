import 'package:get/get.dart';

class LanguageFormController extends GetxController {
  List<dynamic> languages = [];

  deleteForm(index) {
    languages.removeAt(index);
    update();
  }

  addForm(form) {
    languages.add(form);
    update();
  }

  clearAll() {
    languages.clear();
    update();
  }
}
