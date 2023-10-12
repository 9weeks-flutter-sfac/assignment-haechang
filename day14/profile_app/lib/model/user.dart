// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  int id;
  String name;
  String username;
  String email;
  String phone;
  String website;
  Address address;
  Company company;
  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.website,
    required this.address,
    required this.company,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      name: map['name'] as String,
      username: map['username'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      website: map['website'] as String,
      address: Address.fromMap(map['address'] as Map<String, dynamic>),
      company: Company.fromMap(map['company'] as Map<String, dynamic>),
    );
  }
}

class Address {
  String street;
  String suite;
  String city;
  String zipcode;
  Geo geo;
  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      street: map['street'] as String,
      suite: map['suite'] as String,
      city: map['city'] as String,
      zipcode: map['zipcode'] as String,
      geo: Geo.fromMap(map['geo'] as Map<String, dynamic>),
    );
  }
}

class Geo {
  String lat;
  String lng;
  Geo({
    required this.lat,
    required this.lng,
  });

  factory Geo.fromMap(Map<String, dynamic> map) {
    return Geo(
      lat: map['lat'] as String,
      lng: map['lng'] as String,
    );
  }
}

class Company {
  String name;
  String catchPhrase;
  String bs;
  Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  factory Company.fromMap(Map<String, dynamic> map) {
    return Company(
      name: map['name'] as String,
      catchPhrase: map['catchPhrase'] as String,
      bs: map['bs'] as String,
    );
  }
}
