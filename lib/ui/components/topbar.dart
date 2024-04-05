import 'package:flutter/material.dart';
import 'package:healify/ui/components/text.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
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
          MyText(
              fontsize: 15,
              fontcolor: Colors.black,
              fontweight: FontWeight.w700,
              text: "Hello Jacob!"),
          //W3MAccountButton(service: loginController.w3mService!),
        ],
      ),
    );
  }
}
