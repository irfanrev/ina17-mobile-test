import 'package:flutter/material.dart';

@immutable
abstract class HomeNumberEvent {}

class ErrorEvent extends HomeNumberEvent {
  final String error;

  ErrorEvent(this.error);
}


class Deret1Event extends HomeNumberEvent {
  final int nNumber;

  Deret1Event(this.nNumber);
}

class Deret2Event extends HomeNumberEvent {
  final int nNumber;

  Deret2Event(this.nNumber);
}

class Deret3Event extends HomeNumberEvent {
  final int nNumber;

  Deret3Event(this.nNumber);
}

class Deret4Event extends HomeNumberEvent {
  final int nNumber;

  Deret4Event(this.nNumber);
}