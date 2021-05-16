class PersonalDetails {
  StringBuffer _fname = new StringBuffer('');
  StringBuffer _lname = new StringBuffer('');
  StringBuffer _email = new StringBuffer('');
  StringBuffer _phone = new StringBuffer('');
  StringBuffer _address = new StringBuffer('');
  StringBuffer _zipCode = new StringBuffer('');
  StringBuffer _city = new StringBuffer('');
  StringBuffer _dob = new StringBuffer('');
  StringBuffer _placeOfBirth = new StringBuffer('');
  StringBuffer _drivingLicence = new StringBuffer('');
  StringBuffer _gender = new StringBuffer('');
  StringBuffer _nationality = new StringBuffer('');
  StringBuffer _maritalStatus = new StringBuffer('');
  StringBuffer _linkedln = new StringBuffer('');
  StringBuffer _github = new StringBuffer('');
  StringBuffer _hackerRank = new StringBuffer('');
  StringBuffer _website = new StringBuffer('');

  StringBuffer get fname => _fname;

  void setFname(String value) {
    _fname.clear();
    _fname.write(value);
  }

  StringBuffer get lname => _lname;

  void setLname(String value) {
    _lname.clear();
    _lname.write(value);
  }

  StringBuffer get email => _email;

  void setEmail(String value) {
    _email.clear();
    _email.write(value);
  }

  StringBuffer get phone => _phone;

  void setPhone(String value) {
    _phone.clear();
    _phone.write(value);
  }

  StringBuffer get address => _address;

  void seteAddress(String value) {
    _address.clear();
    _address.write(value);
  }

  StringBuffer get zipCode => _zipCode;

  void setZipCode(String value) {
    _zipCode.clear();
    _zipCode.write(value);
  }

  StringBuffer get city => _city;

  void setCity(String value) {
    _city.clear();
    _city.write(value);
  }

  StringBuffer get dob => _dob;

  void setDob(String value) {
    _dob.clear();
    _dob.write(value);
  }

  StringBuffer get placeOfBirth => _placeOfBirth;

  void setPlaceOfBirth(String value) {
    _placeOfBirth.clear();
    _placeOfBirth.write(value);
  }

  StringBuffer get drivingLicence => _drivingLicence;

  void setDrivingLicence(String value) {
    _drivingLicence.clear();
    _drivingLicence.write(value);
  }

  StringBuffer get gender => _gender;

  void setGender(String value) {
    _gender.clear();
    _gender.write(value);
  }

  StringBuffer get nationality => _nationality;

  void setNationality(String value) {
    _nationality.clear();
    _nationality.write(value);
  }

  StringBuffer get maritalStatus => _maritalStatus;

  void setMaritalStatus(String value) {
    _maritalStatus.clear();
    _maritalStatus.write(value);
  }

  StringBuffer get linkedln => _linkedln;

  void setLinkedln(String value) {
    _linkedln.clear();
    _linkedln.write(value);
  }

  StringBuffer get github => _github;

  void setGithub(String value) {
    _github.clear();
    _github.write(value);
  }

  StringBuffer get hackerRank => _hackerRank;

  void setHackerRank(String value) {
    _hackerRank.clear();
    _hackerRank.write(value);
  }

  StringBuffer get website => _website;

  void setWebsite(String value) {
    _website.clear();
    _website.write(value);
  }

  @override
  String toString() {
    return '''
      $_fname \n $_lname \n $_email \n $_phone \n $_address \n $_zipCode \n
      $_city \n $_dob \n $_placeOfBirth \n $_drivingLicence \n $_gender
      \n $_nationality \n $_maritalStatus \n $_linkedln \n $_github \n
       $_hackerRank \n $_website
    ''';
  }
}
