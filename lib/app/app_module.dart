import 'package:desafio_natal/app/app_repository.dart';
import 'package:desafio_natal/app/app_bloc.dart';
import 'package:desafio_natal/app/modules/gift_list/gift_list_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:desafio_natal/app/app_widget.dart';
import 'package:desafio_natal/app/modules/home/home_module.dart';
import 'package:hasura_connect/hasura_connect.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HasuraConnect("http://desafio-natal-flutterando.herokuapp.com/v1/graphql", headers: {
          "X-Hasura-User-Id": "1",
          "X-Hasura-Role": "user",
          "x-hasura-admin-secret": "flutterando",
        })),
        Bind((i) => AppRepository(i.get())),
        Bind((i) => AppBloc()),
      ];

  @override
  List<Router> get routers => [
        Router('/', module: HomeModule()),
        Router('/gifts', module: GiftListModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
