import 'package:curso_flutter/domain/entities/login.dart';
import 'package:curso_flutter/domain/services/login_service.dart';

class LoginServiceImpl extends LoginService {
  @override
  Future<Login> obtenhaLogin(
      {required String usuario, required String senha}) async {
    if (usuario == 'thyago' && senha == '123456') {
      return Login(usuario: usuario, senha: senha, token: 'token');
    }

    throw Exception("Login inválido");
  }
}
