// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:pokemon2/di/di.dart';

import 'package:pokemon2/main.dart';
import 'package:pokemon2/service/common/result.dart';
import 'package:pokemon2/service/data/pokemon_response.dart';
import 'package:pokemon2/service/repo/pokemon_graphql_repo.dart';
import 'package:pokemon2/service/service/graphql_service.dart';
import 'package:pokemon2/service/usecase/get_pokemon_list.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  registerDependencyInjection();
  //
  // testWidgets('Counter increments smoke test', (WidgetTester tester) async {
  //   // HttpOverrides.global = _MyHttpOverrides();
  //   PokemonGraphqlRepo repo = PokemonGraphqlRepo(
  //     service: GraphQLService(
  //       endpoint: "http://127.0.0.1:3007",
  //       timeoutInSeconds: 10,
  //     ),
  //   );
  //   print("object");
  //   var item = await repo.getPokemonList(0, limit: 10);
  //   print(item);
  //   sleep(Duration(seconds: 1120));
  // });

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // var usecase = GetPokemonList();
    // usecase(0);
    // var stream = usecase(0);
    // final completer = Completer<void>();
    //
    // stream.listen(
    //       (event) {
    //     print(event); // prints Loading first, then List<PokemonModel>
    //   },
    //   onDone: () {
    //     completer.complete(); // complete when stream closes
    //   },
    // );
    //
    // // Wait for the stream to close
    // await completer.future;
    // await expectLater(
    //   stream,
    //   emitsInOrder([
    //     isA<Loading>(),              // first emits Loading
    //     isA<List<PokemonModel>>(),   // then emits the list
    //   ]),
    // );
  });
}

