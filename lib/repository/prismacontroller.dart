import 'package:get/get.dart';
import 'package:healify/generated_dart_client/client.dart';

class PrismaController extends GetxController {
  final prisma = PrismaClient();

  @override
  void dispose() {
    super.dispose();
    prisma.$disconnect();
  }
}
