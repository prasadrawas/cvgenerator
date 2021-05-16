class Skills {
  StringBuffer _skill = StringBuffer('');
  StringBuffer _level = StringBuffer('');
  int _selectedSkill = 0;
  Skills() {}

  Skills copy() {
    Skills skills = Skills();
    skills.setSkill(this.skill.toString());
    skills.setLevel(this.level.toString());
    return skills;
  }

  bool isNotEmpty() {
    if (this._skill.isNotEmpty &&
        this._level.isNotEmpty &&
        this._selectedSkill != 0) return true;
    return false;
  }

  void clear() {
    this._skill.clear();
    this._level.clear();
    this._selectedSkill = 0;
  }

  StringBuffer get skill => _skill;

  void setSkill(String value) {
    _skill.clear();
    _skill.write(value);
  }

  StringBuffer get level => _level;

  void setLevel(String value) {
    _level.clear();
    _level.write(value);
  }

  int get selectedSkill => _selectedSkill;

  void setSelectedSkill(int value) {
    _selectedSkill = value;
  }

  @override
  String toString() {
    return '$_skill \n $_level';
  }
}
