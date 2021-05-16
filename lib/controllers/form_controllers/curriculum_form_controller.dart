import 'package:get/get.dart';

class CurriculumFormController extends GetxController {
  List<dynamic> extraCurriculums = [];
  void deleteForm(int index) {
    extraCurriculums.removeAt(index);
    update();
  }

  void addForm(form) {
    extraCurriculums.add(form);
    update();
  }

  void clearAll() {
    extraCurriculums.clear();
    update();
  }
}
