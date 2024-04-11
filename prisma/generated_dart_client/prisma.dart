// ignore_for_file: non_constant_identifier_names

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:orm/orm.dart' as _i1;

import 'prisma.dart' as _i2;

class UserCountOutputType {
  const UserCountOutputType({this.records});

  factory UserCountOutputType.fromJson(Map json) =>
      UserCountOutputType(records: json['records']);

  final int? records;

  Map<String, dynamic> toJson() => {'records': records};
}

enum QueryMode implements _i1.PrismaEnum {
  $default._('default'),
  insensitive._('insensitive');

  const QueryMode._(this.name);

  @override
  final String name;
}

class NestedStringFilter implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NestedStringFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.contains,
    this.startsWith,
    this.endsWith,
    this.not,
  });

  final _i1.PrismaUnion<String, _i1.Reference<String>>? equals;

  final _i1.PrismaUnion<Iterable<String>, _i1.Reference<Iterable<String>>>? $in;

  final _i1.PrismaUnion<Iterable<String>, _i1.Reference<Iterable<String>>>?
      notIn;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? contains;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? startsWith;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? endsWith;

  final _i1.PrismaUnion<String, _i2.NestedStringFilter>? not;

  @override
  Map<String, dynamic> toJson() => {
        'equals': equals,
        'in': $in,
        'notIn': notIn,
        'lt': lt,
        'lte': lte,
        'gt': gt,
        'gte': gte,
        'contains': contains,
        'startsWith': startsWith,
        'endsWith': endsWith,
        'not': not,
      };
}

class StringFilter implements _i1.JsonConvertible<Map<String, dynamic>> {
  const StringFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.contains,
    this.startsWith,
    this.endsWith,
    this.mode,
    this.not,
  });

  final _i1.PrismaUnion<String, _i1.Reference<String>>? equals;

  final _i1.PrismaUnion<Iterable<String>, _i1.Reference<Iterable<String>>>? $in;

  final _i1.PrismaUnion<Iterable<String>, _i1.Reference<Iterable<String>>>?
      notIn;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? contains;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? startsWith;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? endsWith;

  final _i2.QueryMode? mode;

  final _i1.PrismaUnion<String, _i2.NestedStringFilter>? not;

  @override
  Map<String, dynamic> toJson() => {
        'equals': equals,
        'in': $in,
        'notIn': notIn,
        'lt': lt,
        'lte': lte,
        'gt': gt,
        'gte': gte,
        'contains': contains,
        'startsWith': startsWith,
        'endsWith': endsWith,
        'mode': mode,
        'not': not,
      };
}

class NestedStringNullableFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NestedStringNullableFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.contains,
    this.startsWith,
    this.endsWith,
    this.not,
    this.isSet,
  });

  final _i1.PrismaUnion<String,
      _i1.PrismaUnion<_i1.Reference<String>, _i1.PrismaNull>>? equals;

  final _i1.PrismaUnion<Iterable<String>,
      _i1.PrismaUnion<_i1.Reference<Iterable<String>>, _i1.PrismaNull>>? $in;

  final _i1.PrismaUnion<Iterable<String>,
      _i1.PrismaUnion<_i1.Reference<Iterable<String>>, _i1.PrismaNull>>? notIn;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? contains;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? startsWith;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? endsWith;

  final _i1.PrismaUnion<String,
      _i1.PrismaUnion<_i2.NestedStringNullableFilter, _i1.PrismaNull>>? not;

  final bool? isSet;

  @override
  Map<String, dynamic> toJson() => {
        'equals': equals,
        'in': $in,
        'notIn': notIn,
        'lt': lt,
        'lte': lte,
        'gt': gt,
        'gte': gte,
        'contains': contains,
        'startsWith': startsWith,
        'endsWith': endsWith,
        'not': not,
        'isSet': isSet,
      };
}

class StringNullableFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const StringNullableFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.contains,
    this.startsWith,
    this.endsWith,
    this.mode,
    this.not,
    this.isSet,
  });

  final _i1.PrismaUnion<String,
      _i1.PrismaUnion<_i1.Reference<String>, _i1.PrismaNull>>? equals;

  final _i1.PrismaUnion<Iterable<String>,
      _i1.PrismaUnion<_i1.Reference<Iterable<String>>, _i1.PrismaNull>>? $in;

  final _i1.PrismaUnion<Iterable<String>,
      _i1.PrismaUnion<_i1.Reference<Iterable<String>>, _i1.PrismaNull>>? notIn;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? contains;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? startsWith;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? endsWith;

  final _i2.QueryMode? mode;

  final _i1.PrismaUnion<String,
      _i1.PrismaUnion<_i2.NestedStringNullableFilter, _i1.PrismaNull>>? not;

  final bool? isSet;

  @override
  Map<String, dynamic> toJson() => {
        'equals': equals,
        'in': $in,
        'notIn': notIn,
        'lt': lt,
        'lte': lte,
        'gt': gt,
        'gte': gte,
        'contains': contains,
        'startsWith': startsWith,
        'endsWith': endsWith,
        'mode': mode,
        'not': not,
        'isSet': isSet,
      };
}

class StringNullableListFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const StringNullableListFilter({
    this.equals,
    this.has,
    this.hasEvery,
    this.hasSome,
    this.isEmpty,
  });

  final _i1.PrismaUnion<Iterable<String>,
      _i1.PrismaUnion<_i1.Reference<Iterable<String>>, _i1.PrismaNull>>? equals;

  final _i1.PrismaUnion<String,
      _i1.PrismaUnion<_i1.Reference<String>, _i1.PrismaNull>>? has;

  final _i1.PrismaUnion<Iterable<String>, _i1.Reference<Iterable<String>>>?
      hasEvery;

  final _i1.PrismaUnion<Iterable<String>, _i1.Reference<Iterable<String>>>?
      hasSome;

  final bool? isEmpty;

  @override
  Map<String, dynamic> toJson() => {
        'equals': equals,
        'has': has,
        'hasEvery': hasEvery,
        'hasSome': hasSome,
        'isEmpty': isEmpty,
      };
}

class UserRelationFilter implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserRelationFilter({
    this.$is,
    this.isNot,
  });

  final _i2.UserWhereInput? $is;

  final _i2.UserWhereInput? isNot;

  @override
  Map<String, dynamic> toJson() => {
        'is': $is,
        'isNot': isNot,
      };
}

class RecordWhereInput implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RecordWhereInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.title,
    this.date,
    this.symptoms,
    this.diagnosis,
    this.treatment,
    this.userId,
    this.user,
  });

  final _i1.PrismaUnion<_i2.RecordWhereInput, Iterable<_i2.RecordWhereInput>>?
      AND;

  final Iterable<_i2.RecordWhereInput>? OR;

  final _i1.PrismaUnion<_i2.RecordWhereInput, Iterable<_i2.RecordWhereInput>>?
      NOT;

  final _i1.PrismaUnion<_i2.StringFilter, String>? id;

  final _i1.PrismaUnion<_i2.StringFilter, String>? title;

  final _i1.PrismaUnion<_i2.StringFilter, String>? date;

  final _i2.StringNullableListFilter? symptoms;

  final _i2.StringNullableListFilter? diagnosis;

  final _i2.StringNullableListFilter? treatment;

  final _i1.PrismaUnion<_i2.StringFilter, String>? userId;

  final _i1.PrismaUnion<_i2.UserRelationFilter, _i2.UserWhereInput>? user;

  @override
  Map<String, dynamic> toJson() => {
        'AND': AND,
        'OR': OR,
        'NOT': NOT,
        'id': id,
        'title': title,
        'date': date,
        'symptoms': symptoms,
        'diagnosis': diagnosis,
        'treatment': treatment,
        'userId': userId,
        'user': user,
      };
}

class RecordListRelationFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RecordListRelationFilter({
    this.every,
    this.some,
    this.none,
  });

  final _i2.RecordWhereInput? every;

  final _i2.RecordWhereInput? some;

  final _i2.RecordWhereInput? none;

  @override
  Map<String, dynamic> toJson() => {
        'every': every,
        'some': some,
        'none': none,
      };
}

class UserWhereInput implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserWhereInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.name,
    this.username,
    this.height,
    this.weight,
    this.age,
    this.bloodgroup,
    this.gender,
    this.address,
    this.records,
  });

  final _i1.PrismaUnion<_i2.UserWhereInput, Iterable<_i2.UserWhereInput>>? AND;

  final Iterable<_i2.UserWhereInput>? OR;

  final _i1.PrismaUnion<_i2.UserWhereInput, Iterable<_i2.UserWhereInput>>? NOT;

  final _i1.PrismaUnion<_i2.StringFilter, String>? id;

  final _i1.PrismaUnion<_i2.StringFilter, String>? name;

  final _i1.PrismaUnion<_i2.StringFilter, String>? username;

  final _i1.PrismaUnion<_i2.StringNullableFilter,
      _i1.PrismaUnion<String, _i1.PrismaNull>>? height;

  final _i1.PrismaUnion<_i2.StringNullableFilter,
      _i1.PrismaUnion<String, _i1.PrismaNull>>? weight;

  final _i1.PrismaUnion<_i2.StringNullableFilter,
      _i1.PrismaUnion<String, _i1.PrismaNull>>? age;

  final _i1.PrismaUnion<_i2.StringNullableFilter,
      _i1.PrismaUnion<String, _i1.PrismaNull>>? bloodgroup;

  final _i1.PrismaUnion<_i2.StringNullableFilter,
      _i1.PrismaUnion<String, _i1.PrismaNull>>? gender;

  final _i1.PrismaUnion<_i2.StringFilter, String>? address;

  final _i2.RecordListRelationFilter? records;

  @override
  Map<String, dynamic> toJson() => {
        'AND': AND,
        'OR': OR,
        'NOT': NOT,
        'id': id,
        'name': name,
        'username': username,
        'height': height,
        'weight': weight,
        'age': age,
        'bloodgroup': bloodgroup,
        'gender': gender,
        'address': address,
        'records': records,
      };
}

class UserWhereUniqueInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserWhereUniqueInput({
    this.id,
    this.username,
    this.AND,
    this.OR,
    this.NOT,
    this.name,
    this.height,
    this.weight,
    this.age,
    this.bloodgroup,
    this.gender,
    this.address,
    this.records,
  });

  final String? id;

  final String? username;

  final _i1.PrismaUnion<_i2.UserWhereInput, Iterable<_i2.UserWhereInput>>? AND;

  final Iterable<_i2.UserWhereInput>? OR;

  final _i1.PrismaUnion<_i2.UserWhereInput, Iterable<_i2.UserWhereInput>>? NOT;

  final _i1.PrismaUnion<_i2.StringFilter, String>? name;

  final _i1.PrismaUnion<_i2.StringNullableFilter,
      _i1.PrismaUnion<String, _i1.PrismaNull>>? height;

  final _i1.PrismaUnion<_i2.StringNullableFilter,
      _i1.PrismaUnion<String, _i1.PrismaNull>>? weight;

  final _i1.PrismaUnion<_i2.StringNullableFilter,
      _i1.PrismaUnion<String, _i1.PrismaNull>>? age;

  final _i1.PrismaUnion<_i2.StringNullableFilter,
      _i1.PrismaUnion<String, _i1.PrismaNull>>? bloodgroup;

  final _i1.PrismaUnion<_i2.StringNullableFilter,
      _i1.PrismaUnion<String, _i1.PrismaNull>>? gender;

  final _i1.PrismaUnion<_i2.StringFilter, String>? address;

  final _i2.RecordListRelationFilter? records;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'AND': AND,
        'OR': OR,
        'NOT': NOT,
        'name': name,
        'height': height,
        'weight': weight,
        'age': age,
        'bloodgroup': bloodgroup,
        'gender': gender,
        'address': address,
        'records': records,
      };
}

