import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbasicarchitecture/injection_container.dart';
import 'package:flutterbasicarchitecture/presentation/bloc.dart';

class ExamplePage extends StatefulWidget {
  static const routeName = '/example';

  @override
  _ExamplePageState createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  ExampleBloc _exampleBloc;

  @override
  void initState() {
    _exampleBloc = getIt<ExampleBloc>();
    _exampleBloc.add(GetExampleEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ExampleBloc, ExampleState>(
        builder: (BuildContext context, state) {
          if (state is ExampleResultState) {
            return buildLoadedPage(state.result);
          } else if (state is ExampleLoadingState) {
            return buildLoadingPage();
          } else if (state is ExampleErrorState) {
            return buildErrorPage(state.failure.message);
          } else {
            return buildLoadedPage('Initial');
          }
        },
        bloc: _exampleBloc,
      ),
    );
  }

  Widget buildLoadedPage(String exampleText) {
    return _textInCenter('Example: $exampleText');
  }

  Widget buildLoadingPage() {
    return _textInCenter('Loading...');
  }

  Widget buildErrorPage(String errorMessage) {
    return _textInCenter('Error: $errorMessage');
  }

  Widget _textInCenter(String text) {
    return Center(
      child: Text(text),
    );
  }
}
