// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $DrinksTable extends Drinks with TableInfo<$DrinksTable, DrinkRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DrinksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _alcoholContentMeta =
      const VerificationMeta('alcoholContent');
  @override
  late final GeneratedColumn<double> alcoholContent = GeneratedColumn<double>(
      'alcohol_content', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _volumeMeta = const VerificationMeta('volume');
  @override
  late final GeneratedColumn<double> volume = GeneratedColumn<double>(
      'volume', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _volumeUnitMeta =
      const VerificationMeta('volumeUnit');
  @override
  late final GeneratedColumn<String> volumeUnit = GeneratedColumn<String>(
      'volume_unit', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 10),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _priceUnitMeta =
      const VerificationMeta('priceUnit');
  @override
  late final GeneratedColumn<String> priceUnit = GeneratedColumn<String>(
      'price_unit', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 10),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, alcoholContent, volume, volumeUnit, price, priceUnit];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'drinks';
  @override
  VerificationContext validateIntegrity(Insertable<DrinkRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('alcohol_content')) {
      context.handle(
          _alcoholContentMeta,
          alcoholContent.isAcceptableOrUnknown(
              data['alcohol_content']!, _alcoholContentMeta));
    } else if (isInserting) {
      context.missing(_alcoholContentMeta);
    }
    if (data.containsKey('volume')) {
      context.handle(_volumeMeta,
          volume.isAcceptableOrUnknown(data['volume']!, _volumeMeta));
    } else if (isInserting) {
      context.missing(_volumeMeta);
    }
    if (data.containsKey('volume_unit')) {
      context.handle(
          _volumeUnitMeta,
          volumeUnit.isAcceptableOrUnknown(
              data['volume_unit']!, _volumeUnitMeta));
    } else if (isInserting) {
      context.missing(_volumeUnitMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('price_unit')) {
      context.handle(_priceUnitMeta,
          priceUnit.isAcceptableOrUnknown(data['price_unit']!, _priceUnitMeta));
    } else if (isInserting) {
      context.missing(_priceUnitMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DrinkRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DrinkRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      alcoholContent: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}alcohol_content'])!,
      volume: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}volume'])!,
      volumeUnit: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}volume_unit'])!,
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price'])!,
      priceUnit: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}price_unit'])!,
    );
  }

  @override
  $DrinksTable createAlias(String alias) {
    return $DrinksTable(attachedDatabase, alias);
  }
}

class DrinkRow extends DataClass implements Insertable<DrinkRow> {
  final int id;
  final String name;
  final double alcoholContent;
  final double volume;
  final String volumeUnit;
  final double price;
  final String priceUnit;
  const DrinkRow(
      {required this.id,
      required this.name,
      required this.alcoholContent,
      required this.volume,
      required this.volumeUnit,
      required this.price,
      required this.priceUnit});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['alcohol_content'] = Variable<double>(alcoholContent);
    map['volume'] = Variable<double>(volume);
    map['volume_unit'] = Variable<String>(volumeUnit);
    map['price'] = Variable<double>(price);
    map['price_unit'] = Variable<String>(priceUnit);
    return map;
  }

  DrinksCompanion toCompanion(bool nullToAbsent) {
    return DrinksCompanion(
      id: Value(id),
      name: Value(name),
      alcoholContent: Value(alcoholContent),
      volume: Value(volume),
      volumeUnit: Value(volumeUnit),
      price: Value(price),
      priceUnit: Value(priceUnit),
    );
  }

  factory DrinkRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DrinkRow(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      alcoholContent: serializer.fromJson<double>(json['alcoholContent']),
      volume: serializer.fromJson<double>(json['volume']),
      volumeUnit: serializer.fromJson<String>(json['volumeUnit']),
      price: serializer.fromJson<double>(json['price']),
      priceUnit: serializer.fromJson<String>(json['priceUnit']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'alcoholContent': serializer.toJson<double>(alcoholContent),
      'volume': serializer.toJson<double>(volume),
      'volumeUnit': serializer.toJson<String>(volumeUnit),
      'price': serializer.toJson<double>(price),
      'priceUnit': serializer.toJson<String>(priceUnit),
    };
  }

  DrinkRow copyWith(
          {int? id,
          String? name,
          double? alcoholContent,
          double? volume,
          String? volumeUnit,
          double? price,
          String? priceUnit}) =>
      DrinkRow(
        id: id ?? this.id,
        name: name ?? this.name,
        alcoholContent: alcoholContent ?? this.alcoholContent,
        volume: volume ?? this.volume,
        volumeUnit: volumeUnit ?? this.volumeUnit,
        price: price ?? this.price,
        priceUnit: priceUnit ?? this.priceUnit,
      );
  @override
  String toString() {
    return (StringBuffer('DrinkRow(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('alcoholContent: $alcoholContent, ')
          ..write('volume: $volume, ')
          ..write('volumeUnit: $volumeUnit, ')
          ..write('price: $price, ')
          ..write('priceUnit: $priceUnit')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, name, alcoholContent, volume, volumeUnit, price, priceUnit);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DrinkRow &&
          other.id == this.id &&
          other.name == this.name &&
          other.alcoholContent == this.alcoholContent &&
          other.volume == this.volume &&
          other.volumeUnit == this.volumeUnit &&
          other.price == this.price &&
          other.priceUnit == this.priceUnit);
}