class RecordUserArgs implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RecordUserArgs({
    this.select,
    this.include,
  });

  final _i2.UserSelect? select;

  final _i2.UserInclude? include;

  @override
  Map<String, dynamic> toJson() => {
        'select': select,
        'include': include,
      };
}

class RecordInclude implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RecordInclude({this.user});

  final _i1.PrismaUnion<bool, _i2.RecordUserArgs>? user;

  @override
  Map<String, dynamic> toJson() => {'user': user};
}

enum SortOrder implements _i1.PrismaEnum {
  asc._('asc'),
  desc._('desc');

  const SortOrder._(this.name);

  @override
  final String name;
}

class RecordOrderByRelationAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RecordOrderByRelationAggregateInput({this.$count});

  final _i2.SortOrder? $count;

  @override
  Map<String, dynamic> toJson() => {'_count': $count};
}

class UserOrderByWithRelationInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserOrderByWithRelationInput({
    this.id,
    this.name,
    this.username,
    this.height,
    this.weight,
    this.age,
    this.bloodgroup,
    this.gender,
    this.address,
    this.records,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? name;

  final _i2.SortOrder? username;

  final _i2.SortOrder? height;

  final _i2.SortOrder? weight;

  final _i2.SortOrder? age;

  final _i2.SortOrder? bloodgroup;

  final _i2.SortOrder? gender;

  final _i2.SortOrder? address;

  final _i2.RecordOrderByRelationAggregateInput? records;

  @override
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
        'records': records,
      };
}

class RecordOrderByWithRelationInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RecordOrderByWithRelationInput({
    this.id,
    this.title,
    this.date,
    this.symptoms,
    this.diagnosis,
    this.treatment,
    this.userId,
    this.user,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? title;

  final _i2.SortOrder? date;

  final _i2.SortOrder? symptoms;

  final _i2.SortOrder? diagnosis;

  final _i2.SortOrder? treatment;

  final _i2.SortOrder? userId;

  final _i2.UserOrderByWithRelationInput? user;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'date': date,
        'symptoms': symptoms,
        'diagnosis': diagnosis,
        'treatment': treatment,
        'userId': userId,
        'user': user,
      };
}

class RecordWhereUniqueInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RecordWhereUniqueInput({
    this.id,
    this.userId,
    this.AND,
    this.OR,
    this.NOT,
    this.title,
    this.date,
    this.symptoms,
    this.diagnosis,
    this.treatment,
    this.user,
  });

  final String? id;

  final String? userId;

  final _i1.PrismaUnion<_i2.RecordWhereInput, Iterable<_i2.RecordWhereInput>>?
      AND;

  final Iterable<_i2.RecordWhereInput>? OR;

  final _i1.PrismaUnion<_i2.RecordWhereInput, Iterable<_i2.RecordWhereInput>>?
      NOT;

  final _i1.PrismaUnion<_i2.StringFilter, String>? title;

  final _i1.PrismaUnion<_i2.StringFilter, String>? date;

  final _i2.StringNullableListFilter? symptoms;

  final _i2.StringNullableListFilter? diagnosis;

  final _i2.StringNullableListFilter? treatment;

  final _i1.PrismaUnion<_i2.UserRelationFilter, _i2.UserWhereInput>? user;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'AND': AND,
        'OR': OR,
        'NOT': NOT,
        'title': title,
        'date': date,
        'symptoms': symptoms,
        'diagnosis': diagnosis,
        'treatment': treatment,
        'user': user,
      };
}

enum RecordScalar<T> implements _i1.PrismaEnum, _i1.Reference<T> {
  id<String>('id', 'Record'),
  title<String>('title', 'Record'),
  date<String>('date', 'Record'),
  symptoms<String>('symptoms', 'Record'),
  diagnosis<String>('diagnosis', 'Record'),
  treatment<String>('treatment', 'Record'),
  userId<String>('userId', 'Record');

  const RecordScalar(
    this.name,
    this.model,
  );

  @override
  final String name;

  @override
  final String model;
}

class UserRecordsArgs implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserRecordsArgs({
    this.where,
    this.orderBy,
    this.cursor,
    this.take,
    this.skip,
    this.distinct,
    this.select,
    this.include,
  });

  final _i2.RecordWhereInput? where;

  final _i1.PrismaUnion<Iterable<_i2.RecordOrderByWithRelationInput>,
      _i2.RecordOrderByWithRelationInput>? orderBy;

  final _i2.RecordWhereUniqueInput? cursor;

  final int? take;

  final int? skip;

  final _i1.PrismaUnion<_i2.RecordScalar, Iterable<_i2.RecordScalar>>? distinct;

  final _i2.RecordSelect? select;

  final _i2.RecordInclude? include;

  @override
  Map<String, dynamic> toJson() => {
        'where': where,
        'orderBy': orderBy,
        'cursor': cursor,
        'take': take,
        'skip': skip,
        'distinct': distinct,
        'select': select,
        'include': include,
      };
}

class UserCountOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserCountOutputTypeSelect({this.records});

  final bool? records;

  @override
  Map<String, dynamic> toJson() => {'records': records};
}

class UserCountArgs implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserCountArgs({this.select});

  final _i2.UserCountOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class UserInclude implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserInclude({
    this.records,
    this.$count,
  });

  final _i1.PrismaUnion<bool, _i2.UserRecordsArgs>? records;

  final _i1.PrismaUnion<bool, _i2.UserCountArgs>? $count;

  @override
  Map<String, dynamic> toJson() => {
        'records': records,
        '_count': $count,
      };
}

class RecordSelect implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RecordSelect({
    this.id,
    this.title,
    this.date,
    this.symptoms,
    this.diagnosis,
    this.treatment,
    this.userId,
    this.user,
  });

  final bool? id;

  final bool? title;

  final bool? date;

  final bool? symptoms;

  final bool? diagnosis;

  final bool? treatment;

  final bool? userId;

  final _i1.PrismaUnion<bool, _i2.RecordUserArgs>? user;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'date': date,
        'symptoms': symptoms,
        'diagnosis': diagnosis,
        'treatment': treatment,
        'userId': userId,
        'user': user,
      };
}

class UserSelect implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserSelect({
    this.id,
    this.name,
    this.username,
    this.height,
    this.weight,
    this.age,
    this.bloodgroup,
    this.gender,
    this.address,
    this.records,
    this.$count,
  });

  final bool? id;

  final bool? name;

  final bool? username;

  final bool? height;

  final bool? weight;

  final bool? age;

  final bool? bloodgroup;

  final bool? gender;

  final bool? address;

  final _i1.PrismaUnion<bool, _i2.UserRecordsArgs>? records;

  final _i1.PrismaUnion<bool, _i2.UserCountArgs>? $count;

  @override
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
        'records': records,
        '_count': $count,
      };
}

enum UserScalar<T> implements _i1.PrismaEnum, _i1.Reference<T> {
  id<String>('id', 'User'),
  name$<String>('name', 'User'),
  username<String>('username', 'User'),
  height<String>('height', 'User'),
  weight<String>('weight', 'User'),
  age<String>('age', 'User'),
  bloodgroup<String>('bloodgroup', 'User'),
  gender<String>('gender', 'User'),
  address<String>('address', 'User');

  const UserScalar(
    this.name,
    this.model,
  );

  @override
  final String name;

  @override
  final String model;
}

class RecordCreatesymptomsInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RecordCreatesymptomsInput({required this.set});

  final Iterable<String> set;

  @override
  Map<String, dynamic> toJson() => {'set': set};
}

class RecordCreatediagnosisInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RecordCreatediagnosisInput({required this.set});

  final Iterable<String> set;

  @override
  Map<String, dynamic> toJson() => {'set': set};
}

class RecordCreatetreatmentInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RecordCreatetreatmentInput({required this.set});

  final Iterable<String> set;

  @override
  Map<String, dynamic> toJson() => {'set': set};
}

class RecordCreateWithoutUserInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RecordCreateWithoutUserInput({
    this.id,
    required this.title,
    required this.date,
    this.symptoms,
    this.diagnosis,
    this.treatment,
  });

  final String? id;

  final String title;

  final String date;

  final _i1.PrismaUnion<_i2.RecordCreatesymptomsInput, Iterable<String>>?
      symptoms;

  final _i1.PrismaUnion<_i2.RecordCreatediagnosisInput, Iterable<String>>?
      diagnosis;

  final _i1.PrismaUnion<_i2.RecordCreatetreatmentInput, Iterable<String>>?
      treatment;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'date': date,
        'symptoms': symptoms,
        'diagnosis': diagnosis,
        'treatment': treatment,
      };
}

class RecordUncheckedCreateWithoutUserInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RecordUncheckedCreateWithoutUserInput({
    this.id,
    required this.title,
    required this.date,
    this.symptoms,
    this.diagnosis,
    this.treatment,
  });

  final String? id;

  final String title;

  final String date;

  final _i1.PrismaUnion<_i2.RecordCreatesymptomsInput, Iterable<String>>?
      symptoms;

  final _i1.PrismaUnion<_i2.RecordCreatediagnosisInput, Iterable<String>>?
      diagnosis;

  final _i1.PrismaUnion<_i2.RecordCreatetreatmentInput, Iterable<String>>?
      treatment;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'date': date,
        'symptoms': symptoms,
        'diagnosis': diagnosis,
        'treatment': treatment,
      };
}

class RecordCreateOrConnectWithoutUserInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RecordCreateOrConnectWithoutUserInput({
    required this.where,
    required this.create,
  });

  final _i2.RecordWhereUniqueInput where;

  final _i1.PrismaUnion<_i2.RecordCreateWithoutUserInput,
      _i2.RecordUncheckedCreateWithoutUserInput> create;

  @override
  Map<String, dynamic> toJson() => {
        'where': where,
        'create': create,
      };
}

class RecordCreateManyUserInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RecordCreateManyUserInput({
    this.id,
    required this.title,
    required this.date,
    this.symptoms,
    this.diagnosis,
    this.treatment,
  });

  final String? id;

  final String title;

  final String date;

  final _i1.PrismaUnion<_i2.RecordCreatesymptomsInput, Iterable<String>>?
      symptoms;

  final _i1.PrismaUnion<_i2.RecordCreatediagnosisInput, Iterable<String>>?
      diagnosis;

  final _i1.PrismaUnion<_i2.RecordCreatetreatmentInput, Iterable<String>>?
      treatment;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'date': date,
        'symptoms': symptoms,
        'diagnosis': diagnosis,
        'treatment': treatment,
      };
}

