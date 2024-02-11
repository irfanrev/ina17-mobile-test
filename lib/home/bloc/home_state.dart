import 'package:flutter/material.dart';

@immutable
class HomeNumberState {
  final String error;
  final String result;

  HomeNumberState({
    required this.error,
    required this.result,
  });

  static HomeNumberState get initialState => HomeNumberState(
        error: '',
        result: '',
      );

  HomeNumberState clone({
    required String error,
    required String result,
  }) {
    return HomeNumberState(
      error: error ?? this.error,
      result: result ?? this.result,
    );
  }
}
