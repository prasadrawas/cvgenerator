import 'package:cvmaker/controllers/downloadController.dart';
import 'package:cvmaker/my_widgets.dart';
import 'package:cvmaker/pdf_generation.dart';
import 'package:cvmaker/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class GenerateDocument extends StatelessWidget {
  final _personalDetails;
  final _experience;
  GenerateDocument(this._personalDetails, this._experience);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GetHeader(height, width, 'Generate Resume', 1.0),
              Padding(
                padding: EdgeInsets.all(height * 0.020),
                child: Text(
                  'Select Design',
                  style: TextStyle(
                    fontSize: height * 0.025,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                childAspectRatio: 0.65,
                children: [
                  pdfOptions(
                      height,
                      width,
                      'Berlin',
                      'assets/images/Berlin.png',
                      '#000',
                      '#e9e9e9',
                      generateRioPDF),
                  pdfOptions(
                      height,
                      width,
                      'Bogota',
                      'assets/images/Bogota.png',
                      '#fff',
                      '#1f4e72',
                      generateRioPDF),
                  pdfOptions(
                      height,
                      width,
                      'Denver',
                      'assets/images/Denver.png',
                      '#fff',
                      '#26313d',
                      generateRioPDF),
                  pdfOptions(
                      height,
                      width,
                      'Moscow',
                      'assets/images/Moscow.png',
                      '#fff',
                      '#53315a',
                      generateRioPDF),
                  pdfOptions(
                      height,
                      width,
                      'Helsinki',
                      'assets/images/Helsinki.png',
                      '#fff',
                      '#1f2934',
                      generateBerlinPDF),
                  pdfOptions(
                      height,
                      width,
                      'Nairobi',
                      'assets/images/Nairobi.png',
                      '#fff',
                      '#0f5244',
                      generateBerlinPDF),
                  pdfOptions(height, width, 'Rio', 'assets/images/Rio.png',
                      '#fff', '#53315a', generateBerlinPDF),
                  pdfOptions(height, width, 'Tokyo', 'assets/images/Tokyo.png',
                      '#fff', '#174363', generateBerlinPDF),
                  pdfOptions(height, width, 'Oslo', 'assets/images/Oslo.png',
                      '#000', '#e9e9e9', generateBerlinPDF),
                  pdfOptions(
                      height,
                      width,
                      'Ariadna',
                      'assets/images/Ariadna.png',
                      '#fff',
                      '#20693d',
                      generateOsloPDF),
                  pdfOptions(height, width, 'Julia', 'assets/images/Julia.png',
                      '#fff', '#4b255a', generateOsloPDF),
                  pdfOptions(
                      height,
                      width,
                      'Marsella',
                      'assets/images/Marsella.png',
                      '#fff',
                      '#174363',
                      generateOsloPDF),
                  pdfOptions(
                      height,
                      width,
                      'Martin',
                      'assets/images/Martin.png',
                      '#fff',
                      '#1f2934',
                      generateOsloPDF),
                  pdfOptions(height, width, 'Cesar', 'assets/images/Cesar.png',
                      '#fff', '#fff', generateOsloPDF),
                  pdfOptions(
                      height,
                      width,
                      'Monica',
                      'assets/images/Monica.png',
                      '#212f3c',
                      '#17202a',
                      generateRawPDF),
                  pdfOptions(
                      height,
                      width,
                      'Alicia',
                      'assets/images/Alicia.png',
                      '#21804b',
                      '#185934',
                      generateRawPDF),
                  pdfOptions(
                      height,
                      width,
                      'Arturo',
                      'assets/images/Arturo.png',
                      '#26618b',
                      '#164363',
                      generateRawPDF),
                  pdfOptions(
                      height,
                      width,
                      'Raquel',
                      'assets/images/Raquel.png',
                      '#53315a',
                      '#341b44',
                      generateRawPDF),
                ],
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

  Widget pdfOptions(
      height, width, title, imgPath, textColor, bgColor, generator) {
    return InkWell(
      onTap: () {
        ImageDialogBox(title, imgPath, textColor, bgColor, generator, height);
      },
      child: Container(
        padding: EdgeInsets.all(height * 0.010),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.8),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  imgPath,
                  height: height * 0.3,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4),
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget ImageDialogBox(String title, String imgPath, String textColor,
      String bgColor, generator, height) {
    Get.defaultDialog(
      backgroundColor: Colors.transparent,
      title: title,
      content: GetBuilder<DownloadController>(builder: (controller) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: height * 0.5,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        imgPath,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: controller.isDownloading,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ElevatedButton.icon(
                onPressed: controller.isDownloading
                    ? () {
                        controller.stopDownload();
                        Get.back();
                      }
                    : () async {
                        if (await checkInternetConnection()) {
                          GetStoragePermission().then((value) {
                            controller.startDownload();
                            generator(_personalDetails, _experience, textColor,
                                bgColor, title, controller);
                          });
                        } else {
                          GetSnack('Connection Error',
                              'Please check your Internet Connection');
                        }
                      },
                icon: Icon(
                  controller.isDownloading
                      ? Icons.clear
                      : FontAwesomeIcons.download,
                  size: 10,
                ),
                label: Text(controller.isDownloading
                    ? 'Cancel Download'
                    : 'Download PDF'),
              ),
            ),
          ],
        );
      }),
    );
  }
}
