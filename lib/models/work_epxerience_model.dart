class WorkExperience {
  StringBuffer _jobTitle = StringBuffer('');
  StringBuffer _city = StringBuffer('');
  StringBuffer _employer = StringBuffer('');
  StringBuffer _startMonth = StringBuffer('');
  int _startYear = 0;
  StringBuffer _endMonth = StringBuffer('');
  int _endYear = 0;
  StringBuffer _description = StringBuffer('');

  WorkExperience() {}

  WorkExperience copy() {
    WorkExperience workExperience = WorkExperience();
    workExperience.setJobTitle(this.jobTitle.toString());
    workExperience.setCity(this.city.toString());
    workExperience.setEmployer(this.employer.toString());
    workExperience.setStartMonth(this.startMonth.toString());
    workExperience.setEndMonth(this.endMonth.toString());
    workExperience.setStartYear(this.startYear.toString());
    workExperience.setEndYear(this.endYear.toString());
    workExperience.setDescription(this.description.toString());
    return workExperience;
  }

  bool isNotEmpty() {
    if (this._jobTitle.isNotEmpty &&
        this._city.isNotEmpty &&
        this._employer.isNotEmpty &&
        this._startMonth.isNotEmpty &&
        this._endMonth.isNotEmpty &&
        this._startYear != 0 &&
        this._endYear != 0 &&
        this._description.isNotEmpty) return true;
    return false;
  }

  void clear() {
    this._jobTitle.clear();
    this._city.clear();
    this._startMonth.clear();
    this._endMonth.clear();
    this._startYear = 0;
    this._endYear = 0;
    this._employer.clear();
    this._description.clear();
  }

  StringBuffer get jobTitle => _jobTitle;

  void setJobTitle(String value) {
    _jobTitle.clear();
    _jobTitle.write(value);
  }

  StringBuffer get city => _city;

  void setCity(String value) {
    _city.clear();
    _city.write(value);
  }

  StringBuffer get employer => _employer;

  void setEmployer(String value) {
    _employer.clear();
    _employer.write(value);
  }

  StringBuffer get startMonth => _startMonth;

  void setStartMonth(String value) {
    _startMonth.clear();
    _startMonth.write(value);
  }

  StringBuffer get endMonth => _endMonth;

  void setEndMonth(String value) {
    _endMonth.clear();
    _endMonth.write(value);
  }

  int get startYear => _startYear;

  void setStartYear(String value) {
    _startYear = int.parse(value);
  }

  int get endYear => _endYear;

  void setEndYear(String value) {
    _endYear = int.parse(value);
  }

  StringBuffer get description => _description;

  void setDescription(String value) {
    _description.clear();
    _description.write(value);
  }

  @override
  String toString() {
    return '$_jobTitle \n $_city \n $_employer \n $_startMonth  \n  $_startYear\n $_endMonth  \n  $_endYear\n $_description';
  }
}
