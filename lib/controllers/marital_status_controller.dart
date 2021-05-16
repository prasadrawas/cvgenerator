import 'package:get/get.dart';

class MaritalStatusController extends GetxController {
  List<String> status = ['Marital Status', 'Married', 'Unmarried'];
  String selectedStatus = 'Marital Status';

  updateSelected(status) {
    selectedStatus = status;
    update();
  }
}
