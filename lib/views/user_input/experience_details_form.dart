import 'package:cvmaker/controllers/form_controllers/course_form_controller.dart';
import 'package:cvmaker/controllers/form_controllers/curriculum_form_controller.dart';
import 'package:cvmaker/controllers/form_controllers/education_form_controller.dart';
import 'package:cvmaker/controllers/form_controllers/hobbies_form_controller.dart';
import 'package:cvmaker/controllers/form_controllers/language_form_controller.dart';
import 'package:cvmaker/controllers/form_controllers/project_form_controller.dart';
import 'package:cvmaker/controllers/form_controllers/reference_form_controller.dart';
import 'package:cvmaker/controllers/form_controllers/skills_form_controller.dart';
import 'package:cvmaker/controllers/form_controllers/work_experience_form_controller.dart';
import 'package:cvmaker/models/Project.dart';
import 'package:cvmaker/models/courses_model.dart';
import 'package:cvmaker/models/curriculum_model.dart';
import 'package:cvmaker/models/education_model.dart';
import 'package:cvmaker/models/experience_model.dart';
import 'package:cvmaker/models/interests_model.dart';
import 'package:cvmaker/models/language_model.dart';
import 'package:cvmaker/models/personal_details_model.dart';
import 'package:cvmaker/models/references_model.dart';
import 'package:cvmaker/models/skills_model.dart';
import 'package:cvmaker/models/work_epxerience_model.dart';
import 'package:cvmaker/my_widgets.dart';
import 'package:cvmaker/utils.dart';
import 'package:cvmaker/validators.dart';
import 'package:cvmaker/views/lifecycle.dart';
import 'package:cvmaker/views/user_input/generate_resume.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ExperienceDetailsForm extends StatefulWidget {
  final PersonalDetails _personalDetails;

  ExperienceDetailsForm(this._personalDetails);

  @override
  _ExperienceDetailsFormState createState() => _ExperienceDetailsFormState();
}

