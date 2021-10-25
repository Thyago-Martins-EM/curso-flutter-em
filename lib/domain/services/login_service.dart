import 'package:curso_flutter/domain/entities/login.dart';

abstract class LoginService {
  Future<Login> obtenhaLogin({required String usuario, required String senha});
}
