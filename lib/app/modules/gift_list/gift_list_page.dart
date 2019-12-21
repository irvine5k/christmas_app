import 'package:desafio_natal/app/model/gift_model.dart';
import 'package:desafio_natal/app/modules/gift_list/card/card_widget.dart';
import 'package:desafio_natal/app/modules/gift_list/gift_list_module.dart';
import 'package:flutter/material.dart';

import 'gift_list_bloc.dart';

class GiftListPage extends StatefulWidget {
  @override
  _GiftListPageState createState() => _GiftListPageState();
}

class _GiftListPageState extends State<GiftListPage> {
  final GiftListBloc bloc = GiftListModule.to.get();
  @override
  void initState() {
    super.initState();
    bloc.add(null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset("assets/images/icon-01.png", width: 30),
            SizedBox(width: 5),
            Text("List of Gifts"),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          )
        ],
      ),
      body: StreamBuilder<List<GiftModel>>(
        stream: bloc.repository.getGifts(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());
          return ListView.separated(
            separatorBuilder: (_, i) => SizedBox(height: 10),
            padding: EdgeInsets.all(15),
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return CardWidget(snapshot.data[index]);
            },
          );
        },
      ),
    );
  }
}
