import 'package:flutter/material.dart';

abstract class ApplicationEvent {}

class ApplicationStartEvent extends ApplicationEvent {
  final BuildContext context;

  ApplicationStartEvent({required this.context});
}

class ApplicationLoginEvent extends ApplicationEvent {
  final String token;

  ApplicationLoginEvent({required this.token});
}
