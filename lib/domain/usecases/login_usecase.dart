import 'package:curso_flutter/domain/entities/login.dart';
import 'package:curso_flutter/domain/erros/failure.dart';
import 'package:curso_flutter/domain/services/login_service.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase {
  final LoginService loginService;

  LoginUseCase({required this.loginService});

  Future<Either<Failure, Login>> realizeLogin(
      {required String usuario, required String senha}) async {
    if (usuario.isEmpty || senha.isEmpty) {
      return Left(ErroLogin(mensagem: 'Informe login e senha'));
    }

    try {
      var login =
          await loginService.obtenhaLogin(usuario: usuario, senha: senha);
      return Right(login);
    } catch (ex) {
      return Left(ErroLogin(mensagem: ex.toString()));
    }
  }
}
