import 'package:api_test_caio/data/models/user.dart';
import 'package:either_dart/either.dart';

abstract class IUserRepository {
  Future<Either<Exception, List<User>>> fetchUsers();
  Future<Either<Exception, int>> signUp(User user);
  Future<Either<Exception, User>> update(User user);
  Future<Either<Exception, User>> delete(User user);
}
