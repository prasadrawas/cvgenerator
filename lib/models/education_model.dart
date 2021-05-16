class Education {
  StringBuffer _degree = StringBuffer('');
  StringBuffer _city = StringBuffer('');
  StringBuffer _college = StringBuffer('');
  StringBuffer _startMonth = StringBuffer('');
  int _startYear = 0;
  StringBuffer _endMonth = StringBuffer('');
  int _endYear = 0;
  StringBuffer _description = StringBuffer('');
  Education() {}

  Education copy() {
    Education education = Education();
    education.setDegree(this.degree.toString());
    education.setCity(this.city.toString());
    education.setCollege(this.college.toString());
    education.setStartMonth(this.startMonth.toString());
    education.setEndMonth(this.endMonth.toString());
    education.setStartYear(this.startYear.toString());
    education.setEndYear(this.endYear.toString());
    education.setDescription(this.description.toString());
    return education;
  }

  bool isNotEmpty() {
    if (this._degree.isNotEmpty &&
        this._city.isNotEmpty &&
        this._college.isNotEmpty &&
        this._startMonth.isNotEmpty &&
        this._endMonth.isNotEmpty &&
        this._startYear != 0 &&
        this._endYear != 0 &&
        this._description.isNotEmpty) return true;
    return false;
  }

  void clear() {
    this._degree.clear();
    this._city.clear();
    this._college.clear();
    this._description.clear();
    this._startMonth.clear();
    this._endMonth.clear();
    this._startYear = 0;
    this._endYear = 0;
  }

  StringBuffer get degree => _degree;

  void setDegree(String value) {
    _degree.clear();
    _degree.write(value);
  }

  StringBuffer get city => _city;

  void setCity(String value) {
    _city.clear();
    _city.write(value);
  }

  StringBuffer get college => _college;

  void setCollege(String value) {
    _college.clear();
    _college.write(value);
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
    return '$_degree \n $_city \n $_college \n $_startMonth  \n  $_startYear\n $_endMonth  \n  $_endYear \n $_description';
  }
}
