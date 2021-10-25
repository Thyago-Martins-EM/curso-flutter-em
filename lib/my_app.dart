import 'package:curso_flutter/presentation/bloc/bloc.dart';
import 'package:curso_flutter/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ApplicationBloc _appBloc;

  @override
  void initState() {
    _appBloc = ApplicationBloc(ApplicationSate.inicializando());
    _appBloc.add(ApplicationStartEvent(context: context));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ApplicationBloc>(
      create: (context) => _appBloc,
      child: MaterialApp(
        title: 'Meu app',
        home: BlocBuilder<ApplicationBloc, ApplicationSate>(
          builder: (context, state) {
            if (state.isAutenticado) {
              return Container();
            }
            return LoginScreen();
          },
        ),
      ),
    );
  }
}
