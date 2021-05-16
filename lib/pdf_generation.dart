import 'dart:io';
import 'package:cvmaker/controllers/downloadController.dart';
import 'package:cvmaker/models/experience_model.dart';
import 'package:cvmaker/models/personal_details_model.dart';
import 'package:cvmaker/utils.dart';
import 'package:flutter_html_to_pdf/flutter_html_to_pdf.dart';
import 'package:get/get.dart';
import 'package:universal_html/html.dart' as html;
import 'package:universal_html/parsing.dart';

Future<void> generateRioPDF(
    PersonalDetails personalDetails,
    Experience experience,
    String textColor,
    String bgColor,
    String fileName,
    DownloadController controller) async {
  try {
    var htmlDocument = parseHtmlDocument(
        '''<!DOCTYPE html> <html> <head> <meta charset="utf-8"> <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no"> <title>Rio</title> <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"> <link rel="https://fonts.googleapis.com/css?family=Open Sans"> <style> @page{size:A3;margin:0}body{font-family:"Open Sans"}h1,h2,h3,h4,h5,h6{margin:0;padding:0}hr{margin-top:25px;margin-bottom:25px}table,td,th{border-collapse:collapse;vertical-align:bottom}.dot-active{height:18px;width:18px;margin-right:10px;background-color:#000;border-radius:50%;display:inline-block}.dot{height:18px;width:18px;margin-right:10px;background-color:grey;border-radius:50%;display:inline-block}.heading{font-weight:700;font-size:30px;letter-spacing:4px}.gap{padding:30px}.head{margin-top:20px;font-weight:bolder;letter-spacing:1px}.level{padding-left:10px}.icon-right{padding-right:10px}.off{color:grey}@media print{section{page-break-inside:avoid;page-break-after:auto;padding-top:50px}} </style> <script type="text/javascript"> (function() { var css = document.createElement('link'); css.href = 'https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'; css.rel = 'stylesheet'; css.type = 'text/css'; document.getElementsByTagName('head')[0].appendChild(css); })(); </script> </head> <body> <div class="container-fluid" style="padding: 0px; margin: 0px;"> <div class="row" style="height: 50px;"> <div class="col-md-4" style="background-color: ${bgColor}; color: ${textColor};"></div> <div class="col-md-8"></div> </div> <div id="mainTitle" style="background-color: white;"> </div> <div class="row"> <div class="col-md-4" style="background-color: ${bgColor}; color: ${textColor};"> <div style="padding-left: 30px; padding-top: 20px;"> <div id="personalDetails"></div> <section id="languageSection"></section> <section id="interestsSection"></section> <div style="height: 150vh;"> </div> </div> </div> <div class="col-md-8"> <section id="resumeObjective"></section> <section id="workExperience"></section> <section id="educationSection"></section> <section id="coursesSection"></section> <section id="skillsSection"></section> <section id="projectSection"></section> <section id="curriculumSection"></section> <section id="referencesSection"></section> <h6 style="text-align: center; font-weight: bold; padding:100px;">End of Resume</h6> </div> </div> </div> </body> </html>''');

    var mainTitle = htmlDocument.getElementById('mainTitle');
    mainTitle.appendHtml('''
  <h3 style=" text-align: center; vertical-align: middle;padding-top:25px; padding-bottom: 25px; font-weight: bolder; border: 2px solid grey;">${personalDetails.fname.toString().toUpperCase()} ${personalDetails.lname.toString().toUpperCase()}</h3>
  ''', treeSanitizer: html.NodeTreeSanitizer.trusted);

    var personalSection = htmlDocument.getElementById('personalDetails');
    personalSection.appendHtml(
        '''<h4 class="heading">Personal</h4><hr> <h5 class="head">Name</h5> <p>${personalDetails.fname} ${personalDetails.lname}</p> <h5 class="head">Address</h5> <p>${personalDetails.address} ${personalDetails.city} ${personalDetails.zipCode} </p> <h5 class="head">Phone Number</h5> <p>${personalDetails.phone}</p> <h5 class="head">Email</h5> <p>${personalDetails.email}</p>''',
        treeSanitizer: html.NodeTreeSanitizer.trusted);

    if (personalDetails.dob.isNotEmpty) {
      personalSection.appendHtml(
          ''' <h5 class="head">Date of Birth</h5> <p>${personalDetails.dob}</p> ''',
          treeSanitizer: html.NodeTreeSanitizer.trusted);
    }

    if (personalDetails.placeOfBirth.isNotEmpty) {
      personalSection.appendHtml(
          ''' <h5 class="head">Place of Birth</h5> <p>${personalDetails.placeOfBirth}</p> ''',
          treeSanitizer: html.NodeTreeSanitizer.trusted);
    }

    if (personalDetails.gender.isNotEmpty &&
        personalDetails.gender != 'Gender') {
      personalSection.appendHtml(
          '''<h5 class="head">Gender</h5> <p>${personalDetails.gender}</p> ''',
          treeSanitizer: html.NodeTreeSanitizer.trusted);
    }

    if (personalDetails.nationality.isNotEmpty) {
      personalSection.appendHtml(
          ''' <h5 class="head">Nationality</h5> <p>${personalDetails.nationality}</p> ''',
          treeSanitizer: html.NodeTreeSanitizer.trusted);
    }

    if (personalDetails.maritalStatus.isNotEmpty &&
        personalDetails.maritalStatus != 'Marital Status') {
      personalSection.appendHtml(
          ''' <h5 class="head">Marital Status</h5> <p>${personalDetails.maritalStatus}</p> ''',
          treeSanitizer: html.NodeTreeSanitizer.trusted);
    }

    if (personalDetails.drivingLicence.isNotEmpty) {
      personalSection.appendHtml(
          ''' <h5 class="head">Driving Licence</h5> <p>${personalDetails.drivingLicence}</p> ''',
          treeSanitizer: html.NodeTreeSanitizer.trusted);
    }

    if (personalDetails.linkedln.isNotEmpty) {
      personalSection.appendHtml(
          ''' <h5 class="head">Linkedin</h5> <p>${personalDetails.linkedln}</p> ''',
          treeSanitizer: html.NodeTreeSanitizer.trusted);
    }
    if (personalDetails.github.isNotEmpty) {
      personalSection.appendHtml(
          ''' <h5 class="head">Github</h5> <p>${personalDetails.github}</p> ''',
          treeSanitizer: html.NodeTreeSanitizer.trusted);
    }

    if (personalDetails.website.isNotEmpty) {
      personalSection.appendHtml(
          ''' <h5 class="head">Website</h5> <p>${personalDetails.website}</p> ''',
          treeSanitizer: html.NodeTreeSanitizer.trusted);
    }

    if (experience.language.length > 0) {
      var languageSection = htmlDocument.getElementById('languageSection');
      languageSection.appendHtml(
          ''' <div class="gap"></div> <h4 class="heading">Languages</h4> <hr> ''',
          treeSanitizer: html.NodeTreeSanitizer.trusted);

      for (int i = 0; i < experience.language.length; i++) {
        var level = "";
        int c = 0;
        for (int j = 0; j <= experience.language[i].selectedLevel - 1; j++) {
          level +=
              "<span style='padding-right:7px'><i class='fa fa-circle'></i></span>";
          c++;
        }

        for (int j = c; j < 5; j++) {
          level +=
              "<span style='padding-right:7px'><i class='fa fa-circle off'></i></span>";
        }

        languageSection.appendHtml(
            ''' <span style="display: block; padding-bottom: 15px;"> <h5 class="head" style="display: inline;">${experience.language[i].language}</h5> <h5 style='display: inline; float: right; vertical-align: middle; padding-right: 10%;'>${level}</h5> </span> ''',
            treeSanitizer: html.NodeTreeSanitizer.trusted);
      }
    }

    if (experience.interests.length > 0) {
      var interestsSection = htmlDocument.getElementById('interestsSection');
      interestsSection.appendHtml(
          ''' <div class="gap"></div> <h4 class="heading">Interests</h4> <hr> ''',
          treeSanitizer: html.NodeTreeSanitizer.trusted);

      for (int i = 0; i < experience.interests.length; i++) {
        interestsSection.appendHtml(
            ''' <p><i class="fa fa-square icon-right"></i>${experience.interests[i].hobby}</p> ''',
            treeSanitizer: html.NodeTreeSanitizer.trusted);
      }
    }

    var resumeObjective = htmlDocument.getElementById('resumeObjective');
    resumeObjective.appendHtml(
        ''' <p style="letter-spacing: 2px; padding-top: 20px;" >${experience.resumeObjective}</p> <hr> ''',
        treeSanitizer: html.NodeTreeSanitizer.trusted);

    if (experience.workExperiences.length > 0) {
      var workExperience = htmlDocument.getElementById('workExperience');
      workExperience.appendHtml('''<h4 class="heading">Work Experience</h4>''',
          treeSanitizer: html.NodeTreeSanitizer.trusted);

      for (int i = 0; i < experience.workExperiences.length; i++) {
        workExperience.appendHtml(
            ''' <h5 class="head"><i class="fa fa-square icon-right"></i>${experience.workExperiences[i].jobTitle}</h5> <div style="margin-left: 28px;"> <table style="width: 90%;"> <tr> <td> <p>${experience.workExperiences[i].employer}, ${experience.workExperiences[i].city}</p> </td> <td style="text-align: right; vertical-align: top;"><span class="head">${experience.workExperiences[i].startMonth} ${experience.workExperiences[i].startYear} - ${experience.workExperiences[i].endMonth} ${experience.workExperiences[i].endYear}</span></td> </tr> </table> <p>${experience.workExperiences[i].description}</p> </div> ''',
            treeSanitizer: html.NodeTreeSanitizer.trusted);
      }
      workExperience.appendHtml('<hr>',
          treeSanitizer: html.NodeTreeSanitizer.trusted);
    }

    if (experience.educations.length > 0) {
      var educationSection = htmlDocument.getElementById('educationSection');
      educationSection.appendHtml(
          '''<h4 class="heading">Education & Qualifications</h4>''',
          treeSanitizer: html.NodeTreeSanitizer.trusted);

      for (int i = 0; i < experience.educations.length; i++) {
        educationSection.appendHtml(
            ''' <h5 class="head"><i class="fa fa-square icon-right"></i>${experience.educations[i].degree}</h5> <div style="margin-left: 28px;"> <table style="width: 90%;"> <tr> <td> <p>${experience.educations[i].college}, ${experience.educations[i].city}</p> </td> <td style="text-align: right; vertical-align: top;"><span class="head">${experience.educations[i].startMonth} ${experience.educations[i].startYear} - ${experience.educations[i].endMonth} ${experience.educations[i].endYear}</span></td> </tr> </table> <p><strong>Favourite fields of study : </strong>${experience.educations[i].description}</p> </div> ''',
            treeSanitizer: html.NodeTreeSanitizer.trusted);
      }

      educationSection.appendHtml('<hr>',
          treeSanitizer: html.NodeTreeSanitizer.trusted);
    }

    if (experience.courses.length > 0) {
      var educationSection = htmlDocument.getElementById('coursesSection');
      educationSection.appendHtml('''<h4 class="heading">Courses</h4>''',
          treeSanitizer: html.NodeTreeSanitizer.trusted);

      for (int i = 0; i < experience.courses.length; i++) {
        educationSection.appendHtml(
            ''' <h5 class="head"><i class="fa fa-square icon-right"></i>${experience.courses[i].degree}</h5> <div style="margin-left: 28px;"> <table style="width: 90%;"> <tr> <td> <p>${experience.courses[i].institute}, ${experience.courses[i].city}</p> </td> <td style="text-align: right; vertical-align: top;"><span class="head">${experience.courses[i].startMonth} ${experience.courses[i].startYear} - ${experience.courses[i].endMonth} ${experience.courses[i].endYear}</span></td> </tr> </table> <p>${experience.courses[i].description}</p> </div> ''',
            treeSanitizer: html.NodeTreeSanitizer.trusted);
      }

      educationSection.appendHtml('<hr>',
          treeSanitizer: html.NodeTreeSanitizer.trusted);
    }

    if (experience.skills.length > 0) {
      var skillsSection = htmlDocument.getElementById('skillsSection');
      skillsSection.appendHtml(
          '''<h4 class="heading" style="padding-bottom:20px">Skills</h4>''',
          treeSanitizer: html.NodeTreeSanitizer.trusted);

      for (int i = 0; i < experience.skills.length; i++) {
        var level = "";
        int c = 0;
        for (int j = 0; j <= experience.skills[i].selectedSkill - 1; j++) {
          level +=
              "<span style='padding-right:20px;'><i class='fa fa-circle'></i></span>";
          c++;
        }

        for (int j = c; j < 5; j++) {
          level +=
              "<i class='fa fa-circle off' style='padding-right:20px;'></i>";
        }
        skillsSection.appendHtml(
            ''' <span style="display: block; padding-bottom:20px; vertical-align:middle;"> <h5 class="head" style="display: inline;">${experience.skills[i].skill}</h5> <h5 style='display: inline; float: right; vertical-align: middle; padding-right: 25%;'>${level}</h5> </span> ''',
            treeSanitizer: html.NodeTreeSanitizer.trusted);
      }
      skillsSection.appendHtml('<hr>',
          treeSanitizer: html.NodeTreeSanitizer.trusted);
    }

    if (experience.project.length > 0) {
      var educationSection = htmlDocument.getElementById('projectSection');
      educationSection.appendHtml('''<h4 class="heading">Projects</h4>''',
          treeSanitizer: html.NodeTreeSanitizer.trusted);

      for (int i = 0; i < experience.project.length; i++) {
        educationSection.appendHtml(
            ''' <h5 class="head"><i class="fa fa-square icon-right"></i>${experience.project[i].projectName}</h5> <div style="margin-left: 28px;"><p>${experience.project[i].projectDesc}</p> </div> ''',
            treeSanitizer: html.NodeTreeSanitizer.trusted);
      }

      educationSection.appendHtml('<hr>',
          treeSanitizer: html.NodeTreeSanitizer.trusted);
    }

    if (experience.curriculum.length > 0) {
      var interestsSection = htmlDocument.getElementById('curriculumSection');
      interestsSection.appendHtml(
          ''' <div class="gap"></div> <h4 class="heading">Extra Curriculum</h4> <hr> ''',
          treeSanitizer: html.NodeTreeSanitizer.trusted);

      for (int i = 0; i < experience.curriculum.length; i++) {
        interestsSection.appendHtml(
            ''' <p><i class="fa fa-square icon-right"></i>${experience.curriculum[i].curriculum}</p> ''',
            treeSanitizer: html.NodeTreeSanitizer.trusted);
      }
    }

    if (experience.references.length > 0) {
      var referencesSection = htmlDocument.getElementById('referencesSection');
      referencesSection.appendHtml('''<h4 class="heading">References</h4>''',
          treeSanitizer: html.NodeTreeSanitizer.trusted);

      for (int i = 0; i < experience.references.length; i++) {
        referencesSection.appendHtml(
            '''<h5 class="head"><i class="fa fa-square icon-right"></i>${experience.references[i].companyName}</h5> <div style="margin-left: 28px;"> <span class="head">${experience.references[i].contactPerson}</span> <table style="width: 90%;"> <tr> <td> <p>${experience.references[i].email}</p> </td> <td style="text-align: right; vertical-align: top;">${experience.references[i].phone}</td> </tr> </table> </div>''',
            treeSanitizer: html.NodeTreeSanitizer.trusted);
      }
    }

    Directory dir = Directory('storage/emulated/0/Resume');
    if (await dir.exists()) {
    } else {
      dir.createSync(recursive: true);
    }

    var targetPath = "storage/emulated/0/Resume";
    var targetFileName = fileName;

    var generatedPdfFile = await FlutterHtmlToPdf.convertFromHtmlContent(
        htmlDocument.head.outerHtml + htmlDocument.body.outerHtml,
        targetPath,
        targetFileName);
    controller.stopDownload();
    Get.back();
    GetSnack('Download Complete', 'PDF Saved inside Resume folder');
  } catch (e) {
    controller.stopDownload();
    GetSnack(
        'Failed', 'Download failed : ${e.toString()} \nPlease try again !!!');
  }
}

