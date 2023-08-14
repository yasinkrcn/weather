import 'package:dartz/dartz.dart';

import '../../../../../error/failure/failure.dart';
import '../../../../../usecase/usecase.dart';
import '../entities/shared_preferences_key_with_value_params.dart';
import '../repo/shared_preferences_repository.dart';

class SaveDataFromKey implements Usecase<void, SharedPreferenceKeyWithValueParams> {
  final SharedPreferencesRepository repository;

  SaveDataFromKey(this.repository);

  @override
  Future<Either<Failure, void>> call(params) async {
    return await repository.saveDataFromKey(params.key, params.value);
  }
}
