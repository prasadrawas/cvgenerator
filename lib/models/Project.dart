class Project {
  StringBuffer _projectName = StringBuffer('');
  StringBuffer _projectDesc = StringBuffer('');

  StringBuffer get projectName => _projectName;

  void setProjectName(String name) {
    _projectName.clear();
    _projectName.write(name);
  }

  StringBuffer get projectDesc => _projectDesc;
  void setProjectDesc(String desc) {
    _projectDesc.clear();
    _projectDesc.write(desc);
  }
}