Future<void> generateBerlinPDF(
    PersonalDetails personalDetails,
    Experience experience,
    String textColor,
    String bgColor,
    String fileName,
    DownloadController controller) async {
  try {
    var htmlDocument = parseHtmlDocument(
        '''<!DOCTYPE html> <html> <head> <meta charset="utf-8"> <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no"> <title>Helsinki</title> <style> @page{size:A3;margin:0}body{font-family:Rubik}h1,h2,h3,h4,h5,h6{margin:0;padding:0;font-weight:700}hr{margin-top:25px;margin-bottom:25px;background-color:#e5e2e2}table,td,th{border-collapse:collapse;vertical-align:bottom}.dot-active{height:18px;width:18px;margin-right:10px;background-color:#000;border-radius:50%;display:inline-block}.dot{height:18px;width:18px;margin-right:10px;background-color:grey;border-radius:50%;display:inline-block}.heading{font-weight:700;font-size:30px;letter-spacing:4px}.gap{padding:20px}.head{margin-top:20px;font-weight:bolder;letter-spacing:1px}.level{padding-left:10px}.icon-right{padding-right:10px}.off{color:#e5e2e2}.round-icon{border:1px solid #000;border-radius:100%;padding:10px;height:40px;width:40px}@media print{section{page-break-inside:avoid;page-break-after:auto;padding-top:50px}} </style> <script type="text/javascript"> (function() { var css = document.createElement('link'); css.href = 'https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'; css.rel = 'stylesheet'; css.type = 'text/css'; document.getElementsByTagName('head')[0].appendChild(css); })(); </script> <script type="text/javascript"> (function() { var css = document.createElement('link'); css.href = 'https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css'; css.rel = 'stylesheet'; css.type = 'text/css'; document.getElementsByTagName('head')[0].appendChild(css); })(); </script> <script type="text/javascript"> (function() { var css = document.createElement('link'); css.href = 'https://fonts.googleapis.com/css?family=Rubik'; css.rel = 'stylesheet'; css.type = 'text/css'; document.getElementsByTagName('head')[0].appendChild(css); })(); </script> <script type="text/javascript"> (function() { var css = document.createElement('link'); css.href = 'https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css'; css.rel = 'stylesheet'; css.type = 'text/css'; document.getElementsByTagName('head')[0].appendChild(css); })(); </script> </head> <body> <div class="container-fluid" style="padding: 0px; margin: 0px;"> <div class="row"> <div class="col-md-4" style="background-color: ${bgColor}; color: ${textColor}; padding:0px; height:100%;"> <div style="padding-left: 40px; padding-top: 20px; padding-right: 40px;"> <section id="personalDetails"></section> <section id="languageSection"></section> <section id="interestsSection"></section> <div style="height:150vh"></div> </div> </div> <div class="col-md-8" style="height:100%; float:right; "> <div id="mainTitle"> </div> <div id="resumeObjective"> </div> <section id="workExperience"></section> <section id="educationSection"></section> <section id="coursesSection"></section> <section id="skillsSection"></section> <section id="projectSection"></section> <section id="curriculumSection"></section> <section id="referencesSection"></section> <h6 style="text-align: center; font-weight: bold; padding:50px;">End of Resume</h6> </div> </div> </body> </html> ''');

    var mainTitle = htmlDocument.getElementById('mainTitle');
    mainTitle.appendHtml('''
<h1 style="padding-top: 20px; letter-spacing: 4px;">${personalDetails.fname} ${personalDetails.lname}</h1>
  ''', treeSanitizer: html.NodeTreeSanitizer.trusted);

    var personalSection = htmlDocument.getElementById('personalDetails');
    personalSection.appendHtml(
        ''' <h4 class="heading">Personal</h4> <hr> <h5 class="head"><i class="fa fa-home icon-right"></i>Name</h5> <p style="padding-left: 30px;">${personalDetails.fname} ${personalDetails.lname}</p> <h5 class="head"><i class="fa fa-home icon-right"></i>Address</h5> <p style="padding-left: 30px;">${personalDetails.address} ${personalDetails.city} ${personalDetails.zipCode}</p> <h5 class="head"><i class="fa fa-phone icon-right"></i>Phone Number</h5> <p style="padding-left: 30px;">${personalDetails.phone}</p> <h5 class="head"><i class="fa fa-envelope icon-right"></i>Email</h5> <p style="padding-left: 30px;">${personalDetails.email}</p> ''',
        treeSanitizer: html.NodeTreeSanitizer.trusted);

    if (personalDetails.dob.isNotEmpty) {
      personalSection.appendHtml(
          '''<h5 class="head"><i class="fa fa-calendar icon-right"></i>Date of Birth</h5>
    <p style="padding-left: 30px;">${personalDetails.dob}</p>''',
          treeSanitizer: html.NodeTreeSanitizer.trusted);
    }

    if (personalDetails.placeOfBirth.isNotEmpty) {
      personalSection.appendHtml('''
    <h5 class="head"><i class="fa fa-map-marker icon-right"></i>Place of Birth</h5>
    <p style="padding-left: 30px;">${personalDetails.placeOfBirth}</p>
    ''', treeSanitizer: html.NodeTreeSanitizer.trusted);
    }

    if (personalDetails.gender.isNotEmpty &&
        personalDetails.gender != 'Gender') {
      personalSection.appendHtml('''
    <h5 class="head"><i class="fa fa-venus-double icon-right"></i>Gender</h5>
    <p style="padding-left: 30px;">${personalDetails.gender}</p>
    ''', treeSanitizer: html.NodeTreeSanitizer.trusted);
    }

    if (personalDetails.nationality.isNotEmpty) {
      personalSection.appendHtml('''
    <h5 class="head"><i class="fa fa-globe icon-right"></i>Nationality</h5>
    <p style="padding-left: 30px;">${personalDetails.nationality}</p>
    ''', treeSanitizer: html.NodeTreeSanitizer.trusted);
    }

    if (personalDetails.maritalStatus.isNotEmpty &&
        personalDetails.maritalStatus != 'Marital Status') {
      personalSection.appendHtml('''
    <h5 class="head"><i class="fa fa-user icon-right"></i>Marital Status</h5>
    <p style="padding-left: 30px;">${personalDetails.maritalStatus}</p>
    ''', treeSanitizer: html.NodeTreeSanitizer.trusted);
    }

    if (personalDetails.drivingLicence.isNotEmpty) {
      personalSection.appendHtml('''
    <h5 class="head"><i class="fa fa-car icon-right"></i>Driving Licence</h5>
    <p style="padding-left: 30px;">${personalDetails.drivingLicence}</p>
    ''', treeSanitizer: html.NodeTreeSanitizer.trusted);
    }

    if (personalDetails.linkedln.isNotEmpty) {
      personalSection.appendHtml('''
    <h5 class="head"><i class="fa fa-linkedin icon-right"></i>Linkedin</h5>
    <p style="padding-left: 30px;">${personalDetails.linkedln}</p>
    ''', treeSanitizer: html.NodeTreeSanitizer.trusted);
    }
    if (personalDetails.github.isNotEmpty) {
      personalSection.appendHtml('''
    <h5 class="head"><i class="fa fa-github icon-right"></i>Github</h5>
    <p style="padding-left: 30px;">${personalDetails.github}</p>
    ''', treeSanitizer: html.NodeTreeSanitizer.trusted);
    }

    if (personalDetails.website.isNotEmpty) {
      personalSection.appendHtml('''
    <h5 class="head"><i class="fa fa-desktop icon-right"></i>Website</h5>
    <p style="padding-left: 30px;">${personalDetails.website}</p>
    ''', treeSanitizer: html.NodeTreeSanitizer.trusted);
    }

    if (experience.language.length > 0) {
      var languageSection = htmlDocument.getElementById('languageSection');
      languageSection.appendHtml('''
    <div class="gap"></div>
    <h4 class="heading">Languages</h4>
    <hr>
    ''', treeSanitizer: html.NodeTreeSanitizer.trusted);

      for (int i = 0; i < experience.language.length; i++) {
        var level = "";
        int c = 0;
        for (int j = 0; j <= experience.language[i].selectedLevel - 1; j++) {
          level +=
              "<span style='padding-right:7px'><i class='fa fa-star'></i></span>";
          c++;
        }

        for (int j = c; j < 5; j++) {
          level +=
              "<span style='padding-right:7px'><i class='fa fa-star off'></i></span>";
        }

        languageSection.appendHtml('''
      <span style="display: block; padding-bottom: 15px;">
        <h5 class="head" style="display: inline;">${experience.language[i].language}</h5>
        <h5 style="display: inline; float: right; vertical-align: middle; padding-right: 10%;">
          ${level}
        </h5>
      </span>
      ''', treeSanitizer: html.NodeTreeSanitizer.trusted);
      }
    }

    if (experience.interests.length > 0) {
      var interestsSection = htmlDocument.getElementById('interestsSection');
      interestsSection.appendHtml('''
    <div class="gap"></div>
    <h4 class="heading">Interests</h4>
    <hr>
    ''', treeSanitizer: html.NodeTreeSanitizer.trusted);

      for (int i = 0; i < experience.interests.length; i++) {
        interestsSection.appendHtml('''
     <p><i class="fa fa-square icon-right"></i>${experience.interests[i].hobby}</p>
      ''', treeSanitizer: html.NodeTreeSanitizer.trusted);
      }
    }

    var resumeObjective = htmlDocument.getElementById('resumeObjective');
    resumeObjective.appendHtml('''
  <p style="letter-spacing: 2px; padding-top: 30px; line-height: 23px; color: black;">${experience.resumeObjective}</p>
  <hr>    
  ''', treeSanitizer: html.NodeTreeSanitizer.trusted);

    if (experience.workExperiences.length > 0) {
      var workExperience = htmlDocument.getElementById('workExperience');
      workExperience.appendHtml('''
  <h4 class="heading"> <i class="fa fa-briefcase" style="font-size: 25px; vertical-align: middle;"></i> Work Experience</h4>
    ''', treeSanitizer: html.NodeTreeSanitizer.trusted);

      for (int i = 0; i < experience.workExperiences.length; i++) {
        workExperience.appendHtml(
            '''<div style="margin-left: 15px; border-left: 1px solid grey;"> <div style="margin-left: 27px;"> <h5 class="head">${experience.workExperiences[i].jobTitle}</h5> <table style="width: 90%;"> <tr> <td> <p>${experience.workExperiences[i].employer}, ${experience.workExperiences[i].city}</p> </td> <td style="text-align: right; vertical-align: top;"><span class="head">${experience.workExperiences[i].startMonth} ${experience.workExperiences[i].startYear} - ${experience.workExperiences[i].endMonth} ${experience.workExperiences[i].endYear}</span></td> </tr> </table> <p>${experience.workExperiences[i].description}</p> </div> </div> ''',
            treeSanitizer: html.NodeTreeSanitizer.trusted);
      }
      workExperience.appendHtml('<hr>',
          treeSanitizer: html.NodeTreeSanitizer.trusted);
    }

    if (experience.educations.length > 0) {
      var educationSection = htmlDocument.getElementById('educationSection');
      educationSection.appendHtml('''
  <h4 class="heading"> <i class="fa fa-graduation-cap" style="font-size: 25px; vertical-align: middle;"></i> Eduactions & Qualifications</h4>        
    ''', treeSanitizer: html.NodeTreeSanitizer.trusted);

      for (int i = 0; i < experience.educations.length; i++) {
        educationSection.appendHtml(
            ''' <div style="margin-left: 15px; border-left: 1px solid grey;"> <div style="margin-left: 27px;"> <h5 class="head">${experience.educations[i].degree}</h5> <table style="width: 90%;"> <tr> <td> <p>${experience.educations[i].college}, {${experience.educations[i].city}}</p> </td> <td style="text-align: right; vertical-align: top;"><span class="head">${experience.educations[i].startMonth} ${experience.educations[i].startYear} - ${experience.educations[i].endMonth} ${experience.educations[i].endYear}</span></td> </tr> </table> <p><strong>Your Favourite fields of study : </strong>${experience.educations[i].description}</p> </div> </div> ''',
            treeSanitizer: html.NodeTreeSanitizer.trusted);
      }

      educationSection.appendHtml('<hr>',
          treeSanitizer: html.NodeTreeSanitizer.trusted);
    }

    if (experience.courses.length > 0) {
      var educationSection = htmlDocument.getElementById('coursesSection');
      educationSection.appendHtml('''
  <h4 class="heading"> <i class="fa fa-bandcamp" style="font-size: 25px; vertical-align: middle;"></i> Courses</h4>        
    ''', treeSanitizer: html.NodeTreeSanitizer.trusted);

      for (int i = 0; i < experience.courses.length; i++) {
        educationSection.appendHtml(
            ''' <div style="margin-left: 15px; border-left: 1px solid grey;"> <div style="margin-left: 27px;"> <h5 class="head">${experience.courses[i].degree}</h5> <table style="width: 90%;"> <tr> <td> <p>${experience.courses[i].institute}, {${experience.courses[i].city}}</p> </td> <td style="text-align: right; vertical-align: top;"><span class="head">${experience.courses[i].startMonth} ${experience.courses[i].startYear} - ${experience.courses[i].endMonth} ${experience.courses[i].endYear}</span></td> </tr> </table> <p>${experience.courses[i].description}</p> </div> </div> ''',
            treeSanitizer: html.NodeTreeSanitizer.trusted);
      }

      educationSection.appendHtml('<hr>',
          treeSanitizer: html.NodeTreeSanitizer.trusted);
    }

    if (experience.skills.length > 0) {
      var skillsSection = htmlDocument.getElementById('skillsSection');
      skillsSection.appendHtml('''
      <h4 class="heading"> <i class="fa fa-archive" style="font-size: 25px; vertical-align: middle;"></i> Skills</h4> 
    ''', treeSanitizer: html.NodeTreeSanitizer.trusted);

      for (int i = 0; i < experience.skills.length; i++) {
        var level = "";
        int c = 0;
        for (int j = 0; j <= experience.skills[i].selectedSkill - 1; j++) {
          level +=
              "<span style='padding-right:20px;'><i class='fa fa-star'></i></span>";
          c++;
        }

        for (int j = c; j < 5; j++) {
          level += "<i class='fa fa-star off' style='padding-right:20px;'></i>";
        }
        skillsSection.appendHtml(
            ''' <span style="display: block; padding: 15px; margin-left: 30px;"> <h5 class="head" style="display: inline;">${experience.skills[i].skill}</h5> <h5 style="display: inline; float: right; vertical-align: middle;padding-right: 20%;"> ${level} </h5> </span> ''',
            treeSanitizer: html.NodeTreeSanitizer.trusted);
      }
      skillsSection.appendHtml('<hr>',
          treeSanitizer: html.NodeTreeSanitizer.trusted);
    }

    if (experience.project.length > 0) {
      var educationSection = htmlDocument.getElementById('projectSection');
      educationSection.appendHtml('''
  <h4 class="heading"> <i class="fa fa-tasks" style="font-size: 25px; vertical-align: middle;"></i> Projects</h4>        
    ''', treeSanitizer: html.NodeTreeSanitizer.trusted);

      for (int i = 0; i < experience.project.length; i++) {
        educationSection.appendHtml(
            ''' <div style="margin-left: 15px; border-left: 1px solid grey;"> <div style="margin-left: 27px;"> <h5 class="head">${experience.project[i].projectName}</h5> <p>${experience.project[i].projectDesc}</p> </div> </div> ''',
            treeSanitizer: html.NodeTreeSanitizer.trusted);
      }

      educationSection.appendHtml('<hr>',
          treeSanitizer: html.NodeTreeSanitizer.trusted);
    }

    if (experience.curriculum.length > 0) {
      var interestsSection = htmlDocument.getElementById('curriculumSection');
      interestsSection.appendHtml('''
    <div class="gap"></div>
    <h4 class="heading"> <i class="fa fa-podcast" style="font-size: 25px; vertical-align: middle;"></i> Extra Curriculum</h4>
    ''', treeSanitizer: html.NodeTreeSanitizer.trusted);

      for (int i = 0; i < experience.curriculum.length; i++) {
        interestsSection.appendHtml('''
     <p style="margin-left:30px;"><i class="fa fa-square icon-right"></i>${experience.curriculum[i].curriculum}</p>
      ''', treeSanitizer: html.NodeTreeSanitizer.trusted);
      }
    }

    if (experience.references.length > 0) {
      var referencesSection = htmlDocument.getElementById('referencesSection');
      referencesSection.appendHtml('''
    <h4 class="heading"> <i class="fa fa-telegram" style="font-size: 25px; vertical-align: middle;"></i> References</h4>
   ''', treeSanitizer: html.NodeTreeSanitizer.trusted);

      for (int i = 0; i < experience.references.length; i++) {
        referencesSection.appendHtml(
            ''' <div style=" border-left: 1px solid grey; margin-left: 10px;"> <div style="margin-left: 28px;"> <h5 class="head">${experience.references[i].companyName}</h5> <span class="head">${experience.references[i].contactPerson}</span> <table style="width: 90%;"> <tr> <td> <p>${experience.references[i].email}</p> </td> <td style="text-align: right; vertical-align: top;">${experience.references[i].phone}</td> </tr> </table> </div> </div> ''',
            treeSanitizer: html.NodeTreeSanitizer.trusted);
      }
    }

    Directory dir = Directory('storage/emulated/0/Resume');
    if (await dir.exists()) {
    } else {
      dir.createSync(recursive: true);
    }
    var targetPath = "storage/emulated/0/Resume";
    var targetFileName = fileName;

    var generatedPdfFile = await FlutterHtmlToPdf.convertFromHtmlContent(
        htmlDocument.head.outerHtml + htmlDocument.body.outerHtml,
        targetPath,
        targetFileName);
    controller.stopDownload();
    Get.back();
    GetSnack('Download Complete', 'PDF Saved inside Resume folder');
  } catch (e) {
    controller.stopDownload();
    GetSnack(
        'Failed', 'Download failed : ${e.toString()} \nPlease try again !!!');
  }
}

