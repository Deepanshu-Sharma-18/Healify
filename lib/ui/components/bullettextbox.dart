import 'package:flutter/material.dart';

class BulletListInput extends StatefulWidget {
  @override
  _BulletListInputState createState() => _BulletListInputState();
}

class _BulletListInputState extends State<BulletListInput> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _bullets = [];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _updateBullets() {
    final lines = _controller.text.split('\n');
    final bullets = lines
        .where((line) => line.startsWith('-'))
        .map((line) => line.substring(1).trim())
        .toList();

    setState(() {
      _bullets.clear();
      _bullets.addAll(bullets);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Column(
        children: [
          TextField(
            controller: _controller,
            maxLines: null,
            decoration:
                InputDecoration(hintText: "Enter text with '-' for bullets"),
            onChanged: (text) => _updateBullets(),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _bullets.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text('•'),
                  title: Text(_bullets[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
