import 'account_model.dart';

class GiftModel {
  int id;
  String name;
  String imageUrl;
  int giverId;
  int senderId;
  DateTime createdAt;
  AccountModel account;

  GiftModel({
    this.id,
    this.name,
    this.imageUrl,
    this.giverId,
    this.senderId,
    this.createdAt,
    this.account,
  });

  GiftModel.fromJson(Map<String, dynamic> json) {
    DateTime _createdAt = null;
    if (json['created_at'] != null)
      _createdAt = DateTime.tryParse(json['created_at']).toLocal();

    id = json['id'];
    name = json['name'];
    imageUrl = json['image_url'];
    giverId = json['giver_id'];
    senderId = json['sender_id'];
    createdAt = _createdAt;
    account = AccountModel.fromMap(json["account"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image_url'] = this.imageUrl;
    data['giver_id'] = this.giverId;
    data['sender_id'] = this.senderId;
    data['created_at'] = this.createdAt.toIso8601String();
    data['account'] = this.account?.toJson();
    return data;
  }

  static List<GiftModel> fromJsonList(Map list) {
    if (list == null) return null;
    return (list["data"]["gift"] as List)
        .map((item) => GiftModel.fromJson(item))
        .toList();
  }

  @override
  String toString() => name.toString();
}
