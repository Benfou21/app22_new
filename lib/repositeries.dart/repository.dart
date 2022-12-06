import 'package:riverpod/riverpod.dart';
import 'package:train22/model/B3_selection.dart';
import 'package:train22/model/user.dart';

final UserProvider = StateNotifierProvider<UserNotifier, User>((ref) {
  return UserNotifier();
});

class UserNotifier extends StateNotifier<User> {
  UserNotifier()
      : super(const User(username: "null", uid: "null", email: "null"));
}

final currentB3 = Provider<B3_selection>((ref) => throw UnimplementedError());

final B3SelectionProvider =
    StateNotifierProvider<B3SelectionNotifier, List<B3_selection>>((ref) {
  return B3SelectionNotifier();
});

class B3SelectionNotifier extends StateNotifier<List<B3_selection>> {
  B3SelectionNotifier([List<B3_selection>? state])
      : super([
          B3_selection(name: "Migraine", value: 0),
          B3_selection(name: "Mal de ventre", value: 0),
          B3_selection(name: "Fatigue", value: 0)
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
