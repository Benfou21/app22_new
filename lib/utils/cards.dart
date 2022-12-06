import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:train22/repositeries.dart/repository.dart';
import 'package:train22/model/B3_selection.dart';
import 'RoundedButton.dart';
import 'showPicker.dart';

class B3_card extends StatelessWidget {
  const B3_card({Key? key, required this.scaffoldKey}) : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: ((context, ref, child) {
        B3_selection b3 = ref.watch(currentB3);

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: RoundedButton(
            colour: Color.fromARGB(255, 223, 212, 212),
            title: "${b3.name} ${b3.value}",
            coleurText: Colors.black,
            onPressed: () {
              showPickerIcons(context, scaffoldKey, ref, b3);
            },
          ),
        );
      }),
    );
  }
}
