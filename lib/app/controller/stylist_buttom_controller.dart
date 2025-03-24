import 'package:get/get.dart';

class StylistButtomController extends GetxController {
  RxInt navIndex = 0.obs;
  int get navsIndex => navIndex.value;
  set setNavIndex(int newValue) {
    navIndex.value = newValue;
  }
}
