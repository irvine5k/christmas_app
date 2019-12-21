import 'dart:convert';

class AccountModel {
    final String name;
    final String imageUrl;

    AccountModel({
        this.name,
        this.imageUrl,
    });

    AccountModel copyWith({
        String name,
        String imageUrl,
    }) => 
        AccountModel(
            name: name ?? this.name,
            imageUrl: imageUrl ?? this.imageUrl,
        );

    factory AccountModel.fromJson(String str) => AccountModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AccountModel.fromMap(Map<String, dynamic> json) => AccountModel(
        name: json["name"],
        imageUrl: json["image_url"],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "image_url": imageUrl,
    };
}
