import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    UserModel({
        this.id,
        this.name,
        this.eloRating,
        this.tounaPlayed,
        this.tounaWon,
        this.winPercent,
        this.imgUrl,
    });

    String id;
    String name;
    String eloRating;
    String tounaPlayed;
    String tounaWon;
    String winPercent;
    String imgUrl;

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        eloRating: json["elo_rating"],
        tounaPlayed: json["touna_played"],
        tounaWon: json["touna_won"],
        winPercent: json["win_percent"],
        imgUrl: json["img_url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "elo_rating": eloRating,
        "touna_played": tounaPlayed,
        "touna_won": tounaWon,
        "win_percent": winPercent,
        "img_url": imgUrl,
    };
}
