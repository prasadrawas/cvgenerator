import 'package:cvmaker/controllers/downloadController.dart';
import 'package:cvmaker/controllers/form_controllers/course_form_controller.dart';
import 'package:cvmaker/controllers/form_controllers/curriculum_form_controller.dart';
import 'package:cvmaker/controllers/form_controllers/education_form_controller.dart';
import 'package:cvmaker/controllers/form_controllers/project_form_controller.dart';
import 'package:cvmaker/controllers/gender_controller.dart';
import 'package:cvmaker/controllers/form_controllers/hobbies_form_controller.dart';
import 'package:cvmaker/controllers/language_controller.dart';
import 'package:cvmaker/controllers/form_controllers/language_form_controller.dart';
import 'package:cvmaker/controllers/marital_status_controller.dart';
import 'package:cvmaker/controllers/form_controllers/reference_form_controller.dart';
import 'package:cvmaker/controllers/skills_controller.dart';
import 'package:cvmaker/controllers/form_controllers/skills_form_controller.dart';
import 'package:cvmaker/controllers/form_controllers/work_experience_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LifeCycle extends StatefulWidget {
  final Widget child;
  var workExperienceFormController = Get.put(WorkExperienceFormController());
  var educationFormController = Get.put(EducationFormController());
  var hobbiesFormController = Get.put(HobbiesFormController());
  var skillsFormController = Get.put(SkillsFormController());
  var skillsController = Get.put(SkillsController());
  var referencesFormController = Get.put(ReferenceFormController());
  var genderController = Get.put(GenderController());
  var maritalStatusController = Get.put(MaritalStatusController());
  var languageFormController = Get.put(LanguageFormController());
  var languageController = Get.put(LanguageController());
  var downloadController = Get.put(DownloadController());
  var projectsFormController = Get.put(ProjectFormController());
  var curriculumsFormController = Get.put(CurriculumFormController());
  var coursesFormControlelr = Get.put(CoursesFormController());

  LifeCycle({Key key, this.child}) : super(key: key);

  @override
  _LifeCycleState createState() => _LifeCycleState();
}

class _LifeCycleState extends State<LifeCycle> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
