
import 'package:dartz/dartz.dart';
import 'package:flutterbasicarchitecture/common/utils/failure.dart';

abstract class Repository {
  ///Example
  Future<Either<Failure, String>> getExample();
  Future<Either<Failure, void>> saveExample(String example);
}