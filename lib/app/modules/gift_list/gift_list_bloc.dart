import 'package:bloc/bloc.dart';
import 'package:desafio_natal/app/app_repository.dart';
import 'package:desafio_natal/app/model/gift_model.dart';

class GiftListBloc extends Bloc<dynamic, List<GiftModel>> {
  final AppRepository repository;

  GiftListBloc(this.repository);

  @override
  List<GiftModel> get initialState => null;

  @override
  Stream<List<GiftModel>> mapEventToState(dynamic event) async* {
    print("ARAC");
    yield* repository.getGifts();
  }
}