class RecordCreateManyUserInputEnvelope
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RecordCreateManyUserInputEnvelope({required this.data});

  final _i1.PrismaUnion<_i2.RecordCreateManyUserInput,
      Iterable<_i2.RecordCreateManyUserInput>> data;

  @override
  Map<String, dynamic> toJson() => {'data': data};
}

class RecordCreateNestedManyWithoutUserInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RecordCreateNestedManyWithoutUserInput({
    this.create,
    this.connectOrCreate,
    this.createMany,
    this.connect,
  });

  final _i1.PrismaUnion<
      _i2.RecordCreateWithoutUserInput,
      _i1.PrismaUnion<
          Iterable<_i2.RecordCreateWithoutUserInput>,
          _i1.PrismaUnion<_i2.RecordUncheckedCreateWithoutUserInput,
              Iterable<_i2.RecordUncheckedCreateWithoutUserInput>>>>? create;

  final _i1.PrismaUnion<_i2.RecordCreateOrConnectWithoutUserInput,
      Iterable<_i2.RecordCreateOrConnectWithoutUserInput>>? connectOrCreate;

  final _i2.RecordCreateManyUserInputEnvelope? createMany;

  final _i1.PrismaUnion<_i2.RecordWhereUniqueInput,
      Iterable<_i2.RecordWhereUniqueInput>>? connect;

  @override
  Map<String, dynamic> toJson() => {
        'create': create,
        'connectOrCreate': connectOrCreate,
        'createMany': createMany,
        'connect': connect,
      };
}

class UserCreateInput implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserCreateInput({
    this.id,
    required this.name,
    required this.username,
    this.height,
    this.weight,
    this.age,
    this.bloodgroup,
    this.gender,
    required this.address,
    this.records,
  });

  final String? id;

  final String name;

  final String username;

  final _i1.PrismaUnion<String, _i1.PrismaNull>? height;

  final _i1.PrismaUnion<String, _i1.PrismaNull>? weight;

  final _i1.PrismaUnion<String, _i1.PrismaNull>? age;

  final _i1.PrismaUnion<String, _i1.PrismaNull>? bloodgroup;

  final _i1.PrismaUnion<String, _i1.PrismaNull>? gender;

  final String address;

  final _i2.RecordCreateNestedManyWithoutUserInput? records;

  @override
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
        'records': records,
      };
}

class RecordUncheckedCreateNestedManyWithoutUserInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RecordUncheckedCreateNestedManyWithoutUserInput({
    this.create,
    this.connectOrCreate,
    this.createMany,
    this.connect,
  });

  final _i1.PrismaUnion<
      _i2.RecordCreateWithoutUserInput,
      _i1.PrismaUnion<
          Iterable<_i2.RecordCreateWithoutUserInput>,
          _i1.PrismaUnion<_i2.RecordUncheckedCreateWithoutUserInput,
              Iterable<_i2.RecordUncheckedCreateWithoutUserInput>>>>? create;

  final _i1.PrismaUnion<_i2.RecordCreateOrConnectWithoutUserInput,
      Iterable<_i2.RecordCreateOrConnectWithoutUserInput>>? connectOrCreate;

  final _i2.RecordCreateManyUserInputEnvelope? createMany;

  final _i1.PrismaUnion<_i2.RecordWhereUniqueInput,
      Iterable<_i2.RecordWhereUniqueInput>>? connect;

  @override
  Map<String, dynamic> toJson() => {
        'create': create,
        'connectOrCreate': connectOrCreate,
        'createMany': createMany,
        'connect': connect,
      };
}

class UserUncheckedCreateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserUncheckedCreateInput({
    this.id,
    required this.name,
    required this.username,
    this.height,
    this.weight,
    this.age,
    this.bloodgroup,
    this.gender,
    required this.address,
    this.records,
  });

  final String? id;

  final String name;

  final String username;

  final _i1.PrismaUnion<String, _i1.PrismaNull>? height;

  final _i1.PrismaUnion<String, _i1.PrismaNull>? weight;

  final _i1.PrismaUnion<String, _i1.PrismaNull>? age;

  final _i1.PrismaUnion<String, _i1.PrismaNull>? bloodgroup;

  final _i1.PrismaUnion<String, _i1.PrismaNull>? gender;

  final String address;

  final _i2.RecordUncheckedCreateNestedManyWithoutUserInput? records;

  @override
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
        'records': records,
      };
}

class AffectedRowsOutput {
  const AffectedRowsOutput({this.count});

  factory AffectedRowsOutput.fromJson(Map json) =>
      AffectedRowsOutput(count: json['count']);

  final int? count;

  Map<String, dynamic> toJson() => {'count': count};
}

class UserCreateManyInput implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserCreateManyInput({
    this.id,
    required this.name,
    required this.username,
    this.height,
    this.weight,
    this.age,
    this.bloodgroup,
    this.gender,
    required this.address,
  });

  final String? id;

  final String name;

  final String username;

  final _i1.PrismaUnion<String, _i1.PrismaNull>? height;

  final _i1.PrismaUnion<String, _i1.PrismaNull>? weight;

  final _i1.PrismaUnion<String, _i1.PrismaNull>? age;

  final _i1.PrismaUnion<String, _i1.PrismaNull>? bloodgroup;

  final _i1.PrismaUnion<String, _i1.PrismaNull>? gender;

  final String address;

  @override
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
      };
}

class StringFieldUpdateOperationsInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const StringFieldUpdateOperationsInput({this.set});

  final String? set;

  @override
  Map<String, dynamic> toJson() => {'set': set};
}

class NullableStringFieldUpdateOperationsInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NullableStringFieldUpdateOperationsInput({
    this.set,
    this.unset,
  });

  final _i1.PrismaUnion<String, _i1.PrismaNull>? set;

  final bool? unset;

  @override
  Map<String, dynamic> toJson() => {
        'set': set,
        'unset': unset,
      };
}

class RecordUpdatesymptomsInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RecordUpdatesymptomsInput({
    this.set,
    this.push,
  });

  final Iterable<String>? set;

  final _i1.PrismaUnion<String, Iterable<String>>? push;

  @override
  Map<String, dynamic> toJson() => {
        'set': set,
        'push': push,
      };
}

class RecordUpdatediagnosisInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RecordUpdatediagnosisInput({
    this.set,
    this.push,
  });

  final Iterable<String>? set;

  final _i1.PrismaUnion<String, Iterable<String>>? push;

  @override
  Map<String, dynamic> toJson() => {
        'set': set,
        'push': push,
      };
}

class RecordUpdatetreatmentInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RecordUpdatetreatmentInput({
    this.set,
    this.push,
  });

  final Iterable<String>? set;

  final _i1.PrismaUnion<String, Iterable<String>>? push;

  @override
  Map<String, dynamic> toJson() => {
        'set': set,
        'push': push,
      };
}

class RecordUpdateWithoutUserInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RecordUpdateWithoutUserInput({
    this.title,
    this.date,
    this.symptoms,
    this.diagnosis,
    this.treatment,
  });

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? title;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? date;

  final _i1.PrismaUnion<_i2.RecordUpdatesymptomsInput, Iterable<String>>?
      symptoms;

  final _i1.PrismaUnion<_i2.RecordUpdatediagnosisInput, Iterable<String>>?
      diagnosis;

  final _i1.PrismaUnion<_i2.RecordUpdatetreatmentInput, Iterable<String>>?
      treatment;

  @override
  Map<String, dynamic> toJson() => {
        'title': title,
        'date': date,
        'symptoms': symptoms,
        'diagnosis': diagnosis,
        'treatment': treatment,
      };
}

class RecordUncheckedUpdateWithoutUserInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RecordUncheckedUpdateWithoutUserInput({
    this.title,
    this.date,
    this.symptoms,
    this.diagnosis,
    this.treatment,
  });

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? title;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? date;

  final _i1.PrismaUnion<_i2.RecordUpdatesymptomsInput, Iterable<String>>?
      symptoms;

  final _i1.PrismaUnion<_i2.RecordUpdatediagnosisInput, Iterable<String>>?
      diagnosis;

  final _i1.PrismaUnion<_i2.RecordUpdatetreatmentInput, Iterable<String>>?
      treatment;

  @override
  Map<String, dynamic> toJson() => {
        'title': title,
        'date': date,
        'symptoms': symptoms,
        'diagnosis': diagnosis,
        'treatment': treatment,
      };
}

class RecordUpsertWithWhereUniqueWithoutUserInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RecordUpsertWithWhereUniqueWithoutUserInput({
    required this.where,
    required this.update,
    required this.create,
  });

  final _i2.RecordWhereUniqueInput where;

  final _i1.PrismaUnion<_i2.RecordUpdateWithoutUserInput,
      _i2.RecordUncheckedUpdateWithoutUserInput> update;

  final _i1.PrismaUnion<_i2.RecordCreateWithoutUserInput,
      _i2.RecordUncheckedCreateWithoutUserInput> create;

  @override
  Map<String, dynamic> toJson() => {
        'where': where,
        'update': update,
        'create': create,
      };
}

class RecordUpdateWithWhereUniqueWithoutUserInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RecordUpdateWithWhereUniqueWithoutUserInput({
    required this.where,
    required this.data,
  });

  final _i2.RecordWhereUniqueInput where;

  final _i1.PrismaUnion<_i2.RecordUpdateWithoutUserInput,
      _i2.RecordUncheckedUpdateWithoutUserInput> data;

  @override
  Map<String, dynamic> toJson() => {
        'where': where,
        'data': data,
      };
}

class RecordScalarWhereInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RecordScalarWhereInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.title,
    this.date,
    this.symptoms,
    this.diagnosis,
    this.treatment,
    this.userId,
  });

  final _i1.PrismaUnion<_i2.RecordScalarWhereInput,
      Iterable<_i2.RecordScalarWhereInput>>? AND;

  final Iterable<_i2.RecordScalarWhereInput>? OR;

  final _i1.PrismaUnion<_i2.RecordScalarWhereInput,
      Iterable<_i2.RecordScalarWhereInput>>? NOT;

  final _i1.PrismaUnion<_i2.StringFilter, String>? id;

  final _i1.PrismaUnion<_i2.StringFilter, String>? title;

  final _i1.PrismaUnion<_i2.StringFilter, String>? date;

  final _i2.StringNullableListFilter? symptoms;

  final _i2.StringNullableListFilter? diagnosis;

  final _i2.StringNullableListFilter? treatment;

  final _i1.PrismaUnion<_i2.StringFilter, String>? userId;

  @override
  Map<String, dynamic> toJson() => {
        'AND': AND,
        'OR': OR,
        'NOT': NOT,
        'id': id,
        'title': title,
        'date': date,
        'symptoms': symptoms,
        'diagnosis': diagnosis,
        'treatment': treatment,
        'userId': userId,
      };
}

class RecordUpdateManyMutationInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RecordUpdateManyMutationInput({
    this.title,
    this.date,
    this.symptoms,
    this.diagnosis,
    this.treatment,
  });

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? title;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? date;

  final _i1.PrismaUnion<_i2.RecordUpdatesymptomsInput, Iterable<String>>?
      symptoms;

  final _i1.PrismaUnion<_i2.RecordUpdatediagnosisInput, Iterable<String>>?
      diagnosis;

  final _i1.PrismaUnion<_i2.RecordUpdatetreatmentInput, Iterable<String>>?
      treatment;

  @override
  Map<String, dynamic> toJson() => {
        'title': title,
        'date': date,
        'symptoms': symptoms,
        'diagnosis': diagnosis,
        'treatment': treatment,
      };
}

