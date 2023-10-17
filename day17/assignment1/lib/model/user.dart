import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  String token;
  Record record;
  User({
    required this.token,
    required this.record,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token,
      'record': record.toMap(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      token: map['token'] as String,
      record: Record.fromMap(map['record'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Record {
  String? id;
  String? collectionId;
  String? collectionName;
  String? created;
  String? updated;
  String? username;
  bool? verified;
  bool? emailVisibility;
  String? email;
  String? name;
  String? avatar;
  Record({
    this.id,
    this.collectionId,
    this.collectionName,
    this.created,
    this.updated,
    this.username,
    this.verified,
    this.emailVisibility,
    this.email,
    this.name,
    this.avatar,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'collectionId': collectionId,
      'collectionName': collectionName,
      'created': created,
      'updated': updated,
      'username': username,
      'verified': verified,
      'emailVisibility': emailVisibility,
      'email': email,
      'name': name,
      'avatar': avatar,
    };
  }

  factory Record.fromMap(Map<String, dynamic> map) {
    return Record(
      id: map['id'] != null ? map['id'] as String : null,
      collectionId:
          map['collectionId'] != null ? map['collectionId'] as String : null,
      collectionName: map['collectionName'] != null
          ? map['collectionName'] as String
          : null,
      created: map['created'] != null ? map['created'] as String : null,
      updated: map['updated'] != null ? map['updated'] as String : null,
      username: map['username'] != null ? map['username'] as String : null,
      verified: map['verified'] != null ? map['verified'] as bool : null,
      emailVisibility: map['emailVisibility'] != null
          ? map['emailVisibility'] as bool
          : null,
      email: map['email'] != null ? map['email'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      avatar: map['avatar'] != null ? map['avatar'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Record.fromJson(String source) =>
      Record.fromMap(json.decode(source) as Map<String, dynamic>);
}
