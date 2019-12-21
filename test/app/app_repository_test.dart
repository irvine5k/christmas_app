import 'package:desafio_natal/app/app_repository.dart';
import 'package:desafio_natal/app/model/gift_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../lib/app/app_module.dart';

class MockClient extends Mock implements Dio {}

void main() {
  AppRepository repository;
  Modular.init(AppModule());

  setUpAll(() {
    SharedPreferences.setMockInitialValues({});
    repository = AppModule.to.get();
  });

  group('AppRepository Test', () {
    test("teste do hasura pegando o hasura do inferno", () {
      expect(repository, isInstanceOf<AppRepository>());
      expect(repository.getGifts(), emits(isA<List<GiftModel>>()));
    });
    test("items_count", () async {
      repository.getGifts().listen((data) => expect(data.length, 3));
    });
  });
}