Future<void> generateOsloPDF(
    PersonalDetails personalDetails,
    Experience experience,
    String textColor,
    String bgColor,
    String fileName,
    DownloadController controller) async {
  try {
    var htmlDocument = parseHtmlDocument(
        '''<!DOCTYPE html> <html> <head> <meta charset="utf-8"> <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no"> <title>Oslo</title> <style> @page{size:A3;margin:0}body{font-family:Changa}h1,h2,h3,h4,h5,h6{margin:0;padding:0;font-weight:700}hr{margin-top:25px;margin-bottom:25px}table,td,th{border-collapse:collapse;vertical-align:bottom}.dot-active{height:18px;width:18px;margin-right:10px;background-color:#000;border-radius:50%;display:inline-block}.dot{height:18px;width:18px;margin-right:10px;background-color:grey;border-radius:50%;display:inline-block}.heading{font-weight:700;font-size:40px;letter-spacing:4px}.gap{padding:30px}.head{margin-top:22px;font-weight:bolder;letter-spacing:3px}.level{padding-left:10px}.icon-right{padding-right:10px}.off{color:grey}@media print{section{page-break-inside:avoid;page-break-after:auto;padding-top:50px}} </style> <script type="text/javascript"> (function() { var css = document.createElement('link'); css.href = 'https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'; css.rel = 'stylesheet'; css.type = 'text/css'; document.getElementsByTagName('head')[0].appendChild(css); })(); </script> <script type="text/javascript"> (function() { var css = document.createElement('link'); css.href = 'https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css'; css.rel = 'stylesheet'; css.type = 'text/css'; document.getElementsByTagName('head')[0].appendChild(css); })(); </script><script type="text/javascript"> (function() { var css = document.createElement('link'); css.href = 'stylesheet" href="https://fonts.googleapis.com/css?family=Changa'; css.rel = 'stylesheet'; css.type = 'text/css'; document.getElementsByTagName('head')[0].appendChild(css); })(); </script> </head> <body> <div class="container-fluid" style="padding-left: 50px; padding-top: 30px; padding-bottom: 30px; border-left: 80px solid ${bgColor};"> <div> <section id="mainTitle"></section> <section class="row" style="padding:0px;" id="row1"></section> <section class="row" style="padding:0px;" id="row2"></section> <hr> <section id="resumeObjective"></section> <section id="workExperience"></section> <section id="educationSection"></section> <section id="coursesSection"></section> <section id="skillsSection"></section> <section id="projectSection"></section> <section id="curriculumSection"></section> <section id="languageSection"></section>  <section id="interestsSection"></section> <section id="referencesSection"></section> </div> <h6 style="text-align: center; font-weight: bold; padding:5px">End of Resume</h6> </div> </body> </html>''');

    var mainTitle = htmlDocument.getElementById('mainTitle');
    mainTitle.appendHtml('''
<h2 class="heading">${personalDetails.fname} ${personalDetails.lname}</h2>    
<span>
<p style="display: inline; padding-right: 30px;"><i class="fa fa-home icon-right"></i>${personalDetails.address} ${personalDetails.city} ${personalDetails.zipCode}</p>
<p style="display: inline; padding-right: 30px;"><i class="fa fa-phone icon-right"></i>${personalDetails.phone}</p>
<p style="display: inline; padding-right: 30px;"><i class="fa fa-envelope icon-right"></i>${personalDetails.email}</p>
</span>
<hr>
''', treeSanitizer: html.NodeTreeSanitizer.trusted);

    var row1 = htmlDocument.getElementById('row1');

    if (personalDetails.dob.isNotEmpty) {
      row1.appendHtml('''
<div class="col-md-3">
<h6>Date of Birth</h6>
<p class='off'>${personalDetails.dob}</p>
</div>
''', treeSanitizer: html.NodeTreeSanitizer.trusted);
    }

    if (personalDetails.placeOfBirth.isNotEmpty) {
      row1.appendHtml('''
<div class="col-md-3">
<h6>Place of Birth</h6>
<p class='off'>${personalDetails.placeOfBirth}</p>
</div>
''', treeSanitizer: html.NodeTreeSanitizer.trusted);
    }

    if (personalDetails.gender.isNotEmpty &&
        personalDetails.gender != 'Gender') {
      row1.appendHtml('''
<div class="col-md-3">
<h6>Gender</h6>
<p class='off'>${personalDetails.gender}</p>
</div>
''', treeSanitizer: html.NodeTreeSanitizer.trusted);
    }

    if (personalDetails.nationality.isNotEmpty) {
      row1.appendHtml('''
<div class="col-md-3">
<h6>Nationality</h6>
<p class='off'>${personalDetails.nationality}</p>
</div>
''', treeSanitizer: html.NodeTreeSanitizer.trusted);
    }

    var row2 = htmlDocument.getElementById('row2');

    if (personalDetails.maritalStatus.isNotEmpty &&
        personalDetails.maritalStatus != 'Marital Status') {
      row2.appendHtml('''
<div class="col-md-3">
<h6>Marital Status</h6>
<p class='off'>${personalDetails.maritalStatus}</p>
</div>
''', treeSanitizer: html.NodeTreeSanitizer.trusted);
    }

    if (personalDetails.drivingLicence.isNotEmpty) {
      row2.appendHtml('''
<div class="col-md-3">
<h6>Driving Licence</h6>
<p class='off'>${personalDetails.drivingLicence}</p>
</div>
''', treeSanitizer: html.NodeTreeSanitizer.trusted);
    }

    if (personalDetails.linkedln.isNotEmpty) {
      row2.appendHtml('''
<div class="col-md-3">
<h6>Linkedln</h6>
<p class='off'>${personalDetails.linkedln}</p>
</div>
''', treeSanitizer: html.NodeTreeSanitizer.trusted);
    }

    if (personalDetails.website.isNotEmpty) {
      row2.appendHtml('''
<div class="col-md-3">
<h6>Marital Status</h6>
<p class='off'>${personalDetails.website}</p>
</div>
''', treeSanitizer: html.NodeTreeSanitizer.trusted);
    }

    var resumeObjective = htmlDocument.getElementById('resumeObjective');
    resumeObjective.appendHtml('''
<p>${experience.resumeObjective}</p>
<hr>    
''', treeSanitizer: html.NodeTreeSanitizer.trusted);

    if (experience.language.length > 0) {
      var languageSection = htmlDocument.getElementById('languageSection');
      languageSection.appendHtml(
          '''<h4 class="head" style="padding-bottom: 10px;">Languages</h4>''',
          treeSanitizer: html.NodeTreeSanitizer.trusted);

      for (int i = 0; i < experience.language.length; i++) {
        var level = "";
        int c = 0;
        for (int j = 0; j <= experience.language[i].selectedLevel - 1; j++) {
          level +=
              "<span style='padding-right:15px'><i class='fa fa-star'></i></span>";
          c++;
        }

        for (int j = c; j < 5; j++) {
          level +=
              "<span style='padding-right:15px'><i class='fa fa-star off'></i></span>";
        }

        languageSection.appendHtml(
            ''' <div style="padding-left: 20px;"> <span style="display: block; padding-bottom: 15px;"> <h5 style="display: inline;">${experience.language[i].language}</h5> <h5 style="display: inline; float: right; vertical-align: middle; padding-right: 50%;">${level}</h5> </span> </div> ''',
            treeSanitizer: html.NodeTreeSanitizer.trusted);
      }

      languageSection.appendHtml('<hr>',
          treeSanitizer: html.NodeTreeSanitizer.trusted);
    }

    if (experience.interests.length > 0) {
      var interestsSection = htmlDocument.getElementById('interestsSection');
      interestsSection.appendHtml(
          '''<h4 class="head" style="padding-bottom: 10px;">Interests</h4>  
    ''',
          treeSanitizer: html.NodeTreeSanitizer.trusted);

      for (int i = 0; i < experience.interests.length; i++) {
        interestsSection.appendHtml('''
     <div style="padding-left: 20px;">
        <p><i class="fa fa-square icon-right"></i>${experience.interests[i].hobby}</p></div>
      ''', treeSanitizer: html.NodeTreeSanitizer.trusted);
      }
      interestsSection.appendHtml('<hr>',
          treeSanitizer: html.NodeTreeSanitizer.trusted);
    }

    if (experience.workExperiences.length > 0) {
      var workExperience = htmlDocument.getElementById('workExperience');
      workExperience.appendHtml('''
<h4 class="head">WORK EXPERIENCE</h4>
''', treeSanitizer: html.NodeTreeSanitizer.trusted);

      for (int i = 0; i < experience.workExperiences.length; i++) {
        workExperience.appendHtml(
            ''' <h5 style="padding-top: 14px;"><i class="fa fa-square icon-right"></i>${experience.workExperiences[i].jobTitle}</h5> <div style="margin-left: 28px;"> <table style="width: 90%;"> <tr> <td> <p>${experience.workExperiences[i].employer}, ${experience.workExperiences[i].city}</p> </td> <td style="text-align: right; vertical-align: top;"><span class="head">${experience.workExperiences[i].startMonth} ${experience.workExperiences[i].startYear} - ${experience.workExperiences[i].endMonth} ${experience.workExperiences[i].endYear}</span></td> </tr> </table> <p>${experience.workExperiences[i].description}</p> </div> ''',
            treeSanitizer: html.NodeTreeSanitizer.trusted);
      }
      workExperience.appendHtml('<hr>',
          treeSanitizer: html.NodeTreeSanitizer.trusted);
    }

    if (experience.educations.length > 0) {
      var educationSection = htmlDocument.getElementById('educationSection');
      educationSection.appendHtml('''
 <h4 class="head">Education & Qualifications</h4>
    ''', treeSanitizer: html.NodeTreeSanitizer.trusted);

      for (int i = 0; i < experience.educations.length; i++) {
        educationSection.appendHtml(
            ''' <h5 style="padding-top: 14px;"><i class="fa fa-square icon-right"></i>${experience.educations[i].degree}</h5> <div style="margin-left: 28px;"> <table style="width: 90%;"> <tr> <td> <p>${experience.educations[i].college}, ${experience.educations[i].city}</p> </td> <td style="text-align: right; vertical-align: top;"><span class="head">${experience.educations[i].startMonth} ${experience.educations[i].startYear} - ${experience.educations[i].endMonth} ${experience.educations[i].endYear}</span></td> </tr> </table> <p><strong>Your Favourite fields of study :</strong> ${experience.educations[i].description}</p> </div> ''',
            treeSanitizer: html.NodeTreeSanitizer.trusted);
      }

      educationSection.appendHtml('<hr>',
          treeSanitizer: html.NodeTreeSanitizer.trusted);
    }

    if (experience.courses.length > 0) {
      var educationSection = htmlDocument.getElementById('coursesSection');
      educationSection.appendHtml('''
 <h4 class="head">Courses</h4>
    ''', treeSanitizer: html.NodeTreeSanitizer.trusted);

      for (int i = 0; i < experience.courses.length; i++) {
        educationSection.appendHtml(
            ''' <h5 style="padding-top: 14px;"><i class="fa fa-square icon-right"></i>${experience.courses[i].degree}</h5> <div style="margin-left: 28px;"> <table style="width: 90%;"> <tr> <td> <p>${experience.courses[i].institute}, ${experience.courses[i].city}</p> </td> <td style="text-align: right; vertical-align: top;"><span class="head">${experience.courses[i].startMonth} ${experience.courses[i].startYear} - ${experience.courses[i].endMonth} ${experience.courses[i].endYear}</span></td> </tr> </table> <p>${experience.courses[i].description}</p> </div> ''',
            treeSanitizer: html.NodeTreeSanitizer.trusted);
      }

      educationSection.appendHtml('<hr>',
          treeSanitizer: html.NodeTreeSanitizer.trusted);
    }

    if (experience.skills.length > 0) {
      var skillsSection = htmlDocument.getElementById('skillsSection');
      skillsSection.appendHtml('''
<h4 class="head">Skills</h4>
    ''', treeSanitizer: html.NodeTreeSanitizer.trusted);

      for (int i = 0; i < experience.skills.length; i++) {
        var level = "";
        int c = 0;
        for (int j = 0; j <= experience.skills[i].selectedSkill - 1; j++) {
          level +=
              "<span style='padding-right:20px;'><i class='fa fa-star'></i></span>";
          c++;
        }

        for (int j = c; j < 5; j++) {
          level += "<i class='fa fa-star off' style='padding-right:20px;'></i>";
        }
        skillsSection.appendHtml(
            ''' <span style="display: block; padding: 15px;"> <h5 class="head" style="display: inline;">${experience.skills[i].skill}</h5> <h5 style="display: inline; float: right; vertical-align: middle;padding-right: 40%;">${level}</h5> </span> ''',
            treeSanitizer: html.NodeTreeSanitizer.trusted);
      }
      skillsSection.appendHtml('<hr>',
          treeSanitizer: html.NodeTreeSanitizer.trusted);
    }

    if (experience.project.length > 0) {
      var educationSection = htmlDocument.getElementById('projectSection');
      educationSection.appendHtml('''
 <h4 class="head">Projects</h4>
    ''', treeSanitizer: html.NodeTreeSanitizer.trusted);

      for (int i = 0; i < experience.project.length; i++) {
        educationSection.appendHtml(
            ''' <h5 style="padding-top: 14px;"><i class="fa fa-square icon-right"></i>${experience.project[i].projectName}</h5> <div style="margin-left: 28px;"> <p>${experience.project[i].projectDesc}</p> </div> ''',
            treeSanitizer: html.NodeTreeSanitizer.trusted);
      }

      educationSection.appendHtml('<hr>',
          treeSanitizer: html.NodeTreeSanitizer.trusted);
    }

    if (experience.curriculum.length > 0) {
      var interestsSection = htmlDocument.getElementById('curriculumSection');
      interestsSection.appendHtml(
          '''<h4 class="head" style="padding-bottom: 10px;">Extra Curriculum</h4>  
    ''',
          treeSanitizer: html.NodeTreeSanitizer.trusted);

      for (int i = 0; i < experience.curriculum.length; i++) {
        interestsSection.appendHtml('''
     <div style="padding-left: 20px;">
        <p><i class="fa fa-square icon-right"></i>${experience.curriculum[i].curriculum}</p></div>
      ''', treeSanitizer: html.NodeTreeSanitizer.trusted);
      }
      interestsSection.appendHtml('<hr>',
          treeSanitizer: html.NodeTreeSanitizer.trusted);
    }

    if (experience.references.length > 0) {
      var referencesSection = htmlDocument.getElementById('referencesSection');
      referencesSection.appendHtml(
          '''<h4 class="head" style="padding-bottom: 15px;">References</h4>''',
          treeSanitizer: html.NodeTreeSanitizer.trusted);

      for (int i = 0; i < experience.references.length; i++) {
        referencesSection.appendHtml(
            ''' <h5><i class="fa fa-square icon-right"></i>${experience.references[i].companyName}</h5> <div style="margin-left: 28px;"> <span class="head">${experience.references[i].contactPerson}</span> <table style="width: 90%;"> <tr> <td> <p>${experience.references[i].email}</p> </td> <td style="text-align: right; vertical-align: top;">${experience.references[i].phone}</td> </tr> </table> </div>''',
            treeSanitizer: html.NodeTreeSanitizer.trusted);
      }
    }

    Directory dir = Directory('storage/emulated/0/Resume');
    if (await dir.exists()) {
    } else {
      dir.createSync(recursive: true);
    }
    var targetPath = "storage/emulated/0/Resume";
    var targetFileName = fileName;

    var generatedPdfFile = await FlutterHtmlToPdf.convertFromHtmlContent(
        htmlDocument.head.outerHtml + htmlDocument.body.outerHtml,
        targetPath,
        targetFileName);
    controller.stopDownload();
    Get.back();
    GetSnack('Download Complete', 'PDF Saved inside Resume folder');
  } catch (e) {
    controller.stopDownload();
    GetSnack(
        'Failed', 'Download failed : ${e.toString()} \nPlease try again !!!');
  }
}

