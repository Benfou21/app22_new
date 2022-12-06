import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
          return Column(
            children: [
              Expanded(
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
        title: Text(selection.name + " " + selection.value.toString()),
      );
    });
  }
}
