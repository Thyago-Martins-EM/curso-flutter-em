import 'package:curso_flutter/data/services/login_service_impl.dart';
import 'package:curso_flutter/domain/services/login_service.dart';
import 'package:curso_flutter/domain/usecases/login_usecase.dart';
import 'package:curso_flutter/presentation/bloc/bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerFactory(() => LoginBloc(loginUseCase: getIt()));
  getIt.registerFactory(() => LoginUseCase(loginService: getIt()));

  getIt.registerFactory<LoginService>(() => LoginServiceImpl());
}
