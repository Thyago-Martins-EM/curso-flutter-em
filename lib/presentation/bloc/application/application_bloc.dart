import 'package:curso_flutter/presentation/bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationSate> {
  ApplicationBloc(ApplicationSate initialState) : super(initialState);

  static String _token = "";

  @override
  Stream<ApplicationSate> mapEventToState(ApplicationEvent event) async* {
    if (event is ApplicationStartEvent) {
      yield ApplicationSate.desautenticando();
    } else {
      yield ApplicationSate.autenticando();
    }
    if (event is ApplicationLoginEvent) {
      _token = event.token;
      yield ApplicationSate.autenticando();
    }
  }
}
