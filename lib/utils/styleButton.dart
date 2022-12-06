import 'package:flutter/material.dart';

class StyleButton1 extends StatelessWidget {
  const StyleButton1(this.route, {Key? key}) : super(key: key);
  final String route;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(
          const EdgeInsets.all(15),
        ),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: const BorderSide(color: Colors.red),
          ),
        ),
      ),
      onPressed: () {
        Navigator.of(context).pushNamed(route);
      },
      child: const Text(
        "Selection",
        style: TextStyle(fontSize: 14),
      ),
    );
  }
}
