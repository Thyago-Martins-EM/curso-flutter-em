import 'package:curso_flutter/injector.dart';
import 'package:curso_flutter/presentation/bloc/bloc.dart';
import 'package:curso_flutter/presentation/widgets/widget_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usuarioController = TextEditingController();
  final _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<LoginBloc>(
        create: (context) => getIt(),
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            if (state.isSucesso) {
              BlocProvider.of<ApplicationBloc>(context).add(
                ApplicationLoginEvent(token: state.token!),
              );
            }

            if (state.isErro) {
              WidgetHelper.showError(context, state.erro!);
            }
            return Container(
              color: Colors.black,
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _usuarioController,
                        style: TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          labelText: 'Nome',
                          labelStyle: TextStyle(
                            color: Colors.blue,
                            fontSize: 17,
                          ),
                          suffixIcon: Icon(Icons.person_outline),
                        ),
                      )),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _senhaController,
                        style: TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          labelText: 'Senha',
                          labelStyle: TextStyle(
                            color: Colors.blue,
                            fontSize: 17,
                          ),
                          suffixIcon: Icon(Icons.vpn_key),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.blue,
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () =>
                            BlocProvider.of<LoginBloc>(context).add(
                          LoginPressedButtonEvent(
                            usuario: _usuarioController.text,
                            senha: _senhaController.text,
                          ),
                        ),
                        child: Text(
                          'Realizar login',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
