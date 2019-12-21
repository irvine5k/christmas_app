import 'package:desafio_natal/app/app_module.dart';
import 'package:desafio_natal/app/modules/gift_list/gift_list_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:desafio_natal/app/modules/gift_list/gift_list_page.dart';

class GiftListModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => GiftListBloc(AppModule.to.get())),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => GiftListPage()),
      ];

  static Inject get to => Inject<GiftListModule>.of();
}
