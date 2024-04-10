import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healify/ui/components/text.dart';
import 'package:healify/ui/screens/metamask/LoginController.dart';
import 'package:web3modal_flutter/web3modal_flutter.dart';
import 'package:web3modal_flutter/widgets/w3m_account_button.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    var loginController = Get.find<LoginController>();
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      image: const DecorationImage(
                        image: NetworkImage(
                          "https://images.saymedia-content.com/.image/c_limit%2Ccs_srgb%2Cq_auto:eco%2Cw_700/MTk4MDQzMTI5NzY3NTM1ODA2/short-captions-for-profile-pictures.webp",
                        ),
                      ),
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 120,
                    child: MyText(
                      fontsize: 15,
                      fontcolor: Colors.black,
                      fontweight: FontWeight.w500,
                      text: "Hello Jacob!",
                    ),
                  ),
                ],
              ),
            ],
          ),
          W3MAccountButton(
            service: loginController.w3mService!,
            size: BaseButtonSize.small,
          ),
        ],
      ),
    );
  }
}
