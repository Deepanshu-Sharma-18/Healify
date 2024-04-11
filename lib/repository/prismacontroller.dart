import 'package:get/get.dart';
import 'package:healify/generated_dart_client/client.dart';

class PrismaContrller extends GetxController {
  final prisma = PrismaClient();

  @override
  void dispose() {
    super.dispose();
    prisma.$disconnect();
  }
}
