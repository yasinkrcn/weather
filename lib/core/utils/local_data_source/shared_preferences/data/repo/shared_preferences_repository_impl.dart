import 'package:weather/core/error/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/shared_preferences_keys.dart';
import '../../domain/repo/shared_preferences_repository.dart';

class SharedPreferencesRepositoryImpl implements SharedPreferencesRepository {
  final SharedPreferences sharedPreferences;

  SharedPreferencesRepositoryImpl(this.sharedPreferences);

  @override
  Future<Either<Failure, String>> getDataFromKey(SharedPreferencesKeys key) async {
    String? value = sharedPreferences.getString(key.sharedKeyStateToKeyValues());
    if (value != null) {
      return Right(value);
    } else {
      return Left(NullPointerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> removeDataFromKey(SharedPreferencesKeys key) async {
    bool isRemoved = await sharedPreferences.remove(key.sharedKeyStateToKeyValues());
    if (isRemoved) {
      return const Right(null);
    } else {
      return Left(NullPointerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> saveDataFromKey(SharedPreferencesKeys key, String data) async {
    bool isAdd = await sharedPreferences.setString(key.sharedKeyStateToKeyValues(), data);
    if (isAdd) {
      return const Right(null);
    } else {
      return Left(NullPointerFailure());
    }
  }
}