class _ExperienceDetailsFormState extends State<ExperienceDetailsForm> {
  final _manager = LifeCycle();
  final _formKey = GlobalKey<FormState>();
  Experience _experience = new Experience();
  List<WorkExperience> _workExperiences = [];
  List<Education> _educations = [];
  List<Interests> _interests = [];
  List<References> _references = [];
  List<Skills> _skills = [];
  List<Languages> _languages = [];
  List<Project> _project = [];
  List<ExtraCurriculum> _curriculum = [];
  List<Courses> _courses = [];
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              GetHeader(height, width, 'Experience', 0.5),
              Container(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * 0.020,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade400,
                              offset: Offset(0.0, 0.8), //(x,y)
                              blurRadius: 5.0,
                            ),
                          ],
                        ),
                        margin: EdgeInsets.only(bottom: height * 0.050),
                        padding: EdgeInsets.only(
                            top: height * 0.015, bottom: height * 0.015),
                        child: ExpandablePanel(
                          header: GetSectionHeader(
                              height, 'Resume Objective', Icons.account_circle),
                          expanded: GetTestField(
                            'Description',
                            height,
                            TextInputType.multiline,
                            _experience.setResumeObjective,
                            nullValidator,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade400,
                              offset: Offset(0.0, 0.8), //(x,y)
                              blurRadius: 5.0,
                            ),
                          ],
                        ),
                        margin: EdgeInsets.only(bottom: height * 0.050),
                        padding: EdgeInsets.only(
                            top: height * 0.015, bottom: height * 0.015),
                        child: GetBuilder<WorkExperienceFormController>(
                            builder: (controller) {
                          return ExpandablePanel(
                            header: GetSectionHeader(
                                height, 'Work Experience', Icons.work),
                            expanded: ListView(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              children: [
                                ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount:
                                      controller.workExperienceForms.length,
                                  itemBuilder: (_, index) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        controller.workExperienceForms[index],
                                        Container(
                                          padding: EdgeInsets.only(
                                              right: height * 0.020),
                                          child: ElevatedButton.icon(
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.white,
                                            ),
                                            icon: Icon(
                                              Icons.delete,
                                              color: Colors.black54,
                                            ),
                                            onPressed: () {
                                              if (_manager
                                                      .workExperienceFormController
                                                      .workExperienceForms
                                                      .length >
                                                  0) {
                                                _manager
                                                    .workExperienceFormController
                                                    .deleteForm(index);
                                              }
                                              if (_experience
                                                      .workExperiences.length >
                                                  0) {
                                                _experience.workExperiences
                                                    .removeAt(index);
                                              }
                                              if (_workExperiences.length > 0) {
                                                _workExperiences
                                                    .removeAt(index);
                                              }
                                            },
                                            label: Text(
                                              'Delete',
                                              style: TextStyle(
                                                color: Colors.black54,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                                addFormButton(controller, () {
                                  _workExperiences.add(WorkExperience());
                                  controller.addForm(WorkExperienceForm(
                                      height,
                                      _workExperiences[
                                          _workExperiences.length - 1]));
                                }, height, 'Add another work experience'),
                              ],
                            ),
                          );
                        }),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade400,
                              offset: Offset(0.0, 0.8), //(x,y)
                              blurRadius: 5.0,
                            ),
                          ],
                        ),
                        margin: EdgeInsets.only(bottom: height * 0.050),
                        padding: EdgeInsets.only(
                            top: height * 0.015, bottom: height * 0.015),
                        child: GetBuilder<EducationFormController>(
                            builder: (controller) {
                          return ExpandablePanel(
                            header: GetSectionHeader(
                                height,
                                'Education & Qualifications',
                                FontAwesomeIcons.graduationCap),
                            expanded: ListView(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              children: [
                                ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: controller.educations.length,
                                  itemBuilder: (_, index) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        controller.educations[index],
                                        Container(
                                          padding: EdgeInsets.only(
                                              right: height * 0.020),
                                          child: ElevatedButton.icon(
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.white,
                                            ),
                                            icon: Icon(
                                              Icons.delete,
                                              color: Colors.black54,
                                            ),
                                            onPressed: () {
                                              if (_manager
                                                      .educationFormController
                                                      .educations
                                                      .length >
                                                  0) {
                                                _manager.educationFormController
                                                    .deleteForm(index);
                                              }
                                              if (_experience
                                                      .educations.length >
                                                  0) {
                                                _experience.educations
                                                    .removeAt(index);
                                              }
                                              if (_educations.length > 0) {
                                                _educations.removeAt(index);
                                              }
                                            },
                                            label: Text(
                                              'Delete',
                                              style: TextStyle(
                                                color: Colors.black54,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                                addFormButton(controller, () {
                                  _educations.add(Education());
                                  controller.addForm(EducationForm(height,
                                      _educations[_educations.length - 1]));
                                }, height, 'Add another education'),
                              ],
                            ),
                          );
                        }),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade400,
                              offset: Offset(0.0, 0.8), //(x,y)
                              blurRadius: 5.0,
                            ),
                          ],
                        ),
                        margin: EdgeInsets.only(bottom: height * 0.050),
                        padding: EdgeInsets.only(
                            top: height * 0.015, bottom: height * 0.015),
                        child: GetBuilder<HobbiesFormController>(
                            builder: (controller) {
                          return ExpandablePanel(
                            header: GetSectionHeader(
                                height, 'Interests', FontAwesomeIcons.palette),
                            expanded: ListView(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              children: [
                                ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: controller.hobbies.length,
                                  itemBuilder: (_, index) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        controller.hobbies[index],
                                        Container(
                                          margin: EdgeInsets.only(
                                              right: height * 0.020),
                                          child: ElevatedButton.icon(
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.white,
                                            ),
                                            icon: Icon(
                                              Icons.delete,
                                              color: Colors.black54,
                                            ),
                                            onPressed: () {
                                              if (_manager.hobbiesFormController
                                                      .hobbies.length >
                                                  0) {
                                                _manager.hobbiesFormController
                                                    .deleteForm(index);
                                              }
                                              if (_experience.interests.length >
                                                  0) {
                                                _experience.interests
                                                    .removeAt(index);
                                              }
                                              if (_references.length > 0) {
                                                _interests.removeAt(index);
                                              }
                                            },
                                            label: Text(
                                              'Delete',
                                              style: TextStyle(
                                                color: Colors.black54,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                                addFormButton(controller, () {
                                  _interests.add(new Interests());
                                  controller.addForm(IntrestForm(height,
                                      _interests[_interests.length - 1]));
                                }, height, 'Add another interest'),
                              ],
                            ),
                          );
                        }),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade400,
                              offset: Offset(0.0, 0.8), //(x,y)
                              blurRadius: 5.0,
                            ),
                          ],
                        ),
                        margin: EdgeInsets.only(bottom: height * 0.050),
                        padding: EdgeInsets.only(
                            top: height * 0.015, bottom: height * 0.015),
                        child: GetBuilder<CurriculumFormController>(
                            builder: (controller) {
                          return ExpandablePanel(
                            header: GetSectionHeader(height, 'Extra Curriculum',
                                FontAwesomeIcons.podcast),
                            expanded: ListView(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              children: [
                                ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: controller.extraCurriculums.length,
                                  itemBuilder: (_, index) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        controller.extraCurriculums[index],
                                        Container(
                                          margin: EdgeInsets.only(
                                              right: height * 0.020),
                                          child: ElevatedButton.icon(
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.white,
                                            ),
                                            icon: Icon(
                                              Icons.delete,
                                              color: Colors.black54,
                                            ),
                                            onPressed: () {
                                              if (_manager
                                                      .curriculumsFormController
                                                      .extraCurriculums
                                                      .length >
                                                  0) {
                                                _manager
                                                    .curriculumsFormController
                                                    .deleteForm(index);
                                              }
                                              if (_experience
                                                      .curriculum.length >
                                                  0) {
                                                _experience.curriculum
                                                    .removeAt(index);
                                              }
                                              if (_curriculum.length > 0) {
                                                _curriculum.removeAt(index);
                                              }
                                            },
                                            label: Text(
                                              'Delete',
                                              style: TextStyle(
                                                color: Colors.black54,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                                addFormButton(controller, () {
                                  _curriculum.add(new ExtraCurriculum());
                                  controller.addForm(CurriculumForm(height,
                                      _curriculum[_curriculum.length - 1]));
                                }, height, 'Add another Curriculum'),
                              ],
                            ),
                          );
                        }),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade400,
                              offset: Offset(0.0, 0.8), //(x,y)
                              blurRadius: 5.0,
                            ),
                          ],
                        ),
                        margin: EdgeInsets.only(bottom: height * 0.050),
                        padding: EdgeInsets.only(
                            top: height * 0.015, bottom: height * 0.015),
                        child: GetBuilder<CoursesFormController>(
                            builder: (controller) {
                          return ExpandablePanel(
                            header: GetSectionHeader(
                                height, 'Courses', FontAwesomeIcons.bandcamp),
                            expanded: ListView(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              children: [
                                ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: controller.courses.length,
                                  itemBuilder: (_, index) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        controller.courses[index],
                                        Container(
                                          padding: EdgeInsets.only(
                                              right: height * 0.020),
                                          child: ElevatedButton.icon(
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.white,
                                            ),
                                            icon: Icon(
                                              Icons.delete,
                                              color: Colors.black54,
                                            ),
                                            onPressed: () {
                                              if (_manager.coursesFormControlelr
                                                      .courses.length >
                                                  0) {
                                                _manager.coursesFormControlelr
                                                    .deleteForm(index);
                                              }
                                              if (_experience.courses.length >
                                                  0) {
                                                _experience.courses
                                                    .removeAt(index);
                                              }
                                              if (_courses.length > 0) {
                                                _courses.removeAt(index);
                                              }
                                            },
                                            label: Text(
                                              'Delete',
                                              style: TextStyle(
                                                color: Colors.black54,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                                addFormButton(controller, () {
                                  _courses.add(Courses());
                                  controller.addForm(CoursesForm(
                                      height, _courses[_courses.length - 1]));
                                }, height, 'Add another course'),
                              ],
                            ),
                          );
                        }),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade400,
                              offset: Offset(0.0, 0.8), //(x,y)
                              blurRadius: 5.0,
                            ),
                          ],
                        ),
                        margin: EdgeInsets.only(bottom: height * 0.050),
                        padding: EdgeInsets.only(
                            top: height * 0.015, bottom: height * 0.015),
                        child: GetBuilder<SkillsFormController>(
                            builder: (controller) {
                          return ExpandablePanel(
                            header: GetSectionHeader(
                                height, 'Skills', FontAwesomeIcons.mouse),
                            expanded: ListView(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              children: [
                                ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: controller.skills.length,
                                  itemBuilder: (_, index) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        controller.skills[index],
                                        Container(
                                          padding: EdgeInsets.only(
                                              right: height * 0.020),
                                          child: ElevatedButton.icon(
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.white,
                                            ),
                                            icon: Icon(
                                              Icons.delete,
                                              color: Colors.black54,
                                            ),
                                            onPressed: () {
                                              if (_manager.skillsFormController
                                                      .skills.length >
                                                  0) {
                                                _manager.skillsFormController
                                                    .deleteForm(index);
                                              }
                                              if (_experience.skills.length >
                                                  0) {
                                                _experience.skills
                                                    .removeAt(index);
                                              }
                                              if (_skills.length > 0) {
                                                _skills.removeAt(index);
                                              }
                                            },
                                            label: Text(
                                              'Delete',
                                              style: TextStyle(
                                                color: Colors.black54,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                                addFormButton(controller, () {
                                  _skills.add(Skills());
                                  controller.addForm(SkillsForm(
                                      height, _skills[_skills.length - 1]));
                                }, height, 'Add another skill'),
                              ],
                            ),
                          );
                        }),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade400,
                              offset: Offset(0.0, 0.8), //(x,y)
                              blurRadius: 5.0,
                            ),
                          ],
                        ),
                        margin: EdgeInsets.only(bottom: height * 0.050),
                        padding: EdgeInsets.only(
                            top: height * 0.015, bottom: height * 0.015),
                        child: GetBuilder<ProjectFormController>(
                            builder: (controller) {
                          return ExpandablePanel(
                            header: GetSectionHeader(
                                height, 'Projects', FontAwesomeIcons.tasks),
                            expanded: ListView(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              children: [
                                ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: controller.projects.length,
                                  itemBuilder: (_, index) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        controller.projects[index],
                                        Container(
                                          padding: EdgeInsets.only(
                                              right: height * 0.020),
                                          child: ElevatedButton.icon(
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.white,
                                            ),
                                            icon: Icon(
                                              Icons.delete,
                                              color: Colors.black54,
                                            ),
                                            onPressed: () {
                                              if (_manager
                                                      .projectsFormController
                                                      .projects
                                                      .length >
                                                  0) {
                                                _manager.projectsFormController
                                                    .deleteForm(index);
                                              }
                                              if (_experience.project.length >
                                                  0) {
                                                _experience.project
                                                    .removeAt(index);
                                              }
                                              if (_project.length > 0) {
                                                _project.removeAt(index);
                                              }
                                            },
                                            label: Text(
                                              'Delete',
                                              style: TextStyle(
                                                color: Colors.black54,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                                addFormButton(controller, () {
                                  _project.add(Project());
                                  controller.addForm(ProjectsForm(
                                      height, _project[_project.length - 1]));
                                }, height, 'Add another Project'),
                              ],
                            ),
                          );
                        }),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade400,
                              offset: Offset(0.0, 0.8), //(x,y)
                              blurRadius: 5.0,
                            ),
                          ],
                        ),
                        margin: EdgeInsets.only(bottom: height * 0.050),
                        padding: EdgeInsets.only(
                            top: height * 0.015, bottom: height * 0.015),
                        child: GetBuilder<LanguageFormController>(
                            builder: (controller) {
                          return ExpandablePanel(
                            header: GetSectionHeader(
                                height, 'Languages', Icons.language),
                            expanded: ListView(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              children: [
                                ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: controller.languages.length,
                                  itemBuilder: (_, index) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        controller.languages[index],
                                        Container(
                                          padding: EdgeInsets.only(
                                              right: height * 0.020),
                                          child: ElevatedButton.icon(
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.white,
                                            ),
                                            icon: Icon(
                                              Icons.delete,
                                              color: Colors.black54,
                                            ),
                                            onPressed: () {
                                              if (_manager
                                                      .languageFormController
                                                      .languages
                                                      .length >
                                                  0) {
                                                _manager.languageFormController
                                                    .deleteForm(index);
                                              }
                                              if (_experience.language.length >
                                                  0) {
                                                _experience.language
                                                    .removeAt(index);
                                              }
                                              if (_languages.length > 0) {
                                                _languages.removeAt(index);
                                              }
                                            },
                                            label: Text(
                                              'Delete',
                                              style: TextStyle(
                                                color: Colors.black54,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                                addFormButton(controller, () {
                                  _languages.add(Languages());
                                  controller.addForm(LanguageForm(height,
                                      _languages[_languages.length - 1]));
                                }, height, 'Add another language'),
                              ],
                            ),
                          );
                        }),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade400,
                              offset: Offset(0.0, 0.8), //(x,y)
                              blurRadius: 5.0,
                            ),
                          ],
                        ),
                        margin: EdgeInsets.only(bottom: height * 0.050),
                        padding: EdgeInsets.only(
                            top: height * 0.015, bottom: height * 0.015),
                        child: GetBuilder<ReferenceFormController>(
                            builder: (controller) {
                          return ExpandablePanel(
                            header: GetSectionHeader(height, 'References',
                                FontAwesomeIcons.solidCommentAlt),
                            expanded: ListView(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              children: [
                                ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: controller.references.length,
                                  itemBuilder: (_, index) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        controller.references[index],
                                        Container(
                                          padding: EdgeInsets.only(
                                              right: height * 0.020),
                                          child: ElevatedButton.icon(
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.white,
                                            ),
                                            icon: Icon(
                                              Icons.delete,
                                              color: Colors.black54,
                                            ),
                                            onPressed: () {
                                              if (_manager
                                                      .referencesFormController
                                                      .references
                                                      .length >
                                                  0) {
                                                _manager
                                                    .referencesFormController
                                                    .deleteForm(index);
                                              }
                                              if (_experience
                                                      .references.length >
                                                  0) {
                                                _experience.references
                                                    .removeAt(index);
                                              }
                                              if (_references.length > 0) {
                                                _references.removeAt(index);
                                              }
                                            },
                                            label: Text(
                                              'Delete',
                                              style: TextStyle(
                                                color: Colors.black54,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                                addFormButton(controller, () {
                                  _references.add(References());
                                  controller.addForm(ReferencesForm(height,
                                      _references[_references.length - 1]));
                                }, height, 'Add another reference'),
                              ],
                            ),
                          );
                        }),
                      ),
                      Padding(
                        padding: EdgeInsets.all(height * 0.05),
                        child: Center(
                          child: SizedBox(
                            height: height * 0.060,
                            width: width / 2,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  // _experience
                                  //     .setWorkExperience(_workExperiences);
                                  // _experience.setEducation(_educations);
                                  // _experience.setInterest(_interests);
                                  // _experience.setSkill(_skills);
                                  // _experience.setReference(_references);
                                  // _experience.setLanguage(_languages);
                                  // _experience.setProject(_project);
                                  // _experience.setCurriculum(_curriculum);
                                  // _experience.setCourses(_courses);
                                  setDummmyData();
                                  Get.to(
                                      () => GenerateDocument(
                                          widget._personalDetails, _experience),
                                      transition: Transition.rightToLeft,
                                      duration: Duration(milliseconds: 200));
                                } else {
                                  GetSnackBar('Please fill form properly.');
                                }
                              },
                              child: Text(
                                'Next Step',
                                style: TextStyle(
                                  fontSize: height * 0.020,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text('Previous'),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.android_rounded,
                          color: Colors.black87,
                          size: 10,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          'App Developer',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Prasad Rawas',
                      style: TextStyle(
                        fontSize: 8,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _manager.coursesFormControlelr.clearAll();
    _manager.curriculumsFormController.clearAll();
    _manager.projectsFormController.clearAll();
    _manager.workExperienceFormController.clearAll();
    _manager.referencesFormController.clearAll();
    _manager.languageFormController.clearAll();
    _manager.educationFormController.clearAll();
    _manager.skillsFormController.clearAll();
    _manager.hobbiesFormController.clearAll();
    _manager.downloadController.stopDownload();
    super.dispose();
  }

  void setDummmyData() {
    widget._personalDetails.setFname('Jon');
    widget._personalDetails.setLname('Doe');
    widget._personalDetails.setEmail('jondoe@example.com');
    widget._personalDetails.setPhone('1234567890');
    widget._personalDetails.seteAddress('32 Bakers Street');
    widget._personalDetails.setZipCode('189023');
    widget._personalDetails.setCity('LA');
    widget._personalDetails.setDob('23/10/1989');
    widget._personalDetails.setPlaceOfBirth('Paris');
    widget._personalDetails.setDrivingLicence('A');
    widget._personalDetails.setGender('Male');
    widget._personalDetails.setNationality('French');
    widget._personalDetails.setMaritalStatus('Married');
    widget._personalDetails.setLinkedln('linkedln/jondoe');
    widget._personalDetails.setLinkedln('github/jondoe');
    widget._personalDetails.setLinkedln('www.jondoe.com');

    _experience.setResumeObjective(
        'Seeking a challenging career with an MNC. A highly organized and hard-working individual looking for a responsible position to gain practical experience. To make use of my interpersonal skills to achieve goals of a company that focuses on customer satisfaction and customer experience.');
    _experience.setWorkExperience([WorkExperience()]);
    _experience.workExperiences[0].setJobTitle('Developer');
    _experience.workExperiences[0].setCity('LA');
    _experience.workExperiences[0].setStartMonth('Jan');
    _experience.workExperiences[0].setStartYear('2000');
    _experience.workExperiences[0].setEndMonth('Feb');
    _experience.workExperiences[0].setEndYear('2005');
    _experience.workExperiences[0].setEmployer('Pwc');
    _experience.workExperiences[0].setDescription(
        'My role was to conduct the sales process according to the organization’s strategies and procedures. This implied advertising the properties that were up for sale, presenting them to potential customers and finalizing the sales process.');

    _experience.setEducation([Education()]);
    _experience.educations[0].setDegree('Bachlors in Machine Learning');
    _experience.educations[0].setCollege('Trinity University');
    _experience.educations[0].setCity('London');
    _experience.educations[0].setStartMonth('Jan');
    _experience.educations[0].setStartYear('2000');
    _experience.educations[0].setEndYear('2002');
    _experience.educations[0].setEndMonth('Feb');
    _experience.educations[0].setDescription(
        'Artificial Nueral networks, Statistics, Linear algebra, Algorithms, Calculus.');

    _experience.setInterest([Interests(), Interests()]);
    _experience.interests[0].setHobby('Watching Movies & Series');
    _experience.interests[1].setHobby('Reading Novels');
    _experience.interests[1].setHobby('Sports');

    _experience.setSkill([Skills(), Skills(), Skills(), Skills()]);
    _experience.skills[0].setSkill('Machine Learning');
    _experience.skills[0].setLevel('Skillfull');
    _experience.skills[0].setSelectedSkill(3);

    _experience.skills[1].setSkill('Artifical Intelligence');
    _experience.skills[1].setLevel('Intermediate');
    _experience.skills[1].setSelectedSkill(2);

    _experience.skills[2].setSkill('Robotics');
    _experience.skills[2].setLevel('Skillfull');
    _experience.skills[2].setSelectedSkill(3);

    _experience.skills[3].setSkill('IOT');
    _experience.skills[3].setLevel('Experienced');
    _experience.skills[3].setSelectedSkill(4);

    _experience.setLanguage([Languages(), Languages()]);
    _experience.language[0].setLanguage('English');
    _experience.language[0].setLevel('Native Speaker');
    _experience.language[0].setSelectedLevel(5);

    _experience.language[1].setLanguage('French');
    _experience.language[1].setLevel('Working Knowldge');
    _experience.language[1].setSelectedLevel(3);

    _experience.setReference([References()]);
    _experience.references[0].setCompanyName('Google');
    _experience.references[0].setContactPerson('Larry Paige');
    _experience.references[0].setEmail('larrypaige@example.com');
    _experience.references[0].setPhone('0987654321');

    _experience.setCourses([Courses()]);
    _experience.courses[0].setDegree('Sun Certified Oracle Developer');
    _experience.courses[0].setInstitute('Oracle');
    _experience.courses[0].setCity('London');
    _experience.courses[0].setStartMonth('Jan');
    _experience.courses[0].setStartYear('2000');
    _experience.courses[0].setEndYear('2002');
    _experience.courses[0].setEndMonth('Feb');
    _experience.courses[0].setDescription(
        'An official oracle certified training program with 3 years of course certificate validation.');

    _experience.setProject([Project()]);
    _experience.project[0].setProjectName('IOT based Traffic Control System');
    _experience.project[0].setProjectDesc(
        'IOT (Internet of things) is a technology which lets various digital devices communicate with each other to perform a perticular task. I used one Aurduino KIT programmed in C language with detects traffic and manage it by giving appropriate signals.');

    _experience.setCurriculum(
        [ExtraCurriculum(), ExtraCurriculum(), ExtraCurriculum()]);
    _experience.curriculum[0].setCurriculum('Academic Teams and Clubs.');
    _experience.curriculum[1].setCurriculum('The Debate Team.');
    _experience.curriculum[2]
        .setCurriculum('Volunteer Work and Community Service.');
  }

  Widget WorkExperienceForm(height, WorkExperience workExperience) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: GetTestField('Job Title', height, TextInputType.text,
                  workExperience.setJobTitle, simpleValidator),
            ),
            Expanded(
              child: GetTestField('City/Town', height, TextInputType.text,
                  workExperience.setCity, simpleValidator),
            ),
          ],
        ),
        GetTestField('Employer', height, TextInputType.text,
            workExperience.setEmployer, simpleValidator),
        Row(
          children: [
            Expanded(
              child: StartMonthDropDown(workExperience, 0),
            ),
            Expanded(
              child: GetTestField('Year', height, TextInputType.number,
                  workExperience.setStartYear, yearValidator),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: StartMonthDropDown(workExperience, 1),
            ),
            Expanded(
              child: GetTestField('Year', height, TextInputType.number,
                  workExperience.setEndYear, yearValidator),
            ),
          ],
        ),
        GetTestField('Description', height, TextInputType.multiline,
            workExperience.setDescription, simpleValidator),
      ],
    );
  }

  Widget EducationForm(height, Education education) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: GetTestField('Degree', height, TextInputType.text,
                  education.setDegree, simpleValidator),
            ),
            Expanded(
              child: GetTestField('City/Town', height, TextInputType.text,
                  education.setCity, simpleValidator),
            ),
          ],
        ),
        GetTestField('School/College', height, TextInputType.text,
            education.setCollege, simpleValidator),
        Row(
          children: [
            Expanded(
              child: StartMonthDropDown(education, 0),
            ),
            Expanded(
              child: GetTestField('Year', height, TextInputType.number,
                  education.setStartYear, yearValidator),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: StartMonthDropDown(education, 1),
            ),
            Expanded(
              child: GetTestField('Year', height, TextInputType.number,
                  education.setEndYear, yearValidator),
            ),
          ],
        ),
        GetTestField('Favourite fields of Study', height,
            TextInputType.multiline, education.setDescription, simpleValidator),
      ],
    );
  }

  Widget IntrestForm(height, interests) {
    return Column(
      children: [
        GetTestField('Hobby', height, TextInputType.text, interests.setHobby,
            simpleValidator),
      ],
    );
  }

  Widget CurriculumForm(height, ExtraCurriculum curriculum) {
    return Column(
      children: [
        GetTestField('Activity name', height, TextInputType.text,
            curriculum.setCurriculum, simpleValidator),
      ],
    );
  }

  Widget ProjectsForm(height, Project project) {
    return Column(
      children: [
        GetTestField('Projects', height, TextInputType.text,
            project.setProjectName, simpleValidator),
        GetTestField('Project Description', height, TextInputType.text,
            project.setProjectDesc, simpleValidator),
      ],
    );
  }

  Widget SkillsForm(height, Skills skill) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: GetTestField('Skill', height, TextInputType.text,
                  skill.setSkill, simpleValidator),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                    left: height * 0.010,
                    right: height * 0.010,
                    top: height * 0.033,
                    bottom: height * 0.020),
                child: SkillDropDown(skill),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget CoursesForm(height, Courses course) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: GetTestField('Course', height, TextInputType.text,
                  course.setDegree, simpleValidator),
            ),
            Expanded(
              child: GetTestField('City/Town', height, TextInputType.text,
                  course.setCity, simpleValidator),
            ),
          ],
        ),
        GetTestField('Institute', height, TextInputType.text,
            course.setInstitute, simpleValidator),
        Row(
          children: [
            Expanded(
              child: StartMonthDropDown(course, 0),
            ),
            Expanded(
              child: GetTestField('Year', height, TextInputType.number,
                  course.setStartYear, yearValidator),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: StartMonthDropDown(course, 1),
            ),
            Expanded(
              child: GetTestField('Year', height, TextInputType.number,
                  course.setEndYear, yearValidator),
            ),
          ],
        ),
        GetTestField('Description', height, TextInputType.multiline,
            course.setDescription, simpleValidator),
      ],
    );
  }

  Widget LanguageForm(height, Languages language) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: GetTestField('Language', height, TextInputType.text,
                    language.setLanguage, simpleValidator)),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                    left: height * 0.010,
                    right: height * 0.010,
                    top: height * 0.033,
                    bottom: height * 0.020),
                child: LanguageDropDown(language),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget ReferencesForm(height, reference) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: GetTestField('Company Name', height, TextInputType.text,
                  reference.setCompanyName, simpleValidator),
            ),
            Expanded(
              child: GetTestField('Contact Person', height, TextInputType.text,
                  reference.setContactPerson, simpleValidator),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: GetTestField('Phone Number', height, TextInputType.text,
                  reference.setPhone, simpleValidator),
            ),
            Expanded(
              child: GetTestField('Email Address', height, TextInputType.text,
                  reference.setEmail, simpleValidator),
            ),
          ],
        ),
      ],
    );
  }

  Widget addFormButton(controller, onPressed, height, btnTitle) {
    return Padding(
      padding: EdgeInsets.all(height * 0.020),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: Colors.grey.shade100,
        ),
        label: Text(
          btnTitle,
          style: TextStyle(color: Colors.black87),
        ),
        icon: Icon(
          Icons.add_circle_outline,
          color: Colors.black87,
        ),
      ),
    );
  }
}

