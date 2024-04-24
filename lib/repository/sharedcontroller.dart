import 'package:get/get.dart';
import 'package:healify/ui/screens/metamask/LoginController.dart';
import 'package:healify/ui/screens/profile/profile.dart';

class SharedRecordsController extends GetxController {
  var profileController = Get.find<ProfileController>();
  var loginController = Get.find<LoginController>();
}
