import 'package:flutter/material.dart';

class PokemonBackButtonDispatcher extends BackButtonDispatcher {
  final BuildContext context;

  PokemonBackButtonDispatcher(this.context);

  @override
  Future<bool> didPopRoute() async {
    if (Navigator.canPop(context)) {
      return true;
    }
    return true;
  }
}