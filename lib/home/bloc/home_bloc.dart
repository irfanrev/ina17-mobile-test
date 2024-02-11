import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeNumberBloc extends Bloc<HomeNumberEvent, HomeNumberState> {
  HomeNumberBloc(BuildContext context) : super(HomeNumberState.initialState) {
    on<Deret1Event>((event, emit) {
      String result = '';
      for (int i = 1; i <= event.nNumber; i++) {
        result += i.toString() + ' ';
      }
      emit(state.clone(error: '', result: result));
    });

    on<Deret2Event>((event, emit) {
      String result = '';
      for (int i = 1; i <= event.nNumber; i++) {
        result += i.toString() + ' ';
      }
      for (int i = event.nNumber - 1; i > 0; i--) {
        result += i.toString() + ' ';
      }
      emit(state.clone(error: '', result: result));
    });

    on<Deret3Event>((event, emit) {
      String result = '';
      int current = 1;
      for (int i = 1; i <= event.nNumber; i++) {
        result += (current).toString() + ' ';
        current += i;
      }
      emit(state.clone(error: '', result: result));
    });

    on<Deret4Event>((event, emit) {
      String result = '';
      for (int i = 1; i <= event.nNumber; i++) {
        if (i % 5 == 0) {
          result += 'LIMA' + ' ';
        } else if (i % 7 == 0) {
          result += 'TUJUH' + ' ';
        } else {
          result += i.toString() + ' ';
        }
      }
      emit(state.clone(error: '', result: result));
    });
    
  }

  @override
  void onError(Object error, StackTrace stacktrace) {
    _addErr(error);
    super.onError(error, stacktrace);
  }

  @override
  Future<void> close() async {
    await super.close();
  }

  void _addErr(e) {
    if (e is StateError) return;
    try {
      add(ErrorEvent((e is String)
          ? e
          : (e.message ?? "Something went wrong. Please try again!")));
    } catch (e) {
      add(ErrorEvent("Something went wrong. Please try again!"));
    }
  }
}
