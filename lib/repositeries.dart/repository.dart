import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:riverpod/riverpod.dart';
import 'package:train22/model/B3_selection.dart';
import 'package:train22/model/sendState.dart';
import 'package:train22/model/user.dart';

final UserProvider = StateNotifierProvider<UserNotifier, User>((ref) {
  return UserNotifier();
});

class UserNotifier extends StateNotifier<User> {
  UserNotifier()
      : super(const User(username: "null", uid: "null", email: "null"));
}

final currentB3 = Provider<B3_selection>((ref) => throw UnimplementedError());

final counter = StateProvider((ref) => 0);

final SendStateProvider =
    StateNotifierProvider<SendStateNotifier, SendState>((ref) {
  return SendStateNotifier();
});

class SendStateNotifier extends StateNotifier<SendState> {
  SendStateNotifier([SendState? state])
      : super(SendState(date: DateFormat('yyyy-MM-dd').format(DateTime.now())));

  void update() {
    final now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(now);

    if (state.date != formatted) {
      state.statue = false;
      state.date = formatted;

      //state = state;
    }
  }

  void change() {
    final now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(now);
    state.statue = true;
    state.date = formatted;
    //state = state;
  }
}

final B3SelectionProvider =
    StateNotifierProvider<B3SelectionNotifier, List<B3_selection>>((ref) {
  return B3SelectionNotifier();
});

class B3SelectionNotifier extends StateNotifier<List<B3_selection>> {
  B3SelectionNotifier([List<B3_selection>? state])
      : super([
          B3_selection(
              name: "Migraine",
              value: 0,
              icon: Icons.face,
              titles: ["rien", "peu", "beaucoup"]),
          B3_selection(
              name: "Mal de ventre",
              value: 0,
              icon: Icons.healing,
              titles: ["rien", "peu", "beaucoup"]),
          B3_selection(
              name: "Fatigue",
              value: 0,
              icon: Icons.healing_outlined,
              titles: ["peu", "normal", "beaucoup"]),
          B3_selection(
              name: "Eau",
              value: 0,
              icon: Icons.water,
              titles: ["peu", "moyen", "beaucoup"]),
          B3_selection(
              name: "Café",
              value: 0,
              icon: Icons.coffee,
              titles: ["peu", "moyen", "beaucoup"]),
          B3_selection(
              name: "Equilibre",
              value: 0,
              icon: Icons.food_bank,
              titles: ["peu", "moyen", "équilibré"]),
          B3_selection(
              name: "Quantité",
              value: 0,
              icon: Icons.food_bank_outlined,
              titles: ["peu", "normal", "beaucoup"]),
          B3_selection(
              name: "Cours",
              value: 0,
              icon: Icons.class_,
              titles: ["non", "oui"]),
          B3_selection(
              name: "Révision",
              value: 0,
              icon: Icons.book,
              titles: ["non", "oui"]),
          B3_selection(
              name: "Repos", value: 0, icon: Icons.bed, titles: ["non", "oui"]),
          B3_selection(
              name: "Sport",
              value: 0,
              icon: Icons.sports,
              titles: ["non", "oui"]),
        ]);

  void add(B3_selection s) async {
    state = [...state, s];
  }

  void change(value, B3_selection b3) {
    state.forEach((element) {
      if (element.name == b3.name) {
        element.value = value;
      }
    });

    state = [...state];

    b3.value = value;
  }
}