class DrinksCompanion extends UpdateCompanion<DrinkRow> {
  final Value<int> id;
  final Value<String> name;
  final Value<double> alcoholContent;
  final Value<double> volume;
  final Value<String> volumeUnit;
  final Value<double> price;
  final Value<String> priceUnit;
  const DrinksCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.alcoholContent = const Value.absent(),
    this.volume = const Value.absent(),
    this.volumeUnit = const Value.absent(),
    this.price = const Value.absent(),
    this.priceUnit = const Value.absent(),
  });
  DrinksCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required double alcoholContent,
    required double volume,
    required String volumeUnit,
    required double price,
    required String priceUnit,
  })  : name = Value(name),
        alcoholContent = Value(alcoholContent),
        volume = Value(volume),
        volumeUnit = Value(volumeUnit),
        price = Value(price),
        priceUnit = Value(priceUnit);
  static Insertable<DrinkRow> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<double>? alcoholContent,
    Expression<double>? volume,
    Expression<String>? volumeUnit,
    Expression<double>? price,
    Expression<String>? priceUnit,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (alcoholContent != null) 'alcohol_content': alcoholContent,
      if (volume != null) 'volume': volume,
      if (volumeUnit != null) 'volume_unit': volumeUnit,
      if (price != null) 'price': price,
      if (priceUnit != null) 'price_unit': priceUnit,
    });
  }

  DrinksCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<double>? alcoholContent,
      Value<double>? volume,
      Value<String>? volumeUnit,
      Value<double>? price,
      Value<String>? priceUnit}) {
    return DrinksCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      alcoholContent: alcoholContent ?? this.alcoholContent,
      volume: volume ?? this.volume,
      volumeUnit: volumeUnit ?? this.volumeUnit,
      price: price ?? this.price,
      priceUnit: priceUnit ?? this.priceUnit,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (alcoholContent.present) {
      map['alcohol_content'] = Variable<double>(alcoholContent.value);
    }
    if (volume.present) {
      map['volume'] = Variable<double>(volume.value);
    }
    if (volumeUnit.present) {
      map['volume_unit'] = Variable<String>(volumeUnit.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (priceUnit.present) {
      map['price_unit'] = Variable<String>(priceUnit.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DrinksCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('alcoholContent: $alcoholContent, ')
          ..write('volume: $volume, ')
          ..write('volumeUnit: $volumeUnit, ')
          ..write('price: $price, ')
          ..write('priceUnit: $priceUnit')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $DrinksTable drinks = $DrinksTable(this);
  late final DrinksDao drinksDao = DrinksDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [drinks];
}

mixin _$DrinksDaoMixin on DatabaseAccessor<AppDatabase> {
  $DrinksTable get drinks => attachedDatabase.drinks;
}
