import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutterbasicarchitecture/presentation/example_bloc/example_page.dart';

import '../bloc.dart';
import 'nav_event.dart';

class NavBloc extends Bloc<NavEvent, dynamic> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  dynamic get initialState => 0;

  @override
  Stream<dynamic> mapEventToState(NavEvent event) async* {
    if (event is NavPop) {
      navigatorKey.currentState.pop();
    } else if (event is NavToExampleEvent) {
      navigatorKey.currentState
          .pushNamed(ExamplePage.routeName, arguments: event.args);
    }
  }

  ///Nav bloc state handler
  MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    print('build route for ${settings.name}');
    print('args  ${settings.arguments}');

    List<Object> argsList = settings.arguments as List<Object>;

    var routes = <String, WidgetBuilder>{
      ExamplePage.routeName: (context) => ExamplePage(),
    };
    WidgetBuilder builder = routes[settings.name];
    return MaterialPageRoute(builder: (ctx) => builder(ctx));
  }
}
