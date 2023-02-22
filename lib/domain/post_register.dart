import 'package:chopper/chopper.dart';
import 'package:either_dart/either.dart';
import 'package:vita_client_app/data/model/entity/user.dart';
import 'package:vita_client_app/data/model/request/register_request.dart';

abstract class PostRegister {
  Future<Either<Response, User>> call(RegisterRequest request);
}
