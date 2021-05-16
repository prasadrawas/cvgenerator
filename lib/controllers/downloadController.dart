import 'package:get/get.dart';

class DownloadController extends GetxController {
  bool isDownloading = false;

  startDownload() {
    isDownloading = true;
    update();
  }

  stopDownload() {
    isDownloading = false;
    update();
  }
}
