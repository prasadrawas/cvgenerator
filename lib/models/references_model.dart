class References {
  StringBuffer _companyName = StringBuffer('');
  StringBuffer _contactPerson = StringBuffer('');
  StringBuffer _phone = StringBuffer('');
  StringBuffer _email = StringBuffer('');
  References() {}

  References copy() {
    References references = References();
    references.setCompanyName(this.companyName.toString());
    references.setContactPerson(this.contactPerson.toString());
    references.setPhone(this.phone.toString());
    references.setEmail(this.email.toString());
    return references;
  }

  bool isNotEmpty() {
    if (this._companyName.isNotEmpty &&
        this._contactPerson.isNotEmpty &&
        this._phone.isNotEmpty &&
        this._email.isNotEmpty) return true;
    return false;
  }

  void clear() {
    this._companyName.clear();
    this._contactPerson.clear();
    this._email.clear();
    this._phone.clear();
  }

  StringBuffer get companyName => _companyName;

  void setCompanyName(String value) {
    _companyName.clear();
    _companyName.write(value);
  }

  StringBuffer get contactPerson => _contactPerson;

  void setContactPerson(String value) {
    _contactPerson.clear();
    _contactPerson.write(value);
  }

  StringBuffer get phone => _phone;

  void setPhone(String value) {
    _phone.clear();
    _phone.write(value);
  }

  StringBuffer get email => _email;

  void setEmail(String value) {
    _email.clear();
    _email.write(value);
  }

  @override
  String toString() {
    return '$_companyName \n $_contactPerson \n $_phone \n $_email';
  }
}
