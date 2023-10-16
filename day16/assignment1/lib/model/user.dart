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
  String id;
  String collectionId;
  String collectionName;
  String created;
  String updated;
  String username;
  bool verified;
  bool emailVisibility;
  String email;
  String name;
  String avatar;
  Record({
    required this.id,
    required this.collectionId,
    required this.collectionName,
    required this.created,
    required this.updated,
    required this.username,
    required this.verified,
    required this.emailVisibility,
    required this.email,
    required this.name,
    required this.avatar,
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
      id: map['id'] as String,
      collectionId: map['collectionId'] as String,
      collectionName: map['collectionName'] as String,
      created: map['created'] as String,
      updated: map['updated'] as String,
      username: map['username'] as String,
      verified: map['verified'] as bool,
      emailVisibility: map['emailVisibility'] as bool,
      email: map['email'] as String,
      name: map['name'] as String,
      avatar: map['avatar'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Record.fromJson(String source) =>
      Record.fromMap(json.decode(source) as Map<String, dynamic>);
}
