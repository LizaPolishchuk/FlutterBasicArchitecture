import 'package:dartz/dartz.dart';
import 'package:flutterbasicarchitecture/common/utils/failure.dart';
import 'package:flutterbasicarchitecture/data/datasources/local_data_source.dart';
import 'package:flutterbasicarchitecture/domain/repositories/repository.dart';

class RepositoryImpl implements Repository {
  LocalDataSource localDataSource;

  RepositoryImpl({this.localDataSource});

  @override
  Future<Either<Failure, String>> getExample() async {
    try {
      return Right(await localDataSource.getExample());
    } on Error {
    return Left(Failure(0, "Get example failure"));
    }
  }

  @override
  Future<Either<Failure, void>> saveExample(String example) async {
    try {
      return Right(await localDataSource.saveExample(example));
    } on Error {
    return Left(Failure(0, "Save example failure"));
    }
  }
}
