import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'presser.g.dart';
part 'presser_state.dart';

@riverpod
class Presser extends _$Presser {

  static final PresserState _defaultState =  PresserState(0,0);

  /// THIS IS USED FOR LAZY LOADING
  /// CALLED ONLY ONCE or on provider dispose
  @override
  PresserState build() {
    log("INITIATING ... PRESSER STATE ");
    return _defaultState;
  }

  void pressButton(String buttonName) {
    state = state._incrementPressCount(buttonName);
  }


}