Future<void> generateRawPDF(
    PersonalDetails personalDetails,
    Experience experience,
    String textColor,
    String bgColor,
    String fileName,
    DownloadController controller) async {
  try {
    var htmlDocument = parseHtmlDocument(
        '''<!DOCTYPE html> <html> <head> <meta charset="utf-8"> <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no"> <title>Berlin</title> <style> @page{size:A3;margin:0}body{font-family:Cabin}h1,h2,h3,h4,h5,h6{margin:0;padding:0;font-weight:700}hr{margin-top:25px;margin-bottom:25px}table,td,th{border-collapse:collapse;vertical-align:bottom}.dot-active{height:18px;width:18px;margin-right:10px;background-color:#000;border-radius:50%;display:inline-block}.dot{height:18px;width:18px;margin-right:10px;background-color:grey;border-radius:50%;display:inline-block}.heading{font-weight:700;font-size:30px;letter-spacing:4px}.gap{padding:20px}.head{margin-top:20px;font-weight:bolder;letter-spacing:1px}.level{padding-left:10px}.icon-right{padding-right:10px}.off{color:grey}@media print{section{page-break-inside:avoid;page-break-after:auto;padding-top:50px}} </style> <script type="text/javascript"> (function() { var css = document.createElement('link'); css.href = 'https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'; css.rel = 'stylesheet'; css.type = 'text/css'; document.getElementsByTagName('head')[0].appendChild(css); })(); </script> <script type="text/javascript"> (function() { var css = document.createElement('link'); css.href = 'https://fonts.googleapis.com/css?family=Cabin'; css.rel = 'stylesheet'; css.type = 'text/css'; document.getElementsByTagName('head')[0].appendChild(css); })(); </script> </script> <script type="text/javascript"> (function() { var css = document.createElement('link'); css.href = 'https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css'; css.rel = 'stylesheet'; css.type = 'text/css'; document.getElementsByTagName('head')[0].appendChild(css); })(); </script> </head> <body> <div class="container-fluid" style="padding:0px; margin:0px;"> <div class="row"> <div class="col-md-4" style="background-color: #f0f3f4 ; padding:0px;"> <div style="height: 130px; background-color: ${textColor}; border-radius: 0px 0px 50% 50%; border-bottom: 15px solid ${bgColor};"> <h5 style="font-size: 28px; letter-spacing: 3px; text-align: center; color:#fff; vertical-align: bottom; font-weight: bold; padding-top:40px;" id="mainTitle"></h5> </div> <div class="personalDetails" style="padding-left: 40px; padding-top: 10px; padding-right: 40px;"> <section id="personalDetails"></section> <section id="languageSection"></section> <section id="interestsSection"></section> <div style="height:150vh;"></div> </div> </div> <div class="col-md-8"> <p style="letter-spacing:1px;padding:20px; padding-top: 30px; line-height: 23px; color: black;" id="resumeObjective"></p> <hr> <section id="workExperience"></section> <section id="educationSection"></section> <section id="coursesSection"></section> <section id="skillsSection"></section> <section id="projectSection"></section> <section id="curriculumSection"></section> <section id="referencesSection"></section> <h6 style="text-align: center; font-weight: bold; padding:50px;">End of Resume</h6> </div> </div> </div> </body> </html>''');
    var mainTitle = htmlDocument.getElementById('mainTitle');
    mainTitle.innerHtml = "${personalDetails.fname} ${personalDetails.lname}";

    var personalSection = htmlDocument.getElementById('personalDetails');
    personalSection.appendHtml(
        ''' <h4 class="heading">Personal</h4> <hr> <h5 class="head"><i class="fa fa-home icon-right"></i> Name</h5> <p style="padding-left: 35px;">${personalDetails.fname} ${personalDetails.lname}</p> <h5 class="head"><i class="fa fa-home icon-right"></i> Address</h5> <p style="padding-left: 35px;">${personalDetails.address} ${personalDetails.city} ${personalDetails.fname} ${personalDetails.zipCode}</p> <h5 class="head"><i class="fa fa-phone icon-right"></i>Phone Number</h5> <p style="padding-left: 35px;">${personalDetails.phone}</p> <h5 class="head"><i class="fa fa-envelope icon-right"></i>Email</h5> <p style="padding-left: 35px;">${personalDetails.email}</p> ''',
        treeSanitizer: html.NodeTreeSanitizer.trusted);

    if (personalDetails.dob.isNotEmpty) {
      personalSection.appendHtml(
          '''<h5 class="head"><i class="fa fa-home icon-right"></i> Date of Birth</h5><p style="padding-left: 35px;">${personalDetails.dob}''',
          treeSanitizer: html.NodeTreeSanitizer.trusted);
    }

    if (personalDetails.placeOfBirth.isNotEmpty) {
      personalSection.appendHtml(
          '''<h5 class="head"><i class="fa fa-home icon-right"></i> Place of Birth</h5><p style="padding-left: 35px;">${personalDetails.placeOfBirth}''',
          treeSanitizer: html.NodeTreeSanitizer.trusted);
    }

    if (personalDetails.gender.isNotEmpty &&
        personalDetails.gender != 'Gender') {
      personalSection.appendHtml(
          '''<h5 class="head"><i class="fa fa-home icon-right"></i> Gender</h5><p style="padding-left: 35px;">${personalDetails.gender}''',
          treeSanitizer: html.NodeTreeSanitizer.trusted);
    }

    if (personalDetails.nationality.isNotEmpty) {
      personalSection.appendHtml(
          '''<h5 class="head"><i class="fa fa-home icon-right"></i> Nationality</h5><p style="padding-left: 35px;">${personalDetails.nationality}''',
          treeSanitizer: html.NodeTreeSanitizer.trusted);
    }

    if (personalDetails.maritalStatus.isNotEmpty &&
        personalDetails.maritalStatus != 'Marital Status') {
      personalSection.appendHtml(
          '''<h5 class="head"><i class="fa fa-home icon-right"></i> Marital Status</h5><p style="padding-left: 35px;">${personalDetails.maritalStatus}''',
          treeSanitizer: html.NodeTreeSanitizer.trusted);
    }

    if (personalDetails.drivingLicence.isNotEmpty) {
      personalSection.appendHtml(
          '''<h5 class="head"><i class="fa fa-home icon-right"></i> Driving Licence</h5><p style="padding-left: 35px;">${personalDetails.drivingLicence}''',
          treeSanitizer: html.NodeTreeSanitizer.trusted);
    }

    if (personalDetails.linkedln.isNotEmpty) {
      personalSection.appendHtml(
          '''<h5 class="head"><i class="fa fa-home icon-right"></i> Linkedln</h5><p style="padding-left: 35px;">${personalDetails.linkedln}''',
          treeSanitizer: html.NodeTreeSanitizer.trusted);
    }

    if (personalDetails.website.isNotEmpty) {
      personalSection.appendHtml(
          '''<h5 class="head"><i class="fa fa-home icon-right"></i> Website</h5><p style="padding-left: 35px;">${personalDetails.website}''',
          treeSanitizer: html.NodeTreeSanitizer.trusted);
    }

    var resumeObjective = htmlDocument.getElementById('resumeObjective');
    resumeObjective.innerHtml = '${experience.resumeObjective}';

    if (experience.language.length > 0) {
      var languageSection = htmlDocument.getElementById('languageSection');
      languageSection.appendHtml(
          '''<div class="gap"></div><h4 class="heading">Languages</h4><hr>''',
          treeSanitizer: html.NodeTreeSanitizer.trusted);

      for (int i = 0; i < experience.language.length; i++) {
        var level = "";
        int c = 0;
        for (int j = 0; j <= experience.language[i].selectedLevel - 1; j++) {
          level +=
              "<span style='padding-right:15px'><i class='fa fa-star'></i></span>";
          c++;
        }

        for (int j = c; j < 5; j++) {
          level +=
              "<span style='padding-right:15px'><i class='fa fa-star off'></i></span>";
        }

        languageSection.appendHtml(
            ''' <span style="display: block; padding-bottom: 15px;"> <h5 class="head" style="display: inline;">${experience.language[i].language}</h5> <h5 style="display: inline; float: right; vertical-align: middle; padding-right: 10%;"> ${level} </h5> </span>''',
            treeSanitizer: html.NodeTreeSanitizer.trusted);
      }
    }

    if (experience.interests.length > 0) {
      var interestsSection = htmlDocument.getElementById('interestsSection');
      interestsSection.appendHtml(
          '''<div class="gap"></div><h4 class="heading">Interests</h4><hr>''',
          treeSanitizer: html.NodeTreeSanitizer.trusted);

      for (int i = 0; i < experience.interests.length; i++) {
        interestsSection.appendHtml(
            '''<p><i class="fa fa-square icon-right"></i>${experience.interests[i].hobby}</p>''',
            treeSanitizer: html.NodeTreeSanitizer.trusted);
      }
    }

    if (experience.workExperiences.length > 0) {
      var workExperience = htmlDocument.getElementById('workExperience');
      workExperience.appendHtml('''<h4 class="heading">Work Experience</h4>''',
          treeSanitizer: html.NodeTreeSanitizer.trusted);

      for (int i = 0; i < experience.workExperiences.length; i++) {
        workExperience.appendHtml(
            ''' <h5 class="head"><i class="fa fa-square icon-right"></i>${experience.workExperiences[i].jobTitle}</h5> <div style="margin-left: 28px;"> <table style="width: 90%;"> <tr> <td> <p>${experience.workExperiences[i].employer}, ${experience.workExperiences[i].city}</p> </td> <td style="text-align: right; vertical-align: top;"><span class="head">${experience.workExperiences[i].startMonth} ${experience.workExperiences[i].startYear} - ${experience.workExperiences[i].endMonth} ${experience.workExperiences[i].endYear}</span></td> </tr> </table> <p>${experience.workExperiences[i].description}</p> </div> ''',
            treeSanitizer: html.NodeTreeSanitizer.trusted);
      }
      workExperience.appendHtml('<hr>',
          treeSanitizer: html.NodeTreeSanitizer.trusted);
    }

    if (experience.educations.length > 0) {
      var educationSection = htmlDocument.getElementById('educationSection');
      educationSection.appendHtml(
          '''<h4 class="heading">Education & Qualifications</h4>''',
          treeSanitizer: html.NodeTreeSanitizer.trusted);

      for (int i = 0; i < experience.educations.length; i++) {
        educationSection.appendHtml(
            ''' <h5 class="head"><i class="fa fa-square icon-right"></i>${experience.educations[i].degree}</h5> <div style="margin-left: 28px;"> <table style="width: 90%;"> <tr> <td> <p>${experience.educations[i].college}, ${experience.educations[i].city}</p> </td> <td style="text-align: right; vertical-align: top;"><span class="head">${experience.educations[i].startMonth} ${experience.educations[i].startYear} - ${experience.educations[i].endMonth} ${experience.educations[i].endYear}</span></td> </tr> </table> <p><strong>Favourite fields of study : </strong>${experience.educations[i].description}</p> </div>''',
            treeSanitizer: html.NodeTreeSanitizer.trusted);
      }

      educationSection.appendHtml('<hr>',
          treeSanitizer: html.NodeTreeSanitizer.trusted);
    }

    if (experience.courses.length > 0) {
      var educationSection = htmlDocument.getElementById('coursesSection');
      educationSection.appendHtml('''<h4 class="heading">Courses</h4>''',
          treeSanitizer: html.NodeTreeSanitizer.trusted);

      for (int i = 0; i < experience.courses.length; i++) {
        educationSection.appendHtml(
            ''' <h5 class="head"><i class="fa fa-square icon-right"></i>${experience.courses[i].degree}</h5> <div style="margin-left: 28px;"> <table style="width: 90%;"> <tr> <td> <p>${experience.courses[i].institute}, ${experience.courses[i].city}</p> </td> <td style="text-align: right; vertical-align: top;"><span class="head">${experience.courses[i].startMonth} ${experience.courses[i].startYear} - ${experience.courses[i].endMonth} ${experience.courses[i].endYear}</span></td> </tr> </table> <p><strong>Favourite fields of study : </strong>${experience.courses[i].description}</p> </div>''',
            treeSanitizer: html.NodeTreeSanitizer.trusted);
      }

      educationSection.appendHtml('<hr>',
          treeSanitizer: html.NodeTreeSanitizer.trusted);
    }

    if (experience.project.length > 0) {
      var educationSection = htmlDocument.getElementById('projectSection');
      educationSection.appendHtml('''<h4 class="heading">Projects</h4>''',
          treeSanitizer: html.NodeTreeSanitizer.trusted);

      for (int i = 0; i < experience.project.length; i++) {
        educationSection.appendHtml(
            ''' <h5 class="head"><i class="fa fa-square icon-right"></i>${experience.project[i].projectName}</h5> <div style="margin-left: 28px;"> <p>${experience.project[i].projectDesc}</p> </div>''',
            treeSanitizer: html.NodeTreeSanitizer.trusted);
      }

      educationSection.appendHtml('<hr>',
          treeSanitizer: html.NodeTreeSanitizer.trusted);
    }

    if (experience.skills.length > 0) {
      var skillsSection = htmlDocument.getElementById('skillsSection');
      skillsSection.appendHtml('''<h4 class="heading">Skills</h4>''',
          treeSanitizer: html.NodeTreeSanitizer.trusted);

      for (int i = 0; i < experience.skills.length; i++) {
        var level = "";
        int c = 0;
        for (int j = 0; j <= experience.skills[i].selectedSkill - 1; j++) {
          level +=
              "<span style='padding-right:20px;'><i class='fa fa-star'></i></span>";
          c++;
        }

        for (int j = c; j < 5; j++) {
          level += "<i class='fa fa-star off' style='padding-right:20px;'></i>";
        }
        skillsSection.appendHtml(
            ''' <span style="display: block; padding: 15px;"> <h5 class="head" style="display: inline;">${experience.skills[i].skill}</h5> <h5 style="display: inline; float: right; vertical-align: middle;padding-right: 20%;"> ${level} </h5> </span> ''',
            treeSanitizer: html.NodeTreeSanitizer.trusted);
      }
      skillsSection.appendHtml('<hr>',
          treeSanitizer: html.NodeTreeSanitizer.trusted);
    }

    if (experience.curriculum.length > 0) {
      var interestsSection = htmlDocument.getElementById('curriculumSection');
      interestsSection.appendHtml(
          '''<div class="gap"></div><h4 class="heading">Extra Curriculum</h4><hr>''',
          treeSanitizer: html.NodeTreeSanitizer.trusted);

      for (int i = 0; i < experience.curriculum.length; i++) {
        interestsSection.appendHtml(
            '''<p><i class="fa fa-square icon-right"></i>${experience.curriculum[i].curriculum}</p>''',
            treeSanitizer: html.NodeTreeSanitizer.trusted);
      }
    }

    if (experience.references.length > 0) {
      var referencesSection = htmlDocument.getElementById('referencesSection');
      referencesSection.appendHtml('''<h4 class="heading">References</h4>''',
          treeSanitizer: html.NodeTreeSanitizer.trusted);

      for (int i = 0; i < experience.references.length; i++) {
        referencesSection.appendHtml(
            ''' <h5 class="head"><i class="fa fa-square icon-right"></i>${experience.references[i].companyName}</h5> <div style="margin-left: 28px;"> <span class="head">${experience.references[i].contactPerson}</span> <table style="width: 90%;"> <tr> <td> <p>${experience.references[i].email}</p> </td> <td style="text-align: right; vertical-align: top;">${experience.references[i].email}</td> </tr> </table> </div> ''',
            treeSanitizer: html.NodeTreeSanitizer.trusted);
      }
    }

    Directory dir = Directory('storage/emulated/0/Resume');
    if (await dir.exists()) {
    } else {
      dir.createSync(recursive: true);
    }
    var targetPath = "storage/emulated/0/Resume";
    var targetFileName = fileName;

    var generatedPdfFile = await FlutterHtmlToPdf.convertFromHtmlContent(
        htmlDocument.head.outerHtml + htmlDocument.body.outerHtml,
        targetPath,
        targetFileName);
    controller.stopDownload();
    Get.back();
    GetSnack('Download Complete', 'PDF Saved inside Resume folder');
  } catch (e) {
    controller.stopDownload();
    GetSnack(
        'Failed', 'Download failed : ${e.toString()} \nPlease try again !!!');
  }
}
