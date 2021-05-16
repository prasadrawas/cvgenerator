class ExtraCurriculum {
  StringBuffer _curriculum = StringBuffer('');

  StringBuffer get curriculum => _curriculum;

  void setCurriculum(String curriculum) {
    _curriculum.clear();
    _curriculum.write(curriculum);
  }
}
