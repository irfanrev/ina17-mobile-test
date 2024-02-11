import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ina17_test/home/bloc/home_event.dart';
import 'package:ina17_test/home/components/custom_button.dart';
import 'package:ina17_test/home/components/custom_textfield.dart';

import 'home_bloc.dart';
import 'home_state.dart';

class HomeNumberProvider extends BlocProvider<HomeNumberBloc> {
  HomeNumberProvider({
    required Key key,
  }) : super(
          key: key,
          create: (context) => HomeNumberBloc(context),
          child: HomeNumberView(),
        );
}

class HomeNumberView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final homeBloc = BlocProvider.of<HomeNumberBloc>(context);
    final TextEditingController _controller = TextEditingController();

    final scaffold = Scaffold(
      appBar: AppBar(
        title: Text('Ina17 Mobile Test'),
      ),
      body: BlocBuilder<HomeNumberBloc, HomeNumberState>(
        buildWhen: (pre, current) => true,
        builder: (context, state) {
          return Padding(
            padding: !kIsWeb
                ? EdgeInsets.all(16.0)
                : EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.1,
                    vertical: MediaQuery.of(context).size.height * 0.05,
                  ),
            child: Column(
              children: [
                CustomTextfield(
                    controller: _controller, title: 'Masukkan Nomor/N'),
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  child: Row(
                    children: [
                      CustomButton(
                        text: '1',
                        onTap: () {
                          String inputValue = _controller.text;
                          context
                              .read<HomeNumberBloc>()
                              .add(Deret1Event(int.parse(inputValue)));
                        },
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      CustomButton(
                        text: '2',
                        onTap: () {
                          String inputValue = _controller.text;
                          context
                              .read<HomeNumberBloc>()
                              .add(Deret2Event(int.parse(inputValue)));
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  width: double.infinity,
                  child: Row(
                    children: [
                      CustomButton(
                        text: '3',
                        onTap: () {
                          String inputValue = _controller.text;
                          context
                              .read<HomeNumberBloc>()
                              .add(Deret3Event(int.parse(inputValue)));
                        },
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      CustomButton(
                        text: '4',
                        onTap: () {
                          String inputValue = _controller.text;
                          context
                              .read<HomeNumberBloc>()
                              .add(Deret4Event(int.parse(inputValue)));
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Result:',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.start,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(18),
                      child: BlocBuilder<HomeNumberBloc, HomeNumberState>(
                        buildWhen: (prev, current) =>
                            prev.result != current.result,
                        builder: (context, state) {
                          if (state.result.isNotEmpty) {
                            return Text(
                              state.result,
                              style: TextStyle(fontSize: 18),
                            );
                          } else {
                            return Text(
                              'No result yet',
                              style: TextStyle(fontSize: 18),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );

    return MultiBlocListener(
      listeners: [
        BlocListener<HomeNumberBloc, HomeNumberState>(
          listenWhen: (pre, current) => pre.error != current.error,
          listener: (context, state) {
            if (state.error?.isNotEmpty ?? false)
              print("ERROR: ${state.error}");
          },
        ),
      ],
      child: scaffold,
    );
  }
}
