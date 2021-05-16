class Interests {
  StringBuffer _hobby = StringBuffer('');
  Interests() {}

  Interests copy() {
    Interests interests = Interests();
    interests.setHobby(this.hobby.toString());
    return interests;
  }

  bool isNotEmpty() {
    if (this._hobby.isNotEmpty) return true;
    return false;
  }

  void clear() {
    this._hobby.clear();
  }

  StringBuffer get hobby => _hobby;

  void setHobby(String value) {
    _hobby.clear();
    _hobby.write(value);
  }

  @override
  String toString() {
    return '$_hobby';
  }
}
