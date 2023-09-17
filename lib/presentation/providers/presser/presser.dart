import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'presser.g.dart';
part 'presser_state.dart';

@riverpod
class Presser extends _$Presser {

  /// THIS IS USED FOR LAZY LOADING
  /// CALLED ONLY ONCE or on provider dispose
  @override
  PresserState build() {
    log("INITIATING ... PRESSER STATE ");
    return PresserState(11,11);
  }

  void pressButton(String buttonName) {
    state = state._incrementPressCount(buttonName);
  }


}
