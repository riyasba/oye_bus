import 'package:get/get.dart';

class OnbordingController extends GetxController {
  //TODO: Implement OnbordingController

 final _index = 0.obs;
  final _isLastPage = false.obs;

  int get index => _index.value;
  bool get isLastPage => _isLastPage.value;

  void setIndex(int currentIndex) {
    _index.value = currentIndex;
  }

  bool checkLastPage() {
    if (_index.value == 2) {
      _isLastPage.value = true;
      return true;
    } else {
      return false;
    }
  }
}
