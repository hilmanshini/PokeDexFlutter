import 'package:flutter/material.dart';
import 'package:pokemon2/di/di.dart';
import 'package:pokemon2/pokemon_app.dart' show PokemonAppWidget;

void main() {
  registerDependencyInjection();
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    // Send error to logging service
  };
  runApp(const PokemonAppWidget());
}

