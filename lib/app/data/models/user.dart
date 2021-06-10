
import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    User({
        this.id,
        this.name,
        this.registration,
        this.status,
        this.passwordUpdate,
        this.email,
        this.password,
        this.emailVerification,
        this.prefs,
    });

    String? id;
    String? name;
    int? registration;
    int? status;
    int? passwordUpdate;
    String? email;
    String? password;
    bool? emailVerification;
    Prefs? prefs;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["\u0024id"],
        name: json["name"],
        registration: json["registration"],
        status: json["status"],
        passwordUpdate: json["passwordUpdate"],
        email: json["email"],
        emailVerification: json["emailVerification"],
        prefs: Prefs.fromJson(json["prefs"]),
    );

    Map<String, dynamic> toJson() => {
        "\u0024id": id,
        "name": name,
        "registration": registration,
        "status": status,
        "passwordUpdate": passwordUpdate,
        "email": email,
        "emailVerification": emailVerification,
        "prefs": prefs?.toJson(),
    };
}

class Prefs {
    Prefs();

    factory Prefs.fromJson(Map<String, dynamic> json) => Prefs(
    );

    Map<String, dynamic> toJson() => {
    };
}
