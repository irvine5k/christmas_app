import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:desafio_natal/app/app_module.dart';
import 'package:desafio_natal/app/modules/gift_list/gift_list_bloc.dart';
import 'package:desafio_natal/app/modules/gift_list/gift_list_module.dart';

void main() {
  Modular.init(AppModule());
  Modular.bindModule(GiftListModule());
  GiftListBloc bloc;

  setUp(() {
    bloc = GiftListModule.to.get<GiftListBloc>();
  });

  group('GiftListBloc Test', () {
    test("First Test", () {
      expect(bloc, isInstanceOf<GiftListBloc>());
    });
  });
}
