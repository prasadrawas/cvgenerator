import 'package:get/get.dart';

class GenderController extends GetxController {
  List<String> genders = ['Gender', 'Male', 'Female', 'Other'];
  String selectedGender = 'Gender';

  updateSelected(gender) {
    selectedGender = gender;
    update();
  }
}
