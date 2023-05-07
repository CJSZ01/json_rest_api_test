import 'package:dio/dio.dart';

import 'package:api_test_caio/data/models/user.dart';
import 'package:api_test_caio/data/repository/interface/user_repository_interface.dart';
import 'package:either_dart/either.dart';

class UserRepository implements IUserRepository {
  final path = 'http://192.168.0.107:8080/users';
  @override
  Future<Either<Exception, List<User>>> fetchUsers() async {
    try {
      final response = await Dio(
        BaseOptions(
          connectTimeout: const Duration(seconds: 5),
        ),
      ).get(
        path,
      );
      return Right(
        (response.data as List).map((e) => User.fromMap(e)).toList(),
      );
    } on Exception catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, int>> signUp(User user) async {
    try {
      final response = await Dio().post(
        path,
        data: user.toJson(),
      );
      return Right(response.statusCode ?? 200);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, User>> delete(User user) async {
    try {
      final response = await Dio().delete(
        '$path/${user.id}',
      );
      return Right(
        User.fromMap(response.data),
      );
    } on Exception catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, User>> update(User user) async {
    try {
      final response = await Dio().put(
        '$path/${user.id}',
        data: user.toJson(),
      );
      return Right(
        User.fromMap(response.data),
      );
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
