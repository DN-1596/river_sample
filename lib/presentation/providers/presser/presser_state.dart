

part of 'presser.dart';

class PresserState {

  final int button1PressCount;
  final int button2PressCount;

  PresserState(this.button1PressCount, this.button2PressCount);

  PresserState _incrementPressCount(String buttonName) {
    int inc1 = button1PressCount;
    int inc2= button2PressCount;
    switch (buttonName) {
      case "button1":
        inc1++;
        break;
      case "button2":
        inc2++;
        break;
      default:
        print("UNKNOWN PRESS ");
    }
    return PresserState(inc1, inc2);
  }
}