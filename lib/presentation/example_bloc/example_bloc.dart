import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutterbasicarchitecture/common/utils/failure.dart';
import 'package:flutterbasicarchitecture/domain/usecases/example/get_example_usecase.dart';

import '../bloc.dart';

class ExampleBloc extends Bloc<ExampleEvent, ExampleState> {
  final GetExampleUseCase getExampleUseCase;

  ExampleBloc(this.getExampleUseCase);

  @override
  ExampleState get initialState => InitialExampleBlocState();

  @override
  Stream<ExampleState> mapEventToState(
    ExampleEvent event,
  ) async* {
    if (event is GetExampleEvent) {
      final failureOrResult = await getExampleUseCase();
      yield* _resultOrFailure(failureOrResult);
    }
  }

  Stream<ExampleState> _resultOrFailure(
      Either<Failure, String> failureOrResult) async* {
    yield failureOrResult.fold(
      (failure) => ExampleErrorState(failure),
      (result) => ExampleResultState(result),
    );
  }
}