class RecordUncheckedUpdateManyWithoutUserInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RecordUncheckedUpdateManyWithoutUserInput({
    this.title,
    this.date,
    this.symptoms,
    this.diagnosis,
    this.treatment,
  });

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? title;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? date;

  final _i1.PrismaUnion<_i2.RecordUpdatesymptomsInput, Iterable<String>>?
      symptoms;

  final _i1.PrismaUnion<_i2.RecordUpdatediagnosisInput, Iterable<String>>?
      diagnosis;

  final _i1.PrismaUnion<_i2.RecordUpdatetreatmentInput, Iterable<String>>?
      treatment;

  @override
  Map<String, dynamic> toJson() => {
        'title': title,
        'date': date,
        'symptoms': symptoms,
        'diagnosis': diagnosis,
        'treatment': treatment,
      };
}

class RecordUpdateManyWithWhereWithoutUserInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RecordUpdateManyWithWhereWithoutUserInput({
    required this.where,
    required this.data,
  });

  final _i2.RecordScalarWhereInput where;

  final _i1.PrismaUnion<_i2.RecordUpdateManyMutationInput,
      _i2.RecordUncheckedUpdateManyWithoutUserInput> data;

  @override
  Map<String, dynamic> toJson() => {
        'where': where,
        'data': data,
      };
}

class RecordUpdateManyWithoutUserNestedInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RecordUpdateManyWithoutUserNestedInput({
    this.create,
    this.connectOrCreate,
    this.upsert,
    this.createMany,
    this.set,
    this.disconnect,
    this.delete,
    this.connect,
    this.update,
    this.updateMany,
    this.deleteMany,
  });

  final _i1.PrismaUnion<
      _i2.RecordCreateWithoutUserInput,
      _i1.PrismaUnion<
          Iterable<_i2.RecordCreateWithoutUserInput>,
          _i1.PrismaUnion<_i2.RecordUncheckedCreateWithoutUserInput,
              Iterable<_i2.RecordUncheckedCreateWithoutUserInput>>>>? create;

  final _i1.PrismaUnion<_i2.RecordCreateOrConnectWithoutUserInput,
      Iterable<_i2.RecordCreateOrConnectWithoutUserInput>>? connectOrCreate;

  final _i1.PrismaUnion<_i2.RecordUpsertWithWhereUniqueWithoutUserInput,
      Iterable<_i2.RecordUpsertWithWhereUniqueWithoutUserInput>>? upsert;

  final _i2.RecordCreateManyUserInputEnvelope? createMany;

  final _i1.PrismaUnion<_i2.RecordWhereUniqueInput,
      Iterable<_i2.RecordWhereUniqueInput>>? set;

  final _i1.PrismaUnion<_i2.RecordWhereUniqueInput,
      Iterable<_i2.RecordWhereUniqueInput>>? disconnect;

  final _i1.PrismaUnion<_i2.RecordWhereUniqueInput,
      Iterable<_i2.RecordWhereUniqueInput>>? delete;

  final _i1.PrismaUnion<_i2.RecordWhereUniqueInput,
      Iterable<_i2.RecordWhereUniqueInput>>? connect;

  final _i1.PrismaUnion<_i2.RecordUpdateWithWhereUniqueWithoutUserInput,
      Iterable<_i2.RecordUpdateWithWhereUniqueWithoutUserInput>>? update;

  final _i1.PrismaUnion<_i2.RecordUpdateManyWithWhereWithoutUserInput,
      Iterable<_i2.RecordUpdateManyWithWhereWithoutUserInput>>? updateMany;

  final _i1.PrismaUnion<_i2.RecordScalarWhereInput,
      Iterable<_i2.RecordScalarWhereInput>>? deleteMany;

  @override
  Map<String, dynamic> toJson() => {
        'create': create,
        'connectOrCreate': connectOrCreate,
        'upsert': upsert,
        'createMany': createMany,
        'set': set,
        'disconnect': disconnect,
        'delete': delete,
        'connect': connect,
        'update': update,
        'updateMany': updateMany,
        'deleteMany': deleteMany,
      };
}

class UserUpdateInput implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserUpdateInput({
    this.name,
    this.username,
    this.height,
    this.weight,
    this.age,
    this.bloodgroup,
    this.gender,
    this.address,
    this.records,
  });

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? name;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? username;

  final _i1.PrismaUnion<
      String,
      _i1.PrismaUnion<_i2.NullableStringFieldUpdateOperationsInput,
          _i1.PrismaNull>>? height;

  final _i1.PrismaUnion<
      String,
      _i1.PrismaUnion<_i2.NullableStringFieldUpdateOperationsInput,
          _i1.PrismaNull>>? weight;

  final _i1.PrismaUnion<
      String,
      _i1.PrismaUnion<_i2.NullableStringFieldUpdateOperationsInput,
          _i1.PrismaNull>>? age;

  final _i1.PrismaUnion<
      String,
      _i1.PrismaUnion<_i2.NullableStringFieldUpdateOperationsInput,
          _i1.PrismaNull>>? bloodgroup;

  final _i1.PrismaUnion<
      String,
      _i1.PrismaUnion<_i2.NullableStringFieldUpdateOperationsInput,
          _i1.PrismaNull>>? gender;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? address;

  final _i2.RecordUpdateManyWithoutUserNestedInput? records;

  @override
  Map<String, dynamic> toJson() => {
        'name': name,
        'username': username,
        'height': height,
        'weight': weight,
        'age': age,
        'bloodgroup': bloodgroup,
        'gender': gender,
        'address': address,
        'records': records,
      };
}

class RecordUncheckedUpdateManyWithoutUserNestedInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RecordUncheckedUpdateManyWithoutUserNestedInput({
    this.create,
    this.connectOrCreate,
    this.upsert,
    this.createMany,
    this.set,
    this.disconnect,
    this.delete,
    this.connect,
    this.update,
    this.updateMany,
    this.deleteMany,
  });

  final _i1.PrismaUnion<
      _i2.RecordCreateWithoutUserInput,
      _i1.PrismaUnion<
          Iterable<_i2.RecordCreateWithoutUserInput>,
          _i1.PrismaUnion<_i2.RecordUncheckedCreateWithoutUserInput,
              Iterable<_i2.RecordUncheckedCreateWithoutUserInput>>>>? create;

  final _i1.PrismaUnion<_i2.RecordCreateOrConnectWithoutUserInput,
      Iterable<_i2.RecordCreateOrConnectWithoutUserInput>>? connectOrCreate;

  final _i1.PrismaUnion<_i2.RecordUpsertWithWhereUniqueWithoutUserInput,
      Iterable<_i2.RecordUpsertWithWhereUniqueWithoutUserInput>>? upsert;

  final _i2.RecordCreateManyUserInputEnvelope? createMany;

  final _i1.PrismaUnion<_i2.RecordWhereUniqueInput,
      Iterable<_i2.RecordWhereUniqueInput>>? set;

  final _i1.PrismaUnion<_i2.RecordWhereUniqueInput,
      Iterable<_i2.RecordWhereUniqueInput>>? disconnect;

  final _i1.PrismaUnion<_i2.RecordWhereUniqueInput,
      Iterable<_i2.RecordWhereUniqueInput>>? delete;

  final _i1.PrismaUnion<_i2.RecordWhereUniqueInput,
      Iterable<_i2.RecordWhereUniqueInput>>? connect;

  final _i1.PrismaUnion<_i2.RecordUpdateWithWhereUniqueWithoutUserInput,
      Iterable<_i2.RecordUpdateWithWhereUniqueWithoutUserInput>>? update;

  final _i1.PrismaUnion<_i2.RecordUpdateManyWithWhereWithoutUserInput,
      Iterable<_i2.RecordUpdateManyWithWhereWithoutUserInput>>? updateMany;

  final _i1.PrismaUnion<_i2.RecordScalarWhereInput,
      Iterable<_i2.RecordScalarWhereInput>>? deleteMany;

  @override
  Map<String, dynamic> toJson() => {
        'create': create,
        'connectOrCreate': connectOrCreate,
        'upsert': upsert,
        'createMany': createMany,
        'set': set,
        'disconnect': disconnect,
        'delete': delete,
        'connect': connect,
        'update': update,
        'updateMany': updateMany,
        'deleteMany': deleteMany,
      };
}

class UserUncheckedUpdateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserUncheckedUpdateInput({
    this.name,
    this.username,
    this.height,
    this.weight,
    this.age,
    this.bloodgroup,
    this.gender,
    this.address,
    this.records,
  });

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? name;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? username;

  final _i1.PrismaUnion<
      String,
      _i1.PrismaUnion<_i2.NullableStringFieldUpdateOperationsInput,
          _i1.PrismaNull>>? height;

  final _i1.PrismaUnion<
      String,
      _i1.PrismaUnion<_i2.NullableStringFieldUpdateOperationsInput,
          _i1.PrismaNull>>? weight;

  final _i1.PrismaUnion<
      String,
      _i1.PrismaUnion<_i2.NullableStringFieldUpdateOperationsInput,
          _i1.PrismaNull>>? age;

  final _i1.PrismaUnion<
      String,
      _i1.PrismaUnion<_i2.NullableStringFieldUpdateOperationsInput,
          _i1.PrismaNull>>? bloodgroup;

  final _i1.PrismaUnion<
      String,
      _i1.PrismaUnion<_i2.NullableStringFieldUpdateOperationsInput,
          _i1.PrismaNull>>? gender;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? address;

  final _i2.RecordUncheckedUpdateManyWithoutUserNestedInput? records;

  @override
  Map<String, dynamic> toJson() => {
        'name': name,
        'username': username,
        'height': height,
        'weight': weight,
        'age': age,
        'bloodgroup': bloodgroup,
        'gender': gender,
        'address': address,
        'records': records,
      };
}

class UserUpdateManyMutationInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserUpdateManyMutationInput({
    this.name,
    this.username,
    this.height,
    this.weight,
    this.age,
    this.bloodgroup,
    this.gender,
    this.address,
  });

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? name;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? username;

  final _i1.PrismaUnion<
      String,
      _i1.PrismaUnion<_i2.NullableStringFieldUpdateOperationsInput,
          _i1.PrismaNull>>? height;

  final _i1.PrismaUnion<
      String,
      _i1.PrismaUnion<_i2.NullableStringFieldUpdateOperationsInput,
          _i1.PrismaNull>>? weight;

  final _i1.PrismaUnion<
      String,
      _i1.PrismaUnion<_i2.NullableStringFieldUpdateOperationsInput,
          _i1.PrismaNull>>? age;

  final _i1.PrismaUnion<
      String,
      _i1.PrismaUnion<_i2.NullableStringFieldUpdateOperationsInput,
          _i1.PrismaNull>>? bloodgroup;

  final _i1.PrismaUnion<
      String,
      _i1.PrismaUnion<_i2.NullableStringFieldUpdateOperationsInput,
          _i1.PrismaNull>>? gender;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? address;

  @override
  Map<String, dynamic> toJson() => {
        'name': name,
        'username': username,
        'height': height,
        'weight': weight,
        'age': age,
        'bloodgroup': bloodgroup,
        'gender': gender,
        'address': address,
      };
}

class UserUncheckedUpdateManyInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserUncheckedUpdateManyInput({
    this.name,
    this.username,
    this.height,
    this.weight,
    this.age,
    this.bloodgroup,
    this.gender,
    this.address,
  });

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? name;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? username;

  final _i1.PrismaUnion<
      String,
      _i1.PrismaUnion<_i2.NullableStringFieldUpdateOperationsInput,
          _i1.PrismaNull>>? height;

  final _i1.PrismaUnion<
      String,
      _i1.PrismaUnion<_i2.NullableStringFieldUpdateOperationsInput,
          _i1.PrismaNull>>? weight;

  final _i1.PrismaUnion<
      String,
      _i1.PrismaUnion<_i2.NullableStringFieldUpdateOperationsInput,
          _i1.PrismaNull>>? age;

  final _i1.PrismaUnion<
      String,
      _i1.PrismaUnion<_i2.NullableStringFieldUpdateOperationsInput,
          _i1.PrismaNull>>? bloodgroup;

  final _i1.PrismaUnion<
      String,
      _i1.PrismaUnion<_i2.NullableStringFieldUpdateOperationsInput,
          _i1.PrismaNull>>? gender;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? address;

  @override
  Map<String, dynamic> toJson() => {
        'name': name,
        'username': username,
        'height': height,
        'weight': weight,
        'age': age,
        'bloodgroup': bloodgroup,
        'gender': gender,
        'address': address,
      };
}

class UserCountAggregateOutputType {
  const UserCountAggregateOutputType({
    this.id,
    this.name,
    this.username,
    this.height,
    this.weight,
    this.age,
    this.bloodgroup,
    this.gender,
    this.address,
    this.$all,
  });

  factory UserCountAggregateOutputType.fromJson(Map json) =>
      UserCountAggregateOutputType(
        id: json['id'],
        name: json['name'],
        username: json['username'],
        height: json['height'],
        weight: json['weight'],
        age: json['age'],
        bloodgroup: json['bloodgroup'],
        gender: json['gender'],
        address: json['address'],
        $all: json['_all'],
      );

  final int? id;

  final int? name;

  final int? username;

  final int? height;

  final int? weight;

  final int? age;

  final int? bloodgroup;

  final int? gender;

  final int? address;

  final int? $all;

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
        '_all': $all,
      };
}

class UserMinAggregateOutputType {
  const UserMinAggregateOutputType({
    this.id,
    this.name,
    this.username,
    this.height,
    this.weight,
    this.age,
    this.bloodgroup,
    this.gender,
    this.address,
  });

  factory UserMinAggregateOutputType.fromJson(Map json) =>
      UserMinAggregateOutputType(
        id: json['id'],
        name: json['name'],
        username: json['username'],
        height: json['height'],
        weight: json['weight'],
        age: json['age'],
        bloodgroup: json['bloodgroup'],
        gender: json['gender'],
        address: json['address'],
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
      };
}

class UserMaxAggregateOutputType {
  const UserMaxAggregateOutputType({
    this.id,
    this.name,
    this.username,
    this.height,
    this.weight,
    this.age,
    this.bloodgroup,
    this.gender,
    this.address,
  });

  factory UserMaxAggregateOutputType.fromJson(Map json) =>
      UserMaxAggregateOutputType(
        id: json['id'],
        name: json['name'],
        username: json['username'],
        height: json['height'],
        weight: json['weight'],
        age: json['age'],
        bloodgroup: json['bloodgroup'],
        gender: json['gender'],
        address: json['address'],
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
      };
}

class UserGroupByOutputType {
  const UserGroupByOutputType({
    this.id,
    this.name,
    this.username,
    this.height,
    this.weight,
    this.age,
    this.bloodgroup,
    this.gender,
    this.address,
    this.$count,
    this.$min,
    this.$max,
  });

  factory UserGroupByOutputType.fromJson(Map json) => UserGroupByOutputType(
        id: json['id'],
        name: json['name'],
        username: json['username'],
        height: json['height'],
        weight: json['weight'],
        age: json['age'],
        bloodgroup: json['bloodgroup'],
        gender: json['gender'],
        address: json['address'],
        $count: json['_count'] is Map
            ? _i2.UserCountAggregateOutputType.fromJson(json['_count'])
            : null,
        $min: json['_min'] is Map
            ? _i2.UserMinAggregateOutputType.fromJson(json['_min'])
            : null,
        $max: json['_max'] is Map
            ? _i2.UserMaxAggregateOutputType.fromJson(json['_max'])
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

  final _i2.UserCountAggregateOutputType? $count;

  final _i2.UserMinAggregateOutputType? $min;

  final _i2.UserMaxAggregateOutputType? $max;

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
        '_count': $count?.toJson(),
        '_min': $min?.toJson(),
        '_max': $max?.toJson(),
      };
}

class UserCountOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserCountOrderByAggregateInput({
    this.id,
    this.name,
    this.username,
    this.height,
    this.weight,
    this.age,
    this.bloodgroup,
    this.gender,
    this.address,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? name;

  final _i2.SortOrder? username;

  final _i2.SortOrder? height;

  final _i2.SortOrder? weight;

  final _i2.SortOrder? age;

  final _i2.SortOrder? bloodgroup;

  final _i2.SortOrder? gender;

  final _i2.SortOrder? address;

  @override
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
      };
}

class UserMaxOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserMaxOrderByAggregateInput({
    this.id,
    this.name,
    this.username,
    this.height,
    this.weight,
    this.age,
    this.bloodgroup,
    this.gender,
    this.address,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? name;

  final _i2.SortOrder? username;

  final _i2.SortOrder? height;

  final _i2.SortOrder? weight;

  final _i2.SortOrder? age;

  final _i2.SortOrder? bloodgroup;

  final _i2.SortOrder? gender;

  final _i2.SortOrder? address;

  @override
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
      };
}

class UserMinOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserMinOrderByAggregateInput({
    this.id,
    this.name,
    this.username,
    this.height,
    this.weight,
    this.age,
    this.bloodgroup,
    this.gender,
    this.address,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? name;

  final _i2.SortOrder? username;

  final _i2.SortOrder? height;

  final _i2.SortOrder? weight;

  final _i2.SortOrder? age;

  final _i2.SortOrder? bloodgroup;

  final _i2.SortOrder? gender;

  final _i2.SortOrder? address;

  @override
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
      };
}

class UserOrderByWithAggregationInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserOrderByWithAggregationInput({
    this.id,
    this.name,
    this.username,
    this.height,
    this.weight,
    this.age,
    this.bloodgroup,
    this.gender,
    this.address,
    this.$count,
    this.$max,
    this.$min,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? name;

  final _i2.SortOrder? username;

  final _i2.SortOrder? height;

  final _i2.SortOrder? weight;

  final _i2.SortOrder? age;

  final _i2.SortOrder? bloodgroup;

  final _i2.SortOrder? gender;

  final _i2.SortOrder? address;

  final _i2.UserCountOrderByAggregateInput? $count;

  final _i2.UserMaxOrderByAggregateInput? $max;

  final _i2.UserMinOrderByAggregateInput? $min;

  @override
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
        '_count': $count,
        '_max': $max,
        '_min': $min,
      };
}

class NestedIntFilter implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NestedIntFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
  });

  final _i1.PrismaUnion<int, _i1.Reference<int>>? equals;

  final _i1.PrismaUnion<Iterable<int>, _i1.Reference<Iterable<int>>>? $in;

  final _i1.PrismaUnion<Iterable<int>, _i1.Reference<Iterable<int>>>? notIn;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? lt;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? lte;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? gt;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? gte;

  final _i1.PrismaUnion<int, _i2.NestedIntFilter>? not;

  @override
  Map<String, dynamic> toJson() => {
        'equals': equals,
        'in': $in,
        'notIn': notIn,
        'lt': lt,
        'lte': lte,
        'gt': gt,
        'gte': gte,
        'not': not,
      };
}

class NestedStringWithAggregatesFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NestedStringWithAggregatesFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.contains,
    this.startsWith,
    this.endsWith,
    this.not,
    this.$count,
    this.$min,
    this.$max,
  });

  final _i1.PrismaUnion<String, _i1.Reference<String>>? equals;

  final _i1.PrismaUnion<Iterable<String>, _i1.Reference<Iterable<String>>>? $in;

  final _i1.PrismaUnion<Iterable<String>, _i1.Reference<Iterable<String>>>?
      notIn;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? contains;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? startsWith;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? endsWith;

  final _i1.PrismaUnion<String, _i2.NestedStringWithAggregatesFilter>? not;

  final _i2.NestedIntFilter? $count;

  final _i2.NestedStringFilter? $min;

  final _i2.NestedStringFilter? $max;

  @override
  Map<String, dynamic> toJson() => {
        'equals': equals,
        'in': $in,
        'notIn': notIn,
        'lt': lt,
        'lte': lte,
        'gt': gt,
        'gte': gte,
        'contains': contains,
        'startsWith': startsWith,
        'endsWith': endsWith,
        'not': not,
        '_count': $count,
        '_min': $min,
        '_max': $max,
      };
}

class StringWithAggregatesFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const StringWithAggregatesFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.contains,
    this.startsWith,
    this.endsWith,
    this.mode,
    this.not,
    this.$count,
    this.$min,
    this.$max,
  });

  final _i1.PrismaUnion<String, _i1.Reference<String>>? equals;

  final _i1.PrismaUnion<Iterable<String>, _i1.Reference<Iterable<String>>>? $in;

  final _i1.PrismaUnion<Iterable<String>, _i1.Reference<Iterable<String>>>?
      notIn;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? contains;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? startsWith;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? endsWith;

  final _i2.QueryMode? mode;

  final _i1.PrismaUnion<String, _i2.NestedStringWithAggregatesFilter>? not;

  final _i2.NestedIntFilter? $count;

  final _i2.NestedStringFilter? $min;

  final _i2.NestedStringFilter? $max;

  @override
  Map<String, dynamic> toJson() => {
        'equals': equals,
        'in': $in,
        'notIn': notIn,
        'lt': lt,
        'lte': lte,
        'gt': gt,
        'gte': gte,
        'contains': contains,
        'startsWith': startsWith,
        'endsWith': endsWith,
        'mode': mode,
        'not': not,
        '_count': $count,
        '_min': $min,
        '_max': $max,
      };
}

class NestedIntNullableFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NestedIntNullableFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
    this.isSet,
  });

  final _i1
      .PrismaUnion<int, _i1.PrismaUnion<_i1.Reference<int>, _i1.PrismaNull>>?
      equals;

  final _i1.PrismaUnion<Iterable<int>,
      _i1.PrismaUnion<_i1.Reference<Iterable<int>>, _i1.PrismaNull>>? $in;

  final _i1.PrismaUnion<Iterable<int>,
      _i1.PrismaUnion<_i1.Reference<Iterable<int>>, _i1.PrismaNull>>? notIn;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? lt;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? lte;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? gt;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? gte;

  final _i1.PrismaUnion<int,
      _i1.PrismaUnion<_i2.NestedIntNullableFilter, _i1.PrismaNull>>? not;

  final bool? isSet;

  @override
  Map<String, dynamic> toJson() => {
        'equals': equals,
        'in': $in,
        'notIn': notIn,
        'lt': lt,
        'lte': lte,
        'gt': gt,
        'gte': gte,
        'not': not,
        'isSet': isSet,
      };
}

class NestedStringNullableWithAggregatesFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NestedStringNullableWithAggregatesFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.contains,
    this.startsWith,
    this.endsWith,
    this.not,
    this.$count,
    this.$min,
    this.$max,
    this.isSet,
  });

  final _i1.PrismaUnion<String,
      _i1.PrismaUnion<_i1.Reference<String>, _i1.PrismaNull>>? equals;

  final _i1.PrismaUnion<Iterable<String>,
      _i1.PrismaUnion<_i1.Reference<Iterable<String>>, _i1.PrismaNull>>? $in;

  final _i1.PrismaUnion<Iterable<String>,
      _i1.PrismaUnion<_i1.Reference<Iterable<String>>, _i1.PrismaNull>>? notIn;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? contains;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? startsWith;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? endsWith;

  final _i1.PrismaUnion<
      String,
      _i1.PrismaUnion<_i2.NestedStringNullableWithAggregatesFilter,
          _i1.PrismaNull>>? not;

  final _i2.NestedIntNullableFilter? $count;

  final _i2.NestedStringNullableFilter? $min;

  final _i2.NestedStringNullableFilter? $max;

  final bool? isSet;

  @override
  Map<String, dynamic> toJson() => {
        'equals': equals,
        'in': $in,
        'notIn': notIn,
        'lt': lt,
        'lte': lte,
        'gt': gt,
        'gte': gte,
        'contains': contains,
        'startsWith': startsWith,
        'endsWith': endsWith,
        'not': not,
        '_count': $count,
        '_min': $min,
        '_max': $max,
        'isSet': isSet,
      };
}

class StringNullableWithAggregatesFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const StringNullableWithAggregatesFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.contains,
    this.startsWith,
    this.endsWith,
    this.mode,
    this.not,
    this.$count,
    this.$min,
    this.$max,
    this.isSet,
  });

  final _i1.PrismaUnion<String,
      _i1.PrismaUnion<_i1.Reference<String>, _i1.PrismaNull>>? equals;

  final _i1.PrismaUnion<Iterable<String>,
      _i1.PrismaUnion<_i1.Reference<Iterable<String>>, _i1.PrismaNull>>? $in;

  final _i1.PrismaUnion<Iterable<String>,
      _i1.PrismaUnion<_i1.Reference<Iterable<String>>, _i1.PrismaNull>>? notIn;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? contains;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? startsWith;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? endsWith;

  final _i2.QueryMode? mode;

  final _i1.PrismaUnion<
      String,
      _i1.PrismaUnion<_i2.NestedStringNullableWithAggregatesFilter,
          _i1.PrismaNull>>? not;

  final _i2.NestedIntNullableFilter? $count;

  final _i2.NestedStringNullableFilter? $min;

  final _i2.NestedStringNullableFilter? $max;

  final bool? isSet;

  @override
  Map<String, dynamic> toJson() => {
        'equals': equals,
        'in': $in,
        'notIn': notIn,
        'lt': lt,
        'lte': lte,
        'gt': gt,
        'gte': gte,
        'contains': contains,
        'startsWith': startsWith,
        'endsWith': endsWith,
        'mode': mode,
        'not': not,
        '_count': $count,
        '_min': $min,
        '_max': $max,
        'isSet': isSet,
      };
}

class UserScalarWhereWithAggregatesInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserScalarWhereWithAggregatesInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.name,
    this.username,
    this.height,
    this.weight,
    this.age,
    this.bloodgroup,
    this.gender,
    this.address,
  });

  final _i1.PrismaUnion<_i2.UserScalarWhereWithAggregatesInput,
      Iterable<_i2.UserScalarWhereWithAggregatesInput>>? AND;

  final Iterable<_i2.UserScalarWhereWithAggregatesInput>? OR;

  final _i1.PrismaUnion<_i2.UserScalarWhereWithAggregatesInput,
      Iterable<_i2.UserScalarWhereWithAggregatesInput>>? NOT;

  final _i1.PrismaUnion<_i2.StringWithAggregatesFilter, String>? id;

  final _i1.PrismaUnion<_i2.StringWithAggregatesFilter, String>? name;

  final _i1.PrismaUnion<_i2.StringWithAggregatesFilter, String>? username;

  final _i1.PrismaUnion<_i2.StringNullableWithAggregatesFilter,
      _i1.PrismaUnion<String, _i1.PrismaNull>>? height;

  final _i1.PrismaUnion<_i2.StringNullableWithAggregatesFilter,
      _i1.PrismaUnion<String, _i1.PrismaNull>>? weight;

  final _i1.PrismaUnion<_i2.StringNullableWithAggregatesFilter,
      _i1.PrismaUnion<String, _i1.PrismaNull>>? age;

  final _i1.PrismaUnion<_i2.StringNullableWithAggregatesFilter,
      _i1.PrismaUnion<String, _i1.PrismaNull>>? bloodgroup;

  final _i1.PrismaUnion<_i2.StringNullableWithAggregatesFilter,
      _i1.PrismaUnion<String, _i1.PrismaNull>>? gender;

  final _i1.PrismaUnion<_i2.StringWithAggregatesFilter, String>? address;

  @override
  Map<String, dynamic> toJson() => {
        'AND': AND,
        'OR': OR,
        'NOT': NOT,
        'id': id,
        'name': name,
        'username': username,
        'height': height,
        'weight': weight,
        'age': age,
        'bloodgroup': bloodgroup,
        'gender': gender,
        'address': address,
      };
}

class UserCountAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserCountAggregateOutputTypeSelect({
    this.id,
    this.name,
    this.username,
    this.height,
    this.weight,
    this.age,
    this.bloodgroup,
    this.gender,
    this.address,
    this.$all,
  });

  final bool? id;

  final bool? name;

  final bool? username;

  final bool? height;

  final bool? weight;

  final bool? age;

  final bool? bloodgroup;

  final bool? gender;

  final bool? address;

  final bool? $all;

  @override
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
        '_all': $all,
      };
}

class UserGroupByOutputTypeCountArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserGroupByOutputTypeCountArgs({this.select});

  final _i2.UserCountAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class UserMinAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserMinAggregateOutputTypeSelect({
    this.id,
    this.name,
    this.username,
    this.height,
    this.weight,
    this.age,
    this.bloodgroup,
    this.gender,
    this.address,
  });

  final bool? id;

  final bool? name;

  final bool? username;

  final bool? height;

  final bool? weight;

  final bool? age;

  final bool? bloodgroup;

  final bool? gender;

  final bool? address;

  @override
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
      };
}

class UserGroupByOutputTypeMinArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserGroupByOutputTypeMinArgs({this.select});

  final _i2.UserMinAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class UserMaxAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserMaxAggregateOutputTypeSelect({
    this.id,
    this.name,
    this.username,
    this.height,
    this.weight,
    this.age,
    this.bloodgroup,
    this.gender,
    this.address,
  });

  final bool? id;

  final bool? name;

  final bool? username;

  final bool? height;

  final bool? weight;

  final bool? age;

  final bool? bloodgroup;

  final bool? gender;

  final bool? address;

  @override
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
      };
}

class UserGroupByOutputTypeMaxArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserGroupByOutputTypeMaxArgs({this.select});

  final _i2.UserMaxAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class UserGroupByOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserGroupByOutputTypeSelect({
    this.id,
    this.name,
    this.username,
    this.height,
    this.weight,
    this.age,
    this.bloodgroup,
    this.gender,
    this.address,
    this.$count,
    this.$min,
    this.$max,
  });

  final bool? id;

  final bool? name;

  final bool? username;

  final bool? height;

  final bool? weight;

  final bool? age;

  final bool? bloodgroup;

  final bool? gender;

  final bool? address;

  final _i1.PrismaUnion<bool, _i2.UserGroupByOutputTypeCountArgs>? $count;

  final _i1.PrismaUnion<bool, _i2.UserGroupByOutputTypeMinArgs>? $min;

  final _i1.PrismaUnion<bool, _i2.UserGroupByOutputTypeMaxArgs>? $max;

  @override
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
        '_count': $count,
        '_min': $min,
        '_max': $max,
      };
}

class AggregateUser {
  const AggregateUser({
    this.$count,
    this.$min,
    this.$max,
  });

  factory AggregateUser.fromJson(Map json) => AggregateUser(
        $count: json['_count'] is Map
            ? _i2.UserCountAggregateOutputType.fromJson(json['_count'])
            : null,
        $min: json['_min'] is Map
            ? _i2.UserMinAggregateOutputType.fromJson(json['_min'])
            : null,
        $max: json['_max'] is Map
            ? _i2.UserMaxAggregateOutputType.fromJson(json['_max'])
            : null,
      );

  final _i2.UserCountAggregateOutputType? $count;

  final _i2.UserMinAggregateOutputType? $min;

  final _i2.UserMaxAggregateOutputType? $max;

  Map<String, dynamic> toJson() => {
        '_count': $count?.toJson(),
        '_min': $min?.toJson(),
        '_max': $max?.toJson(),
      };
}

class AggregateUserCountArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateUserCountArgs({this.select});

  final _i2.UserCountAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateUserMinArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateUserMinArgs({this.select});

  final _i2.UserMinAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateUserMaxArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateUserMaxArgs({this.select});

  final _i2.UserMaxAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateUserSelect implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateUserSelect({
    this.$count,
    this.$min,
    this.$max,
  });

  final _i1.PrismaUnion<bool, _i2.AggregateUserCountArgs>? $count;

  final _i1.PrismaUnion<bool, _i2.AggregateUserMinArgs>? $min;

  final _i1.PrismaUnion<bool, _i2.AggregateUserMaxArgs>? $max;

  @override
  Map<String, dynamic> toJson() => {
        '_count': $count,
        '_min': $min,
        '_max': $max,
      };
}

class UserCreateWithoutRecordsInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserCreateWithoutRecordsInput({
    this.id,
    required this.name,
    required this.username,
    this.height,
    this.weight,
    this.age,
    this.bloodgroup,
    this.gender,
    required this.address,
  });

  final String? id;

  final String name;

  final String username;

  final _i1.PrismaUnion<String, _i1.PrismaNull>? height;

  final _i1.PrismaUnion<String, _i1.PrismaNull>? weight;

  final _i1.PrismaUnion<String, _i1.PrismaNull>? age;

  final _i1.PrismaUnion<String, _i1.PrismaNull>? bloodgroup;

  final _i1.PrismaUnion<String, _i1.PrismaNull>? gender;

  final String address;

  @override
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
      };
}

class UserUncheckedCreateWithoutRecordsInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserUncheckedCreateWithoutRecordsInput({
    this.id,
    required this.name,
    required this.username,
    this.height,
    this.weight,
    this.age,
    this.bloodgroup,
    this.gender,
    required this.address,
  });

  final String? id;

  final String name;

  final String username;

  final _i1.PrismaUnion<String, _i1.PrismaNull>? height;

  final _i1.PrismaUnion<String, _i1.PrismaNull>? weight;

  final _i1.PrismaUnion<String, _i1.PrismaNull>? age;

  final _i1.PrismaUnion<String, _i1.PrismaNull>? bloodgroup;

  final _i1.PrismaUnion<String, _i1.PrismaNull>? gender;

  final String address;

  @override
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
      };
}

class UserCreateOrConnectWithoutRecordsInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserCreateOrConnectWithoutRecordsInput({
    required this.where,
    required this.create,
  });

  final _i2.UserWhereUniqueInput where;

  final _i1.PrismaUnion<_i2.UserCreateWithoutRecordsInput,
      _i2.UserUncheckedCreateWithoutRecordsInput> create;

  @override
  Map<String, dynamic> toJson() => {
        'where': where,
        'create': create,
      };
}

class UserCreateNestedOneWithoutRecordsInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserCreateNestedOneWithoutRecordsInput({
    this.create,
    this.connectOrCreate,
    this.connect,
  });

  final _i1.PrismaUnion<_i2.UserCreateWithoutRecordsInput,
      _i2.UserUncheckedCreateWithoutRecordsInput>? create;

  final _i2.UserCreateOrConnectWithoutRecordsInput? connectOrCreate;

  final _i2.UserWhereUniqueInput? connect;

  @override
  Map<String, dynamic> toJson() => {
        'create': create,
        'connectOrCreate': connectOrCreate,
        'connect': connect,
      };
}

class RecordCreateInput implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RecordCreateInput({
    this.id,
    required this.title,
    required this.date,
    this.symptoms,
    this.diagnosis,
    this.treatment,
    required this.user,
  });

  final String? id;

  final String title;

  final String date;

  final _i1.PrismaUnion<_i2.RecordCreatesymptomsInput, Iterable<String>>?
      symptoms;

  final _i1.PrismaUnion<_i2.RecordCreatediagnosisInput, Iterable<String>>?
      diagnosis;

  final _i1.PrismaUnion<_i2.RecordCreatetreatmentInput, Iterable<String>>?
      treatment;

  final _i2.UserCreateNestedOneWithoutRecordsInput user;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'date': date,
        'symptoms': symptoms,
        'diagnosis': diagnosis,
        'treatment': treatment,
        'user': user,
      };
}

class RecordUncheckedCreateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RecordUncheckedCreateInput({
    this.id,
    required this.title,
    required this.date,
    this.symptoms,
    this.diagnosis,
    this.treatment,
    required this.userId,
  });

  final String? id;

  final String title;

  final String date;

  final _i1.PrismaUnion<_i2.RecordCreatesymptomsInput, Iterable<String>>?
      symptoms;

  final _i1.PrismaUnion<_i2.RecordCreatediagnosisInput, Iterable<String>>?
      diagnosis;

  final _i1.PrismaUnion<_i2.RecordCreatetreatmentInput, Iterable<String>>?
      treatment;

  final String userId;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'date': date,
        'symptoms': symptoms,
        'diagnosis': diagnosis,
        'treatment': treatment,
        'userId': userId,
      };
}

class RecordCreateManyInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RecordCreateManyInput({
    this.id,
    required this.title,
    required this.date,
    this.symptoms,
    this.diagnosis,
    this.treatment,
    required this.userId,
  });

  final String? id;

  final String title;

  final String date;

  final _i1.PrismaUnion<_i2.RecordCreatesymptomsInput, Iterable<String>>?
      symptoms;

  final _i1.PrismaUnion<_i2.RecordCreatediagnosisInput, Iterable<String>>?
      diagnosis;

  final _i1.PrismaUnion<_i2.RecordCreatetreatmentInput, Iterable<String>>?
      treatment;

  final String userId;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'date': date,
        'symptoms': symptoms,
        'diagnosis': diagnosis,
        'treatment': treatment,
        'userId': userId,
      };
}

class UserUpdateWithoutRecordsInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserUpdateWithoutRecordsInput({
    this.name,
    this.username,
    this.height,
    this.weight,
    this.age,
    this.bloodgroup,
    this.gender,
    this.address,
  });

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? name;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? username;

  final _i1.PrismaUnion<
      String,
      _i1.PrismaUnion<_i2.NullableStringFieldUpdateOperationsInput,
          _i1.PrismaNull>>? height;

  final _i1.PrismaUnion<
      String,
      _i1.PrismaUnion<_i2.NullableStringFieldUpdateOperationsInput,
          _i1.PrismaNull>>? weight;

  final _i1.PrismaUnion<
      String,
      _i1.PrismaUnion<_i2.NullableStringFieldUpdateOperationsInput,
          _i1.PrismaNull>>? age;

  final _i1.PrismaUnion<
      String,
      _i1.PrismaUnion<_i2.NullableStringFieldUpdateOperationsInput,
          _i1.PrismaNull>>? bloodgroup;

  final _i1.PrismaUnion<
      String,
      _i1.PrismaUnion<_i2.NullableStringFieldUpdateOperationsInput,
          _i1.PrismaNull>>? gender;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? address;

  @override
  Map<String, dynamic> toJson() => {
        'name': name,
        'username': username,
        'height': height,
        'weight': weight,
        'age': age,
        'bloodgroup': bloodgroup,
        'gender': gender,
        'address': address,
      };
}

class UserUncheckedUpdateWithoutRecordsInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserUncheckedUpdateWithoutRecordsInput({
    this.name,
    this.username,
    this.height,
    this.weight,
    this.age,
    this.bloodgroup,
    this.gender,
    this.address,
  });

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? name;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? username;

  final _i1.PrismaUnion<
      String,
      _i1.PrismaUnion<_i2.NullableStringFieldUpdateOperationsInput,
          _i1.PrismaNull>>? height;

  final _i1.PrismaUnion<
      String,
      _i1.PrismaUnion<_i2.NullableStringFieldUpdateOperationsInput,
          _i1.PrismaNull>>? weight;

  final _i1.PrismaUnion<
      String,
      _i1.PrismaUnion<_i2.NullableStringFieldUpdateOperationsInput,
          _i1.PrismaNull>>? age;

  final _i1.PrismaUnion<
      String,
      _i1.PrismaUnion<_i2.NullableStringFieldUpdateOperationsInput,
          _i1.PrismaNull>>? bloodgroup;

  final _i1.PrismaUnion<
      String,
      _i1.PrismaUnion<_i2.NullableStringFieldUpdateOperationsInput,
          _i1.PrismaNull>>? gender;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? address;

  @override
  Map<String, dynamic> toJson() => {
        'name': name,
        'username': username,
        'height': height,
        'weight': weight,
        'age': age,
        'bloodgroup': bloodgroup,
        'gender': gender,
        'address': address,
      };
}

class UserUpsertWithoutRecordsInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserUpsertWithoutRecordsInput({
    required this.update,
    required this.create,
    this.where,
  });

  final _i1.PrismaUnion<_i2.UserUpdateWithoutRecordsInput,
      _i2.UserUncheckedUpdateWithoutRecordsInput> update;

  final _i1.PrismaUnion<_i2.UserCreateWithoutRecordsInput,
      _i2.UserUncheckedCreateWithoutRecordsInput> create;

  final _i2.UserWhereInput? where;

  @override
  Map<String, dynamic> toJson() => {
        'update': update,
        'create': create,
        'where': where,
      };
}

class UserUpdateToOneWithWhereWithoutRecordsInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserUpdateToOneWithWhereWithoutRecordsInput({
    this.where,
    required this.data,
  });

  final _i2.UserWhereInput? where;

  final _i1.PrismaUnion<_i2.UserUpdateWithoutRecordsInput,
      _i2.UserUncheckedUpdateWithoutRecordsInput> data;

  @override
  Map<String, dynamic> toJson() => {
        'where': where,
        'data': data,
      };
}

class UserUpdateOneRequiredWithoutRecordsNestedInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const UserUpdateOneRequiredWithoutRecordsNestedInput({
    this.create,
    this.connectOrCreate,
    this.upsert,
    this.connect,
    this.update,
  });

  final _i1.PrismaUnion<_i2.UserCreateWithoutRecordsInput,
      _i2.UserUncheckedCreateWithoutRecordsInput>? create;

  final _i2.UserCreateOrConnectWithoutRecordsInput? connectOrCreate;

  final _i2.UserUpsertWithoutRecordsInput? upsert;

  final _i2.UserWhereUniqueInput? connect;

  final _i1.PrismaUnion<
      _i2.UserUpdateToOneWithWhereWithoutRecordsInput,
      _i1.PrismaUnion<_i2.UserUpdateWithoutRecordsInput,
          _i2.UserUncheckedUpdateWithoutRecordsInput>>? update;

  @override
  Map<String, dynamic> toJson() => {
        'create': create,
        'connectOrCreate': connectOrCreate,
        'upsert': upsert,
        'connect': connect,
        'update': update,
      };
}

class RecordUpdateInput implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RecordUpdateInput({
    this.title,
    this.date,
    this.symptoms,
    this.diagnosis,
    this.treatment,
    this.user,
  });

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? title;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? date;

  final _i1.PrismaUnion<_i2.RecordUpdatesymptomsInput, Iterable<String>>?
      symptoms;

  final _i1.PrismaUnion<_i2.RecordUpdatediagnosisInput, Iterable<String>>?
      diagnosis;

  final _i1.PrismaUnion<_i2.RecordUpdatetreatmentInput, Iterable<String>>?
      treatment;

  final _i2.UserUpdateOneRequiredWithoutRecordsNestedInput? user;

  @override
  Map<String, dynamic> toJson() => {
        'title': title,
        'date': date,
        'symptoms': symptoms,
        'diagnosis': diagnosis,
        'treatment': treatment,
        'user': user,
      };
}

class RecordUncheckedUpdateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RecordUncheckedUpdateInput({
    this.title,
    this.date,
    this.symptoms,
    this.diagnosis,
    this.treatment,
    this.userId,
  });

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? title;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? date;

  final _i1.PrismaUnion<_i2.RecordUpdatesymptomsInput, Iterable<String>>?
      symptoms;

  final _i1.PrismaUnion<_i2.RecordUpdatediagnosisInput, Iterable<String>>?
      diagnosis;

  final _i1.PrismaUnion<_i2.RecordUpdatetreatmentInput, Iterable<String>>?
      treatment;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? userId;

  @override
  Map<String, dynamic> toJson() => {
        'title': title,
        'date': date,
        'symptoms': symptoms,
        'diagnosis': diagnosis,
        'treatment': treatment,
        'userId': userId,
      };
}

class RecordUncheckedUpdateManyInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RecordUncheckedUpdateManyInput({
    this.title,
    this.date,
    this.symptoms,
    this.diagnosis,
    this.treatment,
    this.userId,
  });

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? title;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? date;

  final _i1.PrismaUnion<_i2.RecordUpdatesymptomsInput, Iterable<String>>?
      symptoms;

  final _i1.PrismaUnion<_i2.RecordUpdatediagnosisInput, Iterable<String>>?
      diagnosis;

  final _i1.PrismaUnion<_i2.RecordUpdatetreatmentInput, Iterable<String>>?
      treatment;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? userId;

  @override
  Map<String, dynamic> toJson() => {
        'title': title,
        'date': date,
        'symptoms': symptoms,
        'diagnosis': diagnosis,
        'treatment': treatment,
        'userId': userId,
      };
}

