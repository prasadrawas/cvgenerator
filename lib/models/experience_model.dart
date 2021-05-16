import 'package:cvmaker/models/Project.dart';
import 'package:cvmaker/models/courses_model.dart';
import 'package:cvmaker/models/curriculum_model.dart';
import 'package:cvmaker/models/education_model.dart';
import 'package:cvmaker/models/interests_model.dart';
import 'package:cvmaker/models/language_model.dart';
import 'package:cvmaker/models/references_model.dart';
import 'package:cvmaker/models/skills_model.dart';
import 'package:cvmaker/models/work_epxerience_model.dart';

class Experience {
  StringBuffer _resumeObjective = new StringBuffer('');
  List<WorkExperience> _workExperiences = [];
  List<Education> _educations = [];
  List<Interests> _interests = [];
  List<Skills> _skills = [];
  List<References> _references = [];
  List<Languages> _languages = [];
  List<Project> _projects = [];
  List<ExtraCurriculum> _curriculum = [];
  List<Courses> _courses = [];

  StringBuffer get resumeObjective => _resumeObjective;

  void setResumeObjective(String value) {
    _resumeObjective.clear();
    _resumeObjective.write(value);
  }

  List<WorkExperience> get workExperiences => _workExperiences;

  void setWorkExperience(List<WorkExperience> value) {
    _workExperiences.clear();
    _workExperiences.addAll(value);
  }

  List<Education> get educations => _educations;

  void setEducation(List<Education> value) {
    _educations.clear();
    _educations.addAll(value);
  }

  List<Interests> get interests => _interests;

  void setInterest(List<Interests> value) {
    _interests.clear();
    _interests.addAll(value);
  }

  List<Skills> get skills => _skills;

  void setSkill(List<Skills> value) {
    _skills.clear();
    _skills.addAll(value);
  }

  List<Languages> get language => _languages;

  void setLanguage(List<Languages> value) {
    _languages.clear();
    _languages.addAll(value);
  }

  List<References> get references => _references;

  void setReference(List<References> value) {
    _references.clear();
    _references.addAll(value);
  }

  List<Project> get project => _projects;

  void setProject(List<Project> value) {
    _projects.clear();
    _projects.addAll(value);
  }

  List<ExtraCurriculum> get curriculum => _curriculum;

  void setCurriculum(List<ExtraCurriculum> value) {
    _curriculum.clear();
    _curriculum.addAll(value);
  }

  List<Courses> get courses => _courses;

  void setCourses(List<Courses> value) {
    _courses.clear();
    _courses.addAll(value);
  }
}
