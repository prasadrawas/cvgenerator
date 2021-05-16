import 'package:cvmaker/controllers/gender_controller.dart';
import 'package:cvmaker/controllers/marital_status_controller.dart';
import 'package:cvmaker/models/personal_details_model.dart';
import 'package:cvmaker/my_widgets.dart';
import 'package:cvmaker/utils.dart';
import 'package:cvmaker/validators.dart';
import 'package:cvmaker/views/user_input/experience_details_form.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalDetailsInput extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _personalDetails = PersonalDetails();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFf7f7f7),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GetHeader(height, width, 'Personal Details', 0.2),
              Container(
                color: Colors.white,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      GetSectionHeader(
                          height, 'Personal Details', Icons.account_circle),
                      Row(
                        children: [
                          Expanded(
                            child: GetTestField(
                                'First Name',
                                height,
                                TextInputType.text,
                                _personalDetails.setFname,
                                nullValidator),
                          ),
                          Expanded(
                            child: GetTestField(
                                'Last Name',
                                height,
                                TextInputType.text,
                                _personalDetails.setLname,
                                nullValidator),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: GetTestField(
                                'Email Address',
                                height,
                                TextInputType.emailAddress,
                                _personalDetails.setEmail,
                                nullValidator),
                          ),
                          Expanded(
                            child: GetTestField(
                                'Phone Number',
                                height,
                                TextInputType.number,
                                _personalDetails.setPhone,
                                nullValidator),
                          ),
                        ],
                      ),
                      GetTestField('Address', height, TextInputType.text,
                          _personalDetails.seteAddress, nullValidator),
                      Row(
                        children: [
                          Expanded(
                            child: GetTestField(
                                'Zip Code',
                                height,
                                TextInputType.number,
                                _personalDetails.setZipCode,
                                nullValidator),
                          ),
                          Expanded(
                            child: GetTestField(
                                'City/Town',
                                height,
                                TextInputType.text,
                                _personalDetails.setCity,
                                nullValidator),
                          ),
                        ],
                      ),
                      ExpandableNotifier(
                        // <-- Provides ExpandableController to its children
                        child: Column(
                          children: [
                            Expandable(
                              collapsed: ExpandableButton(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: height * 0.050,
                                    width: width / 1.2,
                                    child: ElevatedButton.icon(
                                      icon: Icon(
                                        Icons.add_circle_outline,
                                        size: 18,
                                      ),
                                      label: Text('Additional Information'),
                                    ),
                                  ),
                                ),
                              ),
                              expanded: Column(children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: GetTestField(
                                          'Date of Birth',
                                          height,
                                          TextInputType.datetime,
                                          _personalDetails.setDob,
                                          nullValidator),
                                    ),
                                    Expanded(
                                      child: GetTestField(
                                          'Place of Birth',
                                          height,
                                          TextInputType.text,
                                          _personalDetails.setPlaceOfBirth,
                                          nullValidator),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: GetTestField(
                                          'Driving Licence',
                                          height,
                                          TextInputType.text,
                                          _personalDetails.setDrivingLicence,
                                          nullValidator),
                                    ),
                                    Expanded(
                                      child: GetBuilder<GenderController>(
                                          builder: (controller) {
                                        return Padding(
                                          padding: EdgeInsets.only(
                                              left: height * 0.010,
                                              right: height * 0.010,
                                              top: height * 0.033,
                                              bottom: height * 0.020),
                                          child: DropdownButtonFormField(
                                            isExpanded: true,
                                            value: controller.selectedGender,
                                            onChanged: (newValue) {
                                              controller
                                                  .updateSelected(newValue);
                                              _personalDetails.setGender(
                                                  controller.selectedGender);
                                            },
                                            items: controller.genders
                                                .map((location) {
                                              return DropdownMenuItem(
                                                child: new Text(location),
                                                value: location,
                                              );
                                            }).toList(),
                                          ),
                                        );
                                      }),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: GetTestField(
                                          'Nationality',
                                          height,
                                          TextInputType.text,
                                          _personalDetails.setNationality,
                                          nullValidator),
                                    ),
                                    Expanded(
                                      child:
                                          GetBuilder<MaritalStatusController>(
                                              builder: (controller) {
                                        return Padding(
                                          padding: EdgeInsets.only(
                                              left: height * 0.010,
                                              right: height * 0.010,
                                              top: height * 0.033,
                                              bottom: height * 0.020),
                                          child: DropdownButtonFormField(
                                            isExpanded: true,
                                            value: controller.selectedStatus,
                                            onChanged: (newValue) {
                                              controller
                                                  .updateSelected(newValue);
                                              _personalDetails.setMaritalStatus(
                                                  controller.selectedStatus);
                                            },
                                            items: controller.status
                                                .map((location) {
                                              return DropdownMenuItem(
                                                child: new Text(location),
                                                value: location,
                                              );
                                            }).toList(),
                                          ),
                                        );
                                      }),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: GetTestField(
                                          'Linkedln',
                                          height,
                                          TextInputType.url,
                                          _personalDetails.setLinkedln,
                                          nullValidator),
                                    ),
                                    Expanded(
                                      child: GetTestField(
                                          'Github',
                                          height,
                                          TextInputType.url,
                                          _personalDetails.setGithub,
                                          nullValidator),
                                    ),
                                  ],
                                ),
                                GetTestField(
                                    'Website',
                                    height,
                                    TextInputType.url,
                                    _personalDetails.setWebsite,
                                    nullValidator),
                                ExpandableButton(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      height: height * 0.060,
                                      width: width,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.add_circle_outline_rounded,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Additional Information',
                                            style: TextStyle(
                                              color: Colors.black87,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                            Padding(
                              padding: EdgeInsets.all(height * 0.1),
                              child: Center(
                                child: SizedBox(
                                  height: height * 0.060,
                                  width: width / 2,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (_formKey.currentState.validate()) {
                                        Get.to(
                                            () => ExperienceDetailsForm(
                                                _personalDetails),
                                            transition: Transition.rightToLeft,
                                            duration:
                                                Duration(milliseconds: 200));
                                      } else {
                                        GetSnackBar(
                                            'Please fill form properly.');
                                      }
                                    },
                                    child: Text(
                                      'Next Step',
                                      style: TextStyle(
                                        fontSize: height * 0.020,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.android_rounded,
                          color: Colors.black87,
                          size: 10,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          'App Developer',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Prasad Rawas',
                      style: TextStyle(
                        fontSize: 8,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
