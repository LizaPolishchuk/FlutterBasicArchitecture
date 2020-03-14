import 'package:flutterbasicarchitecture/domain/usecases/example/get_example_usecase.dart';
import 'package:flutterbasicarchitecture/domain/usecases/example/save_example_usecase.dart';
import 'package:flutterbasicarchitecture/presentation/example_bloc/example_bloc.dart';
import 'package:flutterbasicarchitecture/presentation/nav_bloc/nav_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/datasources/local_data_source.dart';
import 'data/repositories/repository_impl.dart';
import 'domain/repositories/repository.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  ///Bloc
  getIt.registerFactory(() => ExampleBloc(getIt()));
  getIt.registerLazySingleton(() => NavBloc());
  
  ///Use Cases
  getIt.registerLazySingleton(() => GetExampleUseCase(getIt()));
  getIt.registerLazySingleton(() => SaveExampleUseCase(getIt()));

  ///Repository
  getIt.registerLazySingleton<Repository>(() => RepositoryImpl(
        localDataSource: getIt(),
      ));

  ///Data sources
  getIt.registerLazySingleton<LocalDataSource>(
      () => LocalDataSourceImpl(getIt()));

  ///External
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);
}
