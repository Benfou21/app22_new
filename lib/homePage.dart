import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'repositeries.dart/repository.dart';

import 'model/B3_selection.dart';

import 'package:google_fonts/google_fonts.dart';
import 'utils/constants.dart';

import 'utils/styleButton.dart';
import 'utils/cards.dart';
import 'utils/lines.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Consumer(builder: (context, ref, child) {
        List<B3_selection> list = ref.watch(B3SelectionProvider);
        return Column(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: kOrange_main4,
                ),
                child: Stack(
                  children: [
                    const Positioned(
                      top: 40,
                      right: 10,
                      child: StyleButton1('/list_page'),
                    ),
                    Align(
                      alignment: const Alignment(0, 1),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 35),
                        child: Text(
                          "App 22",
                          style: GoogleFonts.raleway(textStyle: kHeadline),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const LineDivider(),
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: list
                    .map(
                      (b3) => ProviderScope(
                          overrides: [currentB3.overrideWithValue(b3)],
                          child: B3_card(scaffoldKey: scaffoldKey)),
                    )
                    .toList(),
              ),
            ),
            Expanded(flex: 3, child: ListView(children: []))
          ],
        );
      }),
    );
  }
}