class SkillDropDown extends StatefulWidget {
  List<String> levels = [
    'Select Level',
    'Beginner',
    'Intermediate',
    'Skillful',
    'Experienced',
    'Expert',
  ];
  String selectedLevel = 'Select Level';
  final Skills skill;
  SkillDropDown(this.skill);
  @override
  _SkillDropDownState createState() => _SkillDropDownState();
}

class _SkillDropDownState extends State<SkillDropDown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      isExpanded: true,
      value: widget.selectedLevel,
      onChanged: (level) {
        if (mounted) {
          setState(() {
            widget.selectedLevel = level;
            widget.skill.setLevel(level);
            widget.skill.setSelectedSkill(widget.levels.indexOf(level));
          });
        }
      },
      validator: (s) {
        if (s == 'Select Level') return 'Mandatory';
        return null;
      },
      items: widget.levels.map((location) {
        return DropdownMenuItem(
          child: new Text(location),
          value: location,
        );
      }).toList(),
    );
  }
}

class LanguageDropDown extends StatefulWidget {
  List<String> levels = [
    'Select Level',
    'Good working knowledge',
    'Very good command',
    'Working knowledge',
    'High proficient in Speaking',
    'Native Speaker',
  ];

  String selectedLevel = 'Select Level';
  final Languages language;
  LanguageDropDown(this.language);
  @override
  _LanguageDropDownState createState() => _LanguageDropDownState();
}

