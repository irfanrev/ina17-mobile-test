import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ina17_test/home/bloc/home_bloc.dart';
import 'package:ina17_test/home/bloc/home_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeNumberBloc(context),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeNumberView(),
        theme: ThemeData(
          useMaterial3: true,
        ),
      ),
    );
  }
}
