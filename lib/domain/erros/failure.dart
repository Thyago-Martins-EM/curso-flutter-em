abstract class Failure implements Exception {
  String get mensagem;
}

class ErroLogin extends Failure {
  final String mensagem;
  ErroLogin({required this.mensagem});
}
