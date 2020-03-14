import 'package:dartz/dartz.dart';
import 'package:flutterbasicarchitecture/common/utils/failure.dart';
import 'package:flutterbasicarchitecture/domain/repositories/repository.dart';

class SaveExampleUseCase {
  final Repository repository;

  SaveExampleUseCase(this.repository);

  Future<Either<Failure, void>> call(String example) async {
    return await repository.saveExample(example);
  }
}
