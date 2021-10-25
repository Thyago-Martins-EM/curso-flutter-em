class ApplicationSate {
  final bool isInicializado;
  final bool isCarregando;
  final bool isAutenticado;
  final bool isDesautenticado;

  ApplicationSate({
    required this.isInicializado,
    required this.isCarregando,
    required this.isAutenticado,
    required this.isDesautenticado,
  });

  factory ApplicationSate.inicializando() {
    return ApplicationSate(
      isInicializado: true,
      isCarregando: false,
      isAutenticado: false,
      isDesautenticado: false,
    );
  }

  factory ApplicationSate.carregando() {
    return ApplicationSate(
      isInicializado: false,
      isCarregando: true,
      isAutenticado: false,
      isDesautenticado: false,
    );
  }

  factory ApplicationSate.autenticando() {
    return ApplicationSate(
      isInicializado: false,
      isCarregando: false,
      isAutenticado: true,
      isDesautenticado: false,
    );
  }

  factory ApplicationSate.desautenticando() {
    return ApplicationSate(
      isInicializado: false,
      isCarregando: false,
      isAutenticado: false,
      isDesautenticado: true,
    );
  }
}
