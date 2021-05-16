import 'package:get/get.dart';

class FormsPageController extends GetxController {
  int formPage = 0;

  updateFormPage(index) {
    formPage = index;
    update();
  }
}
