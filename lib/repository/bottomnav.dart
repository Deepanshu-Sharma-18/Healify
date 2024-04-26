import 'package:get/get.dart';

class BottomNavController extends GetxController {
  RxInt _active = 0.obs;
  int get active => _active.value;

  void updateActive(int num) {
    _active.value = num;
  }
}
