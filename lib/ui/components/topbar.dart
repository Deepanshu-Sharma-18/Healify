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
                            "https://scontent.fpnq2-2.fna.fbcdn.net/v/t39.30808-6/349917449_202893469309682_1416512756946642348_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=5f2048&_nc_ohc=5HgwVaLzfgAAb65zEmY&_nc_ht=scontent.fpnq2-2.fna&oh=00_AfAl5ZrNLvvnqCPgdgNcWV0e8HBtjrnSpERuaJQ7ZBJeYg&oe=6615A69A"),
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
