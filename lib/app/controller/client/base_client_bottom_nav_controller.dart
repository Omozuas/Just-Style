import 'package:get/get.dart';

class BaseClientBottomNavController extends GetxController {
  final RxInt _navIndex = 0.obs;
  int get navsIndex => _navIndex.value;
  set setNavIndex(int newValue) {
    _navIndex.value = newValue;
  }
}
