import 'package:fpdart/fpdart.dart';
import 'package:vir/core/common/common_model.dart';
import 'package:vir/core/error/failures.dart';
import 'package:vir/features/auth/data/model/login_model.dart';


abstract interface class AuthRepository{
  Future<Either<Failure,LoginModel>> loginApi({required String data});
  Future<Either<Failure,CommonModel>> forgetPasswordApi({required String data});

}