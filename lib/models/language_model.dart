class Languages {
  StringBuffer _language = StringBuffer('');
  StringBuffer _level = StringBuffer('');
  int _selectedLevel = 0;
  Languages() {}

  Languages copy() {
    Languages lanugages = Languages();
    lanugages.setLanguage(this.language.toString());
    lanugages.setLevel(this.level.toString());
    lanugages.setSelectedLevel(this.selectedLevel);
    return lanugages;
  }

  bool isNotEmpty() {
    if (this._language.isNotEmpty &&
        this._level.isNotEmpty &&
        this._selectedLevel == 0) return true;
    return false;
  }

  void clear() {
    this._language.clear();
    this._level.clear();
    this._selectedLevel = 0;
  }

  StringBuffer get language => _language;

  void setLanguage(String value) {
    _language.clear();
    _language.write(value);
  }

  StringBuffer get level => _level;

  void setLevel(String value) {
    _level.clear();
    _level.write(value);
  }

  int get selectedLevel => _selectedLevel;

  void setSelectedLevel(int value) {
    _selectedLevel = value;
  }

  @override
  String toString() {
    return '$_language \n $_level';
  }
}
