import 'package:weather/core/error/failure/failure.dart';
import 'package:dartz/dartz.dart';
import '../../../../../usecase/usecase.dart';
import '../entities/shared_preferences_key_params.dart';
import '../repo/shared_preferences_repository.dart';

class GetDataFromKey implements Usecase<String, SharedPreferenceKeyParams> {
  SharedPreferencesRepository repository;

  GetDataFromKey(this.repository);

  @override
  Future<Either<Failure, String>> call(params) async {
    return await repository.getDataFromKey(params.key);
  }
}
