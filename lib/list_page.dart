import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:train22/model/sendState.dart';
import 'package:train22/repositeries.dart/auth_methods.dart';
import 'package:dialogs/dialogs.dart';
import 'package:train22/utils/functions.dart';

import 'Utils/constants.dart';

import 'model/B3_selection.dart';
import 'repositeries.dart/repository.dart';

class List_page extends StatelessWidget {
  const List_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Consumer(builder: (context, ref, child) {
            return IconButton(
              onPressed: () {
                ref.refresh(B3SelectionProvider.notifier);
              },
              icon: const Icon(Icons.restore),
            );
          }),
        ],
        title: const Text("Selections"),
        centerTitle: true,
        backgroundColor: kOrange_main,
      ),
      body: Consumer(
        builder: (context, ref, child) {
          SendState statue = ref.watch(SendStateProvider);
          int count = ref.watch(counter);
          ref.read(SendStateProvider.notifier).update();
          return Column(
            children: [
              Expanded(
                flex: 6,
                child: ListView(
                  children: [
                    ...ref
                        .watch(B3SelectionProvider)
                        .map(
                          (selection) => ProviderScope(
                            overrides: [currentB3.overrideWithValue(selection)],
                            child: const favBow(),
                          ),
                        )
                        .toList(),
                  ],
                ),
              ),
              Expanded(
                  child: Column(
                children: [
                  TextButton(
                    child: Text("Send"),
                    onPressed: () async {
                      List<B3_selection> list = ref.watch(B3SelectionProvider);
                      try {
                        String res = await AuthMethods().saveData(list: list);
                        if (res == "success") {
                          MessageDialog message = MessageDialog(
                            message: "Selections envoyées",
                            title: "Succées",
                          );
                          message.show(context);
                          ref.read(counter.notifier).state++;
                          ref.read(SendStateProvider.notifier).change();
                        } else {
                          print(res);
                          MessageDialog message = MessageDialog(
                            message: res,
                            title: "Erreur",
                          );
                          message.show(context);
                        }
                      } catch (e) {
                        MessageDialog message = MessageDialog(
                          message: e.toString(),
                          title: "Error",
                        );
                        message.show(context);
                      }
                    },
                  ),
                  Icon(statue.statue == true ? Icons.verified : null),
                ],
              ))
            ],
          );
        },
      ),
    );
  }
}

class favBow extends StatelessWidget {
  const favBow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final selection = ref.watch(currentB3);
      return ListTile(
        title: Text(selection.name + " : " + selection.titles[selection.value]),
        leading: Icon(selection.icon),
      );
    });
  }
}
