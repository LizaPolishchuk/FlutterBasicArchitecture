import 'package:flutterbasicarchitecture/common/utils/failure.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ExampleState {}

class InitialExampleBlocState extends ExampleState {}

class ExampleLoadingState extends ExampleState {}

class ExampleResultState extends ExampleState {
  final String result;

  ExampleResultState(this.result);
}

class ExampleErrorState extends ExampleState {
  final Failure failure;

  ExampleErrorState(this.failure);
}
