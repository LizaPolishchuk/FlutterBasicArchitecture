import 'package:dartz/dartz.dart';
import 'package:flutterbasicarchitecture/common/utils/failure.dart';
import 'package:flutterbasicarchitecture/domain/repositories/repository.dart';

class GetExampleUseCase {
  final Repository repository;

  GetExampleUseCase(this.repository);

  Future<Either<Failure, String>> call() async {
    return await repository.getExample();
  }
}
