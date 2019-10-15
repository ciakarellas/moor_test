// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps
class Bill extends DataClass implements Insertable<Bill> {
  final int id;
  final String comment;
  Bill({@required this.id, @required this.comment});
  factory Bill.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Bill(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      comment:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}comment']),
    );
  }
  factory Bill.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return Bill(
      id: serializer.fromJson<int>(json['id']),
      comment: serializer.fromJson<String>(json['comment']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<int>(id),
      'comment': serializer.toJson<String>(comment),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<Bill>>(bool nullToAbsent) {
    return BillsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      comment: comment == null && nullToAbsent
          ? const Value.absent()
          : Value(comment),
    ) as T;
  }

  Bill copyWith({int id, String comment}) => Bill(
        id: id ?? this.id,
        comment: comment ?? this.comment,
      );
  @override
  String toString() {
    return (StringBuffer('Bill(')
          ..write('id: $id, ')
          ..write('comment: $comment')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, comment.hashCode));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is Bill && other.id == id && other.comment == comment);
}

class BillsCompanion extends UpdateCompanion<Bill> {
  final Value<int> id;
  final Value<String> comment;
  const BillsCompanion({
    this.id = const Value.absent(),
    this.comment = const Value.absent(),
  });
  BillsCompanion copyWith({Value<int> id, Value<String> comment}) {
    return BillsCompanion(
      id: id ?? this.id,
      comment: comment ?? this.comment,
    );
  }
}

class $BillsTable extends Bills with TableInfo<$BillsTable, Bill> {
  final GeneratedDatabase _db;
  final String _alias;
  $BillsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _commentMeta = const VerificationMeta('comment');
  GeneratedTextColumn _comment;
  @override
  GeneratedTextColumn get comment => _comment ??= _constructComment();
  GeneratedTextColumn _constructComment() {
    return GeneratedTextColumn('comment', $tableName, false,
        minTextLength: 1, maxTextLength: 256);
  }

  @override
  List<GeneratedColumn> get $columns => [id, comment];
  @override
  $BillsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'bills';
  @override
  final String actualTableName = 'bills';
  @override
  VerificationContext validateIntegrity(BillsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.comment.present) {
      context.handle(_commentMeta,
          comment.isAcceptableValue(d.comment.value, _commentMeta));
    } else if (comment.isRequired && isInserting) {
      context.missing(_commentMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Bill map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Bill.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(BillsCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.comment.present) {
      map['comment'] = Variable<String, StringType>(d.comment.value);
    }
    return map;
  }

  @override
  $BillsTable createAlias(String alias) {
    return $BillsTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(const SqlTypeSystem.withDefaults(), e);
  $BillsTable _bills;
  $BillsTable get bills => _bills ??= $BillsTable(this);
  @override
  List<TableInfo> get allTables => [bills];
}
