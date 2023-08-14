import 'package:weather/core/error/failure/failure.dart';
import 'package:dartz/dartz.dart';

import '../../../../../usecase/usecase.dart';
import '../entities/shared_preferences_key_params.dart';
import '../repo/shared_preferences_repository.dart';

class RemoveDataFromKey implements Usecase<void, SharedPreferenceKeyParams> {
  final SharedPreferencesRepository repository;

  RemoveDataFromKey(this.repository);

  @override
  Future<Either<Failure, void>> call(params) async {
    return await repository.removeDataFromKey(params.key);
  }
}
