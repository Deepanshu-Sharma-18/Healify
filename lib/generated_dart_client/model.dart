// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'model.dart' as _i1;
import 'prisma.dart' as _i2;

class Record {
  const Record({
    this.id,
    this.title,
    this.date,
    this.symptoms,
    this.diagnosis,
    this.treatment,
    this.userId,
    this.user,
  });

  factory Record.fromJson(Map json) => Record(
        id: json['id'],
        title: json['title'],
        date: json['date'],
        symptoms: json['symptoms'] is Iterable
            ? (json['symptoms'] as Iterable).whereType<String>()
            : null,
        diagnosis: json['diagnosis'] is Iterable
            ? (json['diagnosis'] as Iterable).whereType<String>()
            : null,
        treatment: json['treatment'] is Iterable
            ? (json['treatment'] as Iterable).whereType<String>()
            : null,
        userId: json['userId'],
        user: json['user'] is Map ? _i1.User.fromJson(json['user']) : null,
      );

  final String? id;

  final String? title;

  final String? date;

  final Iterable<String>? symptoms;

  final Iterable<String>? diagnosis;

  final Iterable<String>? treatment;

  final String? userId;

  final _i1.User? user;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'date': date,
        'symptoms': symptoms?.map((e) => e),
        'diagnosis': diagnosis?.map((e) => e),
        'treatment': treatment?.map((e) => e),
        'userId': userId,
        'user': user?.toJson(),
      };
}

class User {
  const User({
    this.id,
    this.name,
    this.username,
    this.height,
    this.weight,
    this.age,
    this.bloodgroup,
    this.gender,
    this.address,
    this.image,
    this.records,
    this.$count,
  });

  factory User.fromJson(Map json) => User(
        id: json['id'],
        name: json['name'],
        username: json['username'],
        height: json['height'],
        weight: json['weight'],
        age: json['age'],
        bloodgroup: json['bloodgroup'],
        gender: json['gender'],
        address: json['address'],
        image: json['image'],
        records: (json['records'] as Iterable?)
            ?.map((json) => _i1.Record.fromJson(json)),
        $count: json['_count'] is Map
            ? _i2.UserCountOutputType.fromJson(json['_count'])
            : null,
      );

  final String? id;

  final String? name;

  final String? username;

  final String? height;

  final String? weight;

  final String? age;

  final String? bloodgroup;

  final String? gender;

  final String? address;

  final String? image;

  final Iterable<_i1.Record>? records;

  final _i2.UserCountOutputType? $count;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'username': username,
        'height': height,
        'weight': weight,
        'age': age,
        'bloodgroup': bloodgroup,
        'gender': gender,
        'address': address,
        'image': image,
        'records': records?.map((e) => e.toJson()),
        '_count': $count?.toJson(),
      };
}
