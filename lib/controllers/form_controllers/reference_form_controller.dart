import 'package:get/get.dart';

class ReferenceFormController extends GetxController {
  List<dynamic> references = [];

  deleteForm(index) {
    references.removeAt(index);
    update();
  }

  addForm(form) {
    references.add(form);
    update();
  }

  clearAll() {
    references.clear();
    update();
  }
}