class _LanguageDropDownState extends State<LanguageDropDown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      isExpanded: true,
      value: widget.selectedLevel,
      onChanged: (level) {
        if (mounted) {
          setState(() {
            widget.selectedLevel = level;
            widget.language.setLevel(level);
            widget.language.setSelectedLevel(widget.levels.indexOf(level));
          });
        }
      },
      validator: (s) {
        if (s == 'Select Level') return 'Mandatory';
        return null;
      },
      items: widget.levels.map((location) {
        return DropdownMenuItem(
          child: new Text(location),
          value: location,
        );
      }).toList(),
    );
  }
}

class StartMonthDropDown extends StatefulWidget {
  final status;
  List<String> months = [
    'Month',
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'June',
    'July',
    'Aug',
    'Sept',
    'Oct',
    'Nov',
    'Dec'
  ];
  String selectedMonth = 'Month';
  final object;
  StartMonthDropDown(this.object, this.status);
  @override
  _StartMonthDropDownState createState() => _StartMonthDropDownState();
}

class _StartMonthDropDownState extends State<StartMonthDropDown> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: DropdownButtonFormField(
        isExpanded: true,
        value: widget.selectedMonth,
        validator: (s) {
          if (widget.selectedMonth == 'Month') return 'Mandatory';
          return null;
        },
        onChanged: (month) {
          widget.selectedMonth = month;
          if (widget.status == 0)
            widget.object.setStartMonth(widget.selectedMonth);
          else
            widget.object.setEndMonth(widget.selectedMonth);
        },
        items: widget.months.map((location) {
          return DropdownMenuItem(
            child: new Text(location),
            value: location,
          );
        }).toList(),
      ),
    );
  }
}
