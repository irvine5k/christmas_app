import 'package:desafio_natal/app/model/gift_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';

import 'app_documents.dart';

class AppRepository extends Disposable {
  final HasuraConnect client;

  AppRepository(this.client);
  // Future fetchPost(Dio client) async {
  //   final response =
  //       await client.get('https://jsonplaceholder.typicode.com/posts/1');
  //   return response.data;
  // }

  Stream<List<GiftModel>> getGifts() {
    final items = client
        .cachedQuery(getGiftsQuery)
        .map((data) {
          return GiftModel.fromJsonList(data);
        });
    return items;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
