import 'package:flutter/material.dart';
import 'package:flutterbasicarchitecture/domain/usecases/example/save_example_usecase.dart';
import 'package:flutterbasicarchitecture/presentation/bloc.dart';
import 'package:flutterbasicarchitecture/presentation/nav_bloc/nav_bloc.dart';

import 'injection_container.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ///Init Dependency Injection
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      ///Setup own navigator key and onGenerateRoute from NavBloc
      navigatorKey: getIt<NavBloc>().navigatorKey,
      onGenerateRoute: getIt<NavBloc>().onGenerateRoute,

      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final  String routeName = "/home_page";

  NavBloc navBloc;
  SaveExampleUseCase saveExampleUseCase;

  @override
  void initState() {
    super.initState();
    navBloc = getIt<NavBloc>();
    saveExampleUseCase = getIt<SaveExampleUseCase>();
  }

  void _pressButton() {
    final String currentTime = new DateTime.now().toString();
    saveExampleUseCase(currentTime).then((onValue){
      navBloc.add(NavToExampleEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Base architecture'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Open Example page'),
          onPressed: _pressButton,
        ),
      ),
    );
  }
}