class RecordCountAggregateOutputType {
  const RecordCountAggregateOutputType({
    this.id,
    this.title,
    this.date,
    this.symptoms,
    this.diagnosis,
    this.treatment,
    this.userId,
    this.$all,
  });

  factory RecordCountAggregateOutputType.fromJson(Map json) =>
      RecordCountAggregateOutputType(
        id: json['id'],
        title: json['title'],
        date: json['date'],
        symptoms: json['symptoms'],
        diagnosis: json['diagnosis'],
        treatment: json['treatment'],
        userId: json['userId'],
        $all: json['_all'],
      );

  final int? id;

  final int? title;

  final int? date;

  final int? symptoms;

  final int? diagnosis;

  final int? treatment;

  final int? userId;

  final int? $all;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'date': date,
        'symptoms': symptoms,
        'diagnosis': diagnosis,
        'treatment': treatment,
        'userId': userId,
        '_all': $all,
      };
}

class RecordMinAggregateOutputType {
  const RecordMinAggregateOutputType({
    this.id,
    this.title,
    this.date,
    this.userId,
  });

  factory RecordMinAggregateOutputType.fromJson(Map json) =>
      RecordMinAggregateOutputType(
        id: json['id'],
        title: json['title'],
        date: json['date'],
        userId: json['userId'],
      );

  final String? id;

  final String? title;

  final String? date;

  final String? userId;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'date': date,
        'userId': userId,
      };
}

class RecordMaxAggregateOutputType {
  const RecordMaxAggregateOutputType({
    this.id,
    this.title,
    this.date,
    this.userId,
  });

  factory RecordMaxAggregateOutputType.fromJson(Map json) =>
      RecordMaxAggregateOutputType(
        id: json['id'],
        title: json['title'],
        date: json['date'],
        userId: json['userId'],
      );

  final String? id;

  final String? title;

  final String? date;

  final String? userId;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'date': date,
        'userId': userId,
      };
}

class RecordGroupByOutputType {
  const RecordGroupByOutputType({
    this.id,
    this.title,
    this.date,
    this.symptoms,
    this.diagnosis,
    this.treatment,
    this.userId,
    this.$count,
    this.$min,
    this.$max,
  });

  factory RecordGroupByOutputType.fromJson(Map json) => RecordGroupByOutputType(
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
        $count: json['_count'] is Map
            ? _i2.RecordCountAggregateOutputType.fromJson(json['_count'])
            : null,
        $min: json['_min'] is Map
            ? _i2.RecordMinAggregateOutputType.fromJson(json['_min'])
            : null,
        $max: json['_max'] is Map
            ? _i2.RecordMaxAggregateOutputType.fromJson(json['_max'])
            : null,
      );

  final String? id;

  final String? title;

  final String? date;

  final Iterable<String>? symptoms;

  final Iterable<String>? diagnosis;

  final Iterable<String>? treatment;

  final String? userId;

  final _i2.RecordCountAggregateOutputType? $count;

  final _i2.RecordMinAggregateOutputType? $min;

  final _i2.RecordMaxAggregateOutputType? $max;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'date': date,
        'symptoms': symptoms?.map((e) => e),
        'diagnosis': diagnosis?.map((e) => e),
        'treatment': treatment?.map((e) => e),
        'userId': userId,
        '_count': $count?.toJson(),
        '_min': $min?.toJson(),
        '_max': $max?.toJson(),
      };
}

class RecordCountOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RecordCountOrderByAggregateInput({
    this.id,
    this.title,
    this.date,
    this.symptoms,
    this.diagnosis,
    this.treatment,
    this.userId,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? title;

  final _i2.SortOrder? date;

  final _i2.SortOrder? symptoms;

  final _i2.SortOrder? diagnosis;

  final _i2.SortOrder? treatment;

  final _i2.SortOrder? userId;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'date': date,
        'symptoms': symptoms,
        'diagnosis': diagnosis,
        'treatment': treatment,
        'userId': userId,
      };
}

class RecordMaxOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RecordMaxOrderByAggregateInput({
    this.id,
    this.title,
    this.date,
    this.userId,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? title;

  final _i2.SortOrder? date;

  final _i2.SortOrder? userId;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'date': date,
        'userId': userId,
      };
}

class RecordMinOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RecordMinOrderByAggregateInput({
    this.id,
    this.title,
    this.date,
    this.userId,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? title;

  final _i2.SortOrder? date;

  final _i2.SortOrder? userId;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'date': date,
        'userId': userId,
      };
}

class RecordOrderByWithAggregationInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RecordOrderByWithAggregationInput({
    this.id,
    this.title,
    this.date,
    this.symptoms,
    this.diagnosis,
    this.treatment,
    this.userId,
    this.$count,
    this.$max,
    this.$min,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? title;

  final _i2.SortOrder? date;

  final _i2.SortOrder? symptoms;

  final _i2.SortOrder? diagnosis;

  final _i2.SortOrder? treatment;

  final _i2.SortOrder? userId;

  final _i2.RecordCountOrderByAggregateInput? $count;

  final _i2.RecordMaxOrderByAggregateInput? $max;

  final _i2.RecordMinOrderByAggregateInput? $min;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'date': date,
        'symptoms': symptoms,
        'diagnosis': diagnosis,
        'treatment': treatment,
        'userId': userId,
        '_count': $count,
        '_max': $max,
        '_min': $min,
      };
}

class RecordScalarWhereWithAggregatesInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RecordScalarWhereWithAggregatesInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.title,
    this.date,
    this.symptoms,
    this.diagnosis,
    this.treatment,
    this.userId,
  });

  final _i1.PrismaUnion<_i2.RecordScalarWhereWithAggregatesInput,
      Iterable<_i2.RecordScalarWhereWithAggregatesInput>>? AND;

  final Iterable<_i2.RecordScalarWhereWithAggregatesInput>? OR;

  final _i1.PrismaUnion<_i2.RecordScalarWhereWithAggregatesInput,
      Iterable<_i2.RecordScalarWhereWithAggregatesInput>>? NOT;

  final _i1.PrismaUnion<_i2.StringWithAggregatesFilter, String>? id;

  final _i1.PrismaUnion<_i2.StringWithAggregatesFilter, String>? title;

  final _i1.PrismaUnion<_i2.StringWithAggregatesFilter, String>? date;

  final _i2.StringNullableListFilter? symptoms;

  final _i2.StringNullableListFilter? diagnosis;

  final _i2.StringNullableListFilter? treatment;

  final _i1.PrismaUnion<_i2.StringWithAggregatesFilter, String>? userId;

  @override
  Map<String, dynamic> toJson() => {
        'AND': AND,
        'OR': OR,
        'NOT': NOT,
        'id': id,
        'title': title,
        'date': date,
        'symptoms': symptoms,
        'diagnosis': diagnosis,
        'treatment': treatment,
        'userId': userId,
      };
}

class RecordCountAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RecordCountAggregateOutputTypeSelect({
    this.id,
    this.title,
    this.date,
    this.symptoms,
    this.diagnosis,
    this.treatment,
    this.userId,
    this.$all,
  });

  final bool? id;

  final bool? title;

  final bool? date;

  final bool? symptoms;

  final bool? diagnosis;

  final bool? treatment;

  final bool? userId;

  final bool? $all;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'date': date,
        'symptoms': symptoms,
        'diagnosis': diagnosis,
        'treatment': treatment,
        'userId': userId,
        '_all': $all,
      };
}

class RecordGroupByOutputTypeCountArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RecordGroupByOutputTypeCountArgs({this.select});

  final _i2.RecordCountAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class RecordMinAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RecordMinAggregateOutputTypeSelect({
    this.id,
    this.title,
    this.date,
    this.userId,
  });

  final bool? id;

  final bool? title;

  final bool? date;

  final bool? userId;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'date': date,
        'userId': userId,
      };
}

class RecordGroupByOutputTypeMinArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RecordGroupByOutputTypeMinArgs({this.select});

  final _i2.RecordMinAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class RecordMaxAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RecordMaxAggregateOutputTypeSelect({
    this.id,
    this.title,
    this.date,
    this.userId,
  });

  final bool? id;

  final bool? title;

  final bool? date;

  final bool? userId;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'date': date,
        'userId': userId,
      };
}

class RecordGroupByOutputTypeMaxArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RecordGroupByOutputTypeMaxArgs({this.select});

  final _i2.RecordMaxAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class RecordGroupByOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const RecordGroupByOutputTypeSelect({
    this.id,
    this.title,
    this.date,
    this.symptoms,
    this.diagnosis,
    this.treatment,
    this.userId,
    this.$count,
    this.$min,
    this.$max,
  });

  final bool? id;

  final bool? title;

  final bool? date;

  final bool? symptoms;

  final bool? diagnosis;

  final bool? treatment;

  final bool? userId;

  final _i1.PrismaUnion<bool, _i2.RecordGroupByOutputTypeCountArgs>? $count;

  final _i1.PrismaUnion<bool, _i2.RecordGroupByOutputTypeMinArgs>? $min;

  final _i1.PrismaUnion<bool, _i2.RecordGroupByOutputTypeMaxArgs>? $max;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'date': date,
        'symptoms': symptoms,
        'diagnosis': diagnosis,
        'treatment': treatment,
        'userId': userId,
        '_count': $count,
        '_min': $min,
        '_max': $max,
      };
}

class AggregateRecord {
  const AggregateRecord({
    this.$count,
    this.$min,
    this.$max,
  });

  factory AggregateRecord.fromJson(Map json) => AggregateRecord(
        $count: json['_count'] is Map
            ? _i2.RecordCountAggregateOutputType.fromJson(json['_count'])
            : null,
        $min: json['_min'] is Map
            ? _i2.RecordMinAggregateOutputType.fromJson(json['_min'])
            : null,
        $max: json['_max'] is Map
            ? _i2.RecordMaxAggregateOutputType.fromJson(json['_max'])
            : null,
      );

  final _i2.RecordCountAggregateOutputType? $count;

  final _i2.RecordMinAggregateOutputType? $min;

  final _i2.RecordMaxAggregateOutputType? $max;

  Map<String, dynamic> toJson() => {
        '_count': $count?.toJson(),
        '_min': $min?.toJson(),
        '_max': $max?.toJson(),
      };
}

class AggregateRecordCountArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateRecordCountArgs({this.select});

  final _i2.RecordCountAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateRecordMinArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateRecordMinArgs({this.select});

  final _i2.RecordMinAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateRecordMaxArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateRecordMaxArgs({this.select});

  final _i2.RecordMaxAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateRecordSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateRecordSelect({
    this.$count,
    this.$min,
    this.$max,
  });

  final _i1.PrismaUnion<bool, _i2.AggregateRecordCountArgs>? $count;

  final _i1.PrismaUnion<bool, _i2.AggregateRecordMinArgs>? $min;

  final _i1.PrismaUnion<bool, _i2.AggregateRecordMaxArgs>? $max;

  @override
  Map<String, dynamic> toJson() => {
        '_count': $count,
        '_min': $min,
        '_max': $max,
      };
}
