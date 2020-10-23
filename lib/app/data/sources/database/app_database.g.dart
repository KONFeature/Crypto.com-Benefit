// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class ImportedFileEntity extends DataClass
    implements Insertable<ImportedFileEntity> {
  final int id;
  final String filename;
  final int typeIndex;
  final DateTime generatedTimestamp;
  final DateTime importedTimestamp;
  ImportedFileEntity(
      {@required this.id,
      @required this.filename,
      @required this.typeIndex,
      @required this.generatedTimestamp,
      @required this.importedTimestamp});
  factory ImportedFileEntity.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return ImportedFileEntity(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      filename: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}filename']),
      typeIndex:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}type_index']),
      generatedTimestamp: dateTimeType.mapFromDatabaseResponse(
          data['${effectivePrefix}generated_timestamp']),
      importedTimestamp: dateTimeType.mapFromDatabaseResponse(
          data['${effectivePrefix}imported_timestamp']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || filename != null) {
      map['filename'] = Variable<String>(filename);
    }
    if (!nullToAbsent || typeIndex != null) {
      map['type_index'] = Variable<int>(typeIndex);
    }
    if (!nullToAbsent || generatedTimestamp != null) {
      map['generated_timestamp'] = Variable<DateTime>(generatedTimestamp);
    }
    if (!nullToAbsent || importedTimestamp != null) {
      map['imported_timestamp'] = Variable<DateTime>(importedTimestamp);
    }
    return map;
  }

  ImportedFilesTableCompanion toCompanion(bool nullToAbsent) {
    return ImportedFilesTableCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      filename: filename == null && nullToAbsent
          ? const Value.absent()
          : Value(filename),
      typeIndex: typeIndex == null && nullToAbsent
          ? const Value.absent()
          : Value(typeIndex),
      generatedTimestamp: generatedTimestamp == null && nullToAbsent
          ? const Value.absent()
          : Value(generatedTimestamp),
      importedTimestamp: importedTimestamp == null && nullToAbsent
          ? const Value.absent()
          : Value(importedTimestamp),
    );
  }

  factory ImportedFileEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ImportedFileEntity(
      id: serializer.fromJson<int>(json['id']),
      filename: serializer.fromJson<String>(json['filename']),
      typeIndex: serializer.fromJson<int>(json['typeIndex']),
      generatedTimestamp:
          serializer.fromJson<DateTime>(json['generatedTimestamp']),
      importedTimestamp:
          serializer.fromJson<DateTime>(json['importedTimestamp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'filename': serializer.toJson<String>(filename),
      'typeIndex': serializer.toJson<int>(typeIndex),
      'generatedTimestamp': serializer.toJson<DateTime>(generatedTimestamp),
      'importedTimestamp': serializer.toJson<DateTime>(importedTimestamp),
    };
  }

  ImportedFileEntity copyWith(
          {int id,
          String filename,
          int typeIndex,
          DateTime generatedTimestamp,
          DateTime importedTimestamp}) =>
      ImportedFileEntity(
        id: id ?? this.id,
        filename: filename ?? this.filename,
        typeIndex: typeIndex ?? this.typeIndex,
        generatedTimestamp: generatedTimestamp ?? this.generatedTimestamp,
        importedTimestamp: importedTimestamp ?? this.importedTimestamp,
      );
  @override
  String toString() {
    return (StringBuffer('ImportedFileEntity(')
          ..write('id: $id, ')
          ..write('filename: $filename, ')
          ..write('typeIndex: $typeIndex, ')
          ..write('generatedTimestamp: $generatedTimestamp, ')
          ..write('importedTimestamp: $importedTimestamp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          filename.hashCode,
          $mrjc(
              typeIndex.hashCode,
              $mrjc(
                  generatedTimestamp.hashCode, importedTimestamp.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is ImportedFileEntity &&
          other.id == this.id &&
          other.filename == this.filename &&
          other.typeIndex == this.typeIndex &&
          other.generatedTimestamp == this.generatedTimestamp &&
          other.importedTimestamp == this.importedTimestamp);
}

class ImportedFilesTableCompanion extends UpdateCompanion<ImportedFileEntity> {
  final Value<int> id;
  final Value<String> filename;
  final Value<int> typeIndex;
  final Value<DateTime> generatedTimestamp;
  final Value<DateTime> importedTimestamp;
  const ImportedFilesTableCompanion({
    this.id = const Value.absent(),
    this.filename = const Value.absent(),
    this.typeIndex = const Value.absent(),
    this.generatedTimestamp = const Value.absent(),
    this.importedTimestamp = const Value.absent(),
  });
  ImportedFilesTableCompanion.insert({
    this.id = const Value.absent(),
    @required String filename,
    @required int typeIndex,
    @required DateTime generatedTimestamp,
    @required DateTime importedTimestamp,
  })  : filename = Value(filename),
        typeIndex = Value(typeIndex),
        generatedTimestamp = Value(generatedTimestamp),
        importedTimestamp = Value(importedTimestamp);
  static Insertable<ImportedFileEntity> custom({
    Expression<int> id,
    Expression<String> filename,
    Expression<int> typeIndex,
    Expression<DateTime> generatedTimestamp,
    Expression<DateTime> importedTimestamp,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (filename != null) 'filename': filename,
      if (typeIndex != null) 'type_index': typeIndex,
      if (generatedTimestamp != null) 'generated_timestamp': generatedTimestamp,
      if (importedTimestamp != null) 'imported_timestamp': importedTimestamp,
    });
  }

  ImportedFilesTableCompanion copyWith(
      {Value<int> id,
      Value<String> filename,
      Value<int> typeIndex,
      Value<DateTime> generatedTimestamp,
      Value<DateTime> importedTimestamp}) {
    return ImportedFilesTableCompanion(
      id: id ?? this.id,
      filename: filename ?? this.filename,
      typeIndex: typeIndex ?? this.typeIndex,
      generatedTimestamp: generatedTimestamp ?? this.generatedTimestamp,
      importedTimestamp: importedTimestamp ?? this.importedTimestamp,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (filename.present) {
      map['filename'] = Variable<String>(filename.value);
    }
    if (typeIndex.present) {
      map['type_index'] = Variable<int>(typeIndex.value);
    }
    if (generatedTimestamp.present) {
      map['generated_timestamp'] = Variable<DateTime>(generatedTimestamp.value);
    }
    if (importedTimestamp.present) {
      map['imported_timestamp'] = Variable<DateTime>(importedTimestamp.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ImportedFilesTableCompanion(')
          ..write('id: $id, ')
          ..write('filename: $filename, ')
          ..write('typeIndex: $typeIndex, ')
          ..write('generatedTimestamp: $generatedTimestamp, ')
          ..write('importedTimestamp: $importedTimestamp')
          ..write(')'))
        .toString();
  }
}

class $ImportedFilesTableTable extends ImportedFilesTable
    with TableInfo<$ImportedFilesTableTable, ImportedFileEntity> {
  final GeneratedDatabase _db;
  final String _alias;
  $ImportedFilesTableTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _filenameMeta = const VerificationMeta('filename');
  GeneratedTextColumn _filename;
  @override
  GeneratedTextColumn get filename => _filename ??= _constructFilename();
  GeneratedTextColumn _constructFilename() {
    return GeneratedTextColumn('filename', $tableName, false,
        $customConstraints: 'UNIQUE');
  }

  final VerificationMeta _typeIndexMeta = const VerificationMeta('typeIndex');
  GeneratedIntColumn _typeIndex;
  @override
  GeneratedIntColumn get typeIndex => _typeIndex ??= _constructTypeIndex();
  GeneratedIntColumn _constructTypeIndex() {
    return GeneratedIntColumn(
      'type_index',
      $tableName,
      false,
    );
  }

  final VerificationMeta _generatedTimestampMeta =
      const VerificationMeta('generatedTimestamp');
  GeneratedDateTimeColumn _generatedTimestamp;
  @override
  GeneratedDateTimeColumn get generatedTimestamp =>
      _generatedTimestamp ??= _constructGeneratedTimestamp();
  GeneratedDateTimeColumn _constructGeneratedTimestamp() {
    return GeneratedDateTimeColumn(
      'generated_timestamp',
      $tableName,
      false,
    );
  }

  final VerificationMeta _importedTimestampMeta =
      const VerificationMeta('importedTimestamp');
  GeneratedDateTimeColumn _importedTimestamp;
  @override
  GeneratedDateTimeColumn get importedTimestamp =>
      _importedTimestamp ??= _constructImportedTimestamp();
  GeneratedDateTimeColumn _constructImportedTimestamp() {
    return GeneratedDateTimeColumn(
      'imported_timestamp',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, filename, typeIndex, generatedTimestamp, importedTimestamp];
  @override
  $ImportedFilesTableTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'imported_files_table';
  @override
  final String actualTableName = 'imported_files_table';
  @override
  VerificationContext validateIntegrity(Insertable<ImportedFileEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('filename')) {
      context.handle(_filenameMeta,
          filename.isAcceptableOrUnknown(data['filename'], _filenameMeta));
    } else if (isInserting) {
      context.missing(_filenameMeta);
    }
    if (data.containsKey('type_index')) {
      context.handle(_typeIndexMeta,
          typeIndex.isAcceptableOrUnknown(data['type_index'], _typeIndexMeta));
    } else if (isInserting) {
      context.missing(_typeIndexMeta);
    }
    if (data.containsKey('generated_timestamp')) {
      context.handle(
          _generatedTimestampMeta,
          generatedTimestamp.isAcceptableOrUnknown(
              data['generated_timestamp'], _generatedTimestampMeta));
    } else if (isInserting) {
      context.missing(_generatedTimestampMeta);
    }
    if (data.containsKey('imported_timestamp')) {
      context.handle(
          _importedTimestampMeta,
          importedTimestamp.isAcceptableOrUnknown(
              data['imported_timestamp'], _importedTimestampMeta));
    } else if (isInserting) {
      context.missing(_importedTimestampMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ImportedFileEntity map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return ImportedFileEntity.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ImportedFilesTableTable createAlias(String alias) {
    return $ImportedFilesTableTable(_db, alias);
  }
}

class TransactionKindEntity extends DataClass
    implements Insertable<TransactionKindEntity> {
  final int id;
  final String name;
  TransactionKindEntity({@required this.id, @required this.name});
  factory TransactionKindEntity.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return TransactionKindEntity(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    return map;
  }

  TransactionKindsTableCompanion toCompanion(bool nullToAbsent) {
    return TransactionKindsTableCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
    );
  }

  factory TransactionKindEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return TransactionKindEntity(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  TransactionKindEntity copyWith({int id, String name}) =>
      TransactionKindEntity(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('TransactionKindEntity(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, name.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is TransactionKindEntity &&
          other.id == this.id &&
          other.name == this.name);
}

class TransactionKindsTableCompanion
    extends UpdateCompanion<TransactionKindEntity> {
  final Value<int> id;
  final Value<String> name;
  const TransactionKindsTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  TransactionKindsTableCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
  }) : name = Value(name);
  static Insertable<TransactionKindEntity> custom({
    Expression<int> id,
    Expression<String> name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  TransactionKindsTableCompanion copyWith({Value<int> id, Value<String> name}) {
    return TransactionKindsTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionKindsTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $TransactionKindsTableTable extends TransactionKindsTable
    with TableInfo<$TransactionKindsTableTable, TransactionKindEntity> {
  final GeneratedDatabase _db;
  final String _alias;
  $TransactionKindsTableTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false,
        $customConstraints: 'UNIQUE');
  }

  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  $TransactionKindsTableTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'transaction_kinds_table';
  @override
  final String actualTableName = 'transaction_kinds_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<TransactionKindEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TransactionKindEntity map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return TransactionKindEntity.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $TransactionKindsTableTable createAlias(String alias) {
    return $TransactionKindsTableTable(_db, alias);
  }
}

class TransactionEntity extends DataClass
    implements Insertable<TransactionEntity> {
  final int id;
  final int fileId;
  final DateTime timestamp;
  final String description;
  final String sourceCurrency;
  final double sourceAmount;
  final String toCurrency;
  final double toAmount;
  final String nativeCurrency;
  final double nativeAmount;
  final double usdAmount;
  final String rawKind;
  final int kindId;
  TransactionEntity(
      {@required this.id,
      @required this.fileId,
      @required this.timestamp,
      @required this.description,
      @required this.sourceCurrency,
      @required this.sourceAmount,
      this.toCurrency,
      this.toAmount,
      @required this.nativeCurrency,
      @required this.nativeAmount,
      @required this.usdAmount,
      this.rawKind,
      this.kindId});
  factory TransactionEntity.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final stringType = db.typeSystem.forDartType<String>();
    final doubleType = db.typeSystem.forDartType<double>();
    return TransactionEntity(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      fileId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}file_id']),
      timestamp: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}timestamp']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      sourceCurrency: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}source_currency']),
      sourceAmount: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}source_amount']),
      toCurrency: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}to_currency']),
      toAmount: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}to_amount']),
      nativeCurrency: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}native_currency']),
      nativeAmount: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}native_amount']),
      usdAmount: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}usd_amount']),
      rawKind: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}raw_kind']),
      kindId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}kind_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || fileId != null) {
      map['file_id'] = Variable<int>(fileId);
    }
    if (!nullToAbsent || timestamp != null) {
      map['timestamp'] = Variable<DateTime>(timestamp);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || sourceCurrency != null) {
      map['source_currency'] = Variable<String>(sourceCurrency);
    }
    if (!nullToAbsent || sourceAmount != null) {
      map['source_amount'] = Variable<double>(sourceAmount);
    }
    if (!nullToAbsent || toCurrency != null) {
      map['to_currency'] = Variable<String>(toCurrency);
    }
    if (!nullToAbsent || toAmount != null) {
      map['to_amount'] = Variable<double>(toAmount);
    }
    if (!nullToAbsent || nativeCurrency != null) {
      map['native_currency'] = Variable<String>(nativeCurrency);
    }
    if (!nullToAbsent || nativeAmount != null) {
      map['native_amount'] = Variable<double>(nativeAmount);
    }
    if (!nullToAbsent || usdAmount != null) {
      map['usd_amount'] = Variable<double>(usdAmount);
    }
    if (!nullToAbsent || rawKind != null) {
      map['raw_kind'] = Variable<String>(rawKind);
    }
    if (!nullToAbsent || kindId != null) {
      map['kind_id'] = Variable<int>(kindId);
    }
    return map;
  }

  TransactionsTableCompanion toCompanion(bool nullToAbsent) {
    return TransactionsTableCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      fileId:
          fileId == null && nullToAbsent ? const Value.absent() : Value(fileId),
      timestamp: timestamp == null && nullToAbsent
          ? const Value.absent()
          : Value(timestamp),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      sourceCurrency: sourceCurrency == null && nullToAbsent
          ? const Value.absent()
          : Value(sourceCurrency),
      sourceAmount: sourceAmount == null && nullToAbsent
          ? const Value.absent()
          : Value(sourceAmount),
      toCurrency: toCurrency == null && nullToAbsent
          ? const Value.absent()
          : Value(toCurrency),
      toAmount: toAmount == null && nullToAbsent
          ? const Value.absent()
          : Value(toAmount),
      nativeCurrency: nativeCurrency == null && nullToAbsent
          ? const Value.absent()
          : Value(nativeCurrency),
      nativeAmount: nativeAmount == null && nullToAbsent
          ? const Value.absent()
          : Value(nativeAmount),
      usdAmount: usdAmount == null && nullToAbsent
          ? const Value.absent()
          : Value(usdAmount),
      rawKind: rawKind == null && nullToAbsent
          ? const Value.absent()
          : Value(rawKind),
      kindId:
          kindId == null && nullToAbsent ? const Value.absent() : Value(kindId),
    );
  }

  factory TransactionEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return TransactionEntity(
      id: serializer.fromJson<int>(json['id']),
      fileId: serializer.fromJson<int>(json['fileId']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
      description: serializer.fromJson<String>(json['description']),
      sourceCurrency: serializer.fromJson<String>(json['sourceCurrency']),
      sourceAmount: serializer.fromJson<double>(json['sourceAmount']),
      toCurrency: serializer.fromJson<String>(json['toCurrency']),
      toAmount: serializer.fromJson<double>(json['toAmount']),
      nativeCurrency: serializer.fromJson<String>(json['nativeCurrency']),
      nativeAmount: serializer.fromJson<double>(json['nativeAmount']),
      usdAmount: serializer.fromJson<double>(json['usdAmount']),
      rawKind: serializer.fromJson<String>(json['rawKind']),
      kindId: serializer.fromJson<int>(json['kindId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'fileId': serializer.toJson<int>(fileId),
      'timestamp': serializer.toJson<DateTime>(timestamp),
      'description': serializer.toJson<String>(description),
      'sourceCurrency': serializer.toJson<String>(sourceCurrency),
      'sourceAmount': serializer.toJson<double>(sourceAmount),
      'toCurrency': serializer.toJson<String>(toCurrency),
      'toAmount': serializer.toJson<double>(toAmount),
      'nativeCurrency': serializer.toJson<String>(nativeCurrency),
      'nativeAmount': serializer.toJson<double>(nativeAmount),
      'usdAmount': serializer.toJson<double>(usdAmount),
      'rawKind': serializer.toJson<String>(rawKind),
      'kindId': serializer.toJson<int>(kindId),
    };
  }

  TransactionEntity copyWith(
          {int id,
          int fileId,
          DateTime timestamp,
          String description,
          String sourceCurrency,
          double sourceAmount,
          String toCurrency,
          double toAmount,
          String nativeCurrency,
          double nativeAmount,
          double usdAmount,
          String rawKind,
          int kindId}) =>
      TransactionEntity(
        id: id ?? this.id,
        fileId: fileId ?? this.fileId,
        timestamp: timestamp ?? this.timestamp,
        description: description ?? this.description,
        sourceCurrency: sourceCurrency ?? this.sourceCurrency,
        sourceAmount: sourceAmount ?? this.sourceAmount,
        toCurrency: toCurrency ?? this.toCurrency,
        toAmount: toAmount ?? this.toAmount,
        nativeCurrency: nativeCurrency ?? this.nativeCurrency,
        nativeAmount: nativeAmount ?? this.nativeAmount,
        usdAmount: usdAmount ?? this.usdAmount,
        rawKind: rawKind ?? this.rawKind,
        kindId: kindId ?? this.kindId,
      );
  @override
  String toString() {
    return (StringBuffer('TransactionEntity(')
          ..write('id: $id, ')
          ..write('fileId: $fileId, ')
          ..write('timestamp: $timestamp, ')
          ..write('description: $description, ')
          ..write('sourceCurrency: $sourceCurrency, ')
          ..write('sourceAmount: $sourceAmount, ')
          ..write('toCurrency: $toCurrency, ')
          ..write('toAmount: $toAmount, ')
          ..write('nativeCurrency: $nativeCurrency, ')
          ..write('nativeAmount: $nativeAmount, ')
          ..write('usdAmount: $usdAmount, ')
          ..write('rawKind: $rawKind, ')
          ..write('kindId: $kindId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          fileId.hashCode,
          $mrjc(
              timestamp.hashCode,
              $mrjc(
                  description.hashCode,
                  $mrjc(
                      sourceCurrency.hashCode,
                      $mrjc(
                          sourceAmount.hashCode,
                          $mrjc(
                              toCurrency.hashCode,
                              $mrjc(
                                  toAmount.hashCode,
                                  $mrjc(
                                      nativeCurrency.hashCode,
                                      $mrjc(
                                          nativeAmount.hashCode,
                                          $mrjc(
                                              usdAmount.hashCode,
                                              $mrjc(rawKind.hashCode,
                                                  kindId.hashCode)))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is TransactionEntity &&
          other.id == this.id &&
          other.fileId == this.fileId &&
          other.timestamp == this.timestamp &&
          other.description == this.description &&
          other.sourceCurrency == this.sourceCurrency &&
          other.sourceAmount == this.sourceAmount &&
          other.toCurrency == this.toCurrency &&
          other.toAmount == this.toAmount &&
          other.nativeCurrency == this.nativeCurrency &&
          other.nativeAmount == this.nativeAmount &&
          other.usdAmount == this.usdAmount &&
          other.rawKind == this.rawKind &&
          other.kindId == this.kindId);
}

class TransactionsTableCompanion extends UpdateCompanion<TransactionEntity> {
  final Value<int> id;
  final Value<int> fileId;
  final Value<DateTime> timestamp;
  final Value<String> description;
  final Value<String> sourceCurrency;
  final Value<double> sourceAmount;
  final Value<String> toCurrency;
  final Value<double> toAmount;
  final Value<String> nativeCurrency;
  final Value<double> nativeAmount;
  final Value<double> usdAmount;
  final Value<String> rawKind;
  final Value<int> kindId;
  const TransactionsTableCompanion({
    this.id = const Value.absent(),
    this.fileId = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.description = const Value.absent(),
    this.sourceCurrency = const Value.absent(),
    this.sourceAmount = const Value.absent(),
    this.toCurrency = const Value.absent(),
    this.toAmount = const Value.absent(),
    this.nativeCurrency = const Value.absent(),
    this.nativeAmount = const Value.absent(),
    this.usdAmount = const Value.absent(),
    this.rawKind = const Value.absent(),
    this.kindId = const Value.absent(),
  });
  TransactionsTableCompanion.insert({
    this.id = const Value.absent(),
    @required int fileId,
    @required DateTime timestamp,
    @required String description,
    @required String sourceCurrency,
    @required double sourceAmount,
    this.toCurrency = const Value.absent(),
    this.toAmount = const Value.absent(),
    @required String nativeCurrency,
    @required double nativeAmount,
    @required double usdAmount,
    this.rawKind = const Value.absent(),
    this.kindId = const Value.absent(),
  })  : fileId = Value(fileId),
        timestamp = Value(timestamp),
        description = Value(description),
        sourceCurrency = Value(sourceCurrency),
        sourceAmount = Value(sourceAmount),
        nativeCurrency = Value(nativeCurrency),
        nativeAmount = Value(nativeAmount),
        usdAmount = Value(usdAmount);
  static Insertable<TransactionEntity> custom({
    Expression<int> id,
    Expression<int> fileId,
    Expression<DateTime> timestamp,
    Expression<String> description,
    Expression<String> sourceCurrency,
    Expression<double> sourceAmount,
    Expression<String> toCurrency,
    Expression<double> toAmount,
    Expression<String> nativeCurrency,
    Expression<double> nativeAmount,
    Expression<double> usdAmount,
    Expression<String> rawKind,
    Expression<int> kindId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (fileId != null) 'file_id': fileId,
      if (timestamp != null) 'timestamp': timestamp,
      if (description != null) 'description': description,
      if (sourceCurrency != null) 'source_currency': sourceCurrency,
      if (sourceAmount != null) 'source_amount': sourceAmount,
      if (toCurrency != null) 'to_currency': toCurrency,
      if (toAmount != null) 'to_amount': toAmount,
      if (nativeCurrency != null) 'native_currency': nativeCurrency,
      if (nativeAmount != null) 'native_amount': nativeAmount,
      if (usdAmount != null) 'usd_amount': usdAmount,
      if (rawKind != null) 'raw_kind': rawKind,
      if (kindId != null) 'kind_id': kindId,
    });
  }

  TransactionsTableCompanion copyWith(
      {Value<int> id,
      Value<int> fileId,
      Value<DateTime> timestamp,
      Value<String> description,
      Value<String> sourceCurrency,
      Value<double> sourceAmount,
      Value<String> toCurrency,
      Value<double> toAmount,
      Value<String> nativeCurrency,
      Value<double> nativeAmount,
      Value<double> usdAmount,
      Value<String> rawKind,
      Value<int> kindId}) {
    return TransactionsTableCompanion(
      id: id ?? this.id,
      fileId: fileId ?? this.fileId,
      timestamp: timestamp ?? this.timestamp,
      description: description ?? this.description,
      sourceCurrency: sourceCurrency ?? this.sourceCurrency,
      sourceAmount: sourceAmount ?? this.sourceAmount,
      toCurrency: toCurrency ?? this.toCurrency,
      toAmount: toAmount ?? this.toAmount,
      nativeCurrency: nativeCurrency ?? this.nativeCurrency,
      nativeAmount: nativeAmount ?? this.nativeAmount,
      usdAmount: usdAmount ?? this.usdAmount,
      rawKind: rawKind ?? this.rawKind,
      kindId: kindId ?? this.kindId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (fileId.present) {
      map['file_id'] = Variable<int>(fileId.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (sourceCurrency.present) {
      map['source_currency'] = Variable<String>(sourceCurrency.value);
    }
    if (sourceAmount.present) {
      map['source_amount'] = Variable<double>(sourceAmount.value);
    }
    if (toCurrency.present) {
      map['to_currency'] = Variable<String>(toCurrency.value);
    }
    if (toAmount.present) {
      map['to_amount'] = Variable<double>(toAmount.value);
    }
    if (nativeCurrency.present) {
      map['native_currency'] = Variable<String>(nativeCurrency.value);
    }
    if (nativeAmount.present) {
      map['native_amount'] = Variable<double>(nativeAmount.value);
    }
    if (usdAmount.present) {
      map['usd_amount'] = Variable<double>(usdAmount.value);
    }
    if (rawKind.present) {
      map['raw_kind'] = Variable<String>(rawKind.value);
    }
    if (kindId.present) {
      map['kind_id'] = Variable<int>(kindId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionsTableCompanion(')
          ..write('id: $id, ')
          ..write('fileId: $fileId, ')
          ..write('timestamp: $timestamp, ')
          ..write('description: $description, ')
          ..write('sourceCurrency: $sourceCurrency, ')
          ..write('sourceAmount: $sourceAmount, ')
          ..write('toCurrency: $toCurrency, ')
          ..write('toAmount: $toAmount, ')
          ..write('nativeCurrency: $nativeCurrency, ')
          ..write('nativeAmount: $nativeAmount, ')
          ..write('usdAmount: $usdAmount, ')
          ..write('rawKind: $rawKind, ')
          ..write('kindId: $kindId')
          ..write(')'))
        .toString();
  }
}

class $TransactionsTableTable extends TransactionsTable
    with TableInfo<$TransactionsTableTable, TransactionEntity> {
  final GeneratedDatabase _db;
  final String _alias;
  $TransactionsTableTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _fileIdMeta = const VerificationMeta('fileId');
  GeneratedIntColumn _fileId;
  @override
  GeneratedIntColumn get fileId => _fileId ??= _constructFileId();
  GeneratedIntColumn _constructFileId() {
    return GeneratedIntColumn(
      'file_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _timestampMeta = const VerificationMeta('timestamp');
  GeneratedDateTimeColumn _timestamp;
  @override
  GeneratedDateTimeColumn get timestamp => _timestamp ??= _constructTimestamp();
  GeneratedDateTimeColumn _constructTimestamp() {
    return GeneratedDateTimeColumn(
      'timestamp',
      $tableName,
      false,
    );
  }

  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  GeneratedTextColumn _description;
  @override
  GeneratedTextColumn get description =>
      _description ??= _constructDescription();
  GeneratedTextColumn _constructDescription() {
    return GeneratedTextColumn(
      'description',
      $tableName,
      false,
    );
  }

  final VerificationMeta _sourceCurrencyMeta =
      const VerificationMeta('sourceCurrency');
  GeneratedTextColumn _sourceCurrency;
  @override
  GeneratedTextColumn get sourceCurrency =>
      _sourceCurrency ??= _constructSourceCurrency();
  GeneratedTextColumn _constructSourceCurrency() {
    return GeneratedTextColumn(
      'source_currency',
      $tableName,
      false,
    );
  }

  final VerificationMeta _sourceAmountMeta =
      const VerificationMeta('sourceAmount');
  GeneratedRealColumn _sourceAmount;
  @override
  GeneratedRealColumn get sourceAmount =>
      _sourceAmount ??= _constructSourceAmount();
  GeneratedRealColumn _constructSourceAmount() {
    return GeneratedRealColumn(
      'source_amount',
      $tableName,
      false,
    );
  }

  final VerificationMeta _toCurrencyMeta = const VerificationMeta('toCurrency');
  GeneratedTextColumn _toCurrency;
  @override
  GeneratedTextColumn get toCurrency => _toCurrency ??= _constructToCurrency();
  GeneratedTextColumn _constructToCurrency() {
    return GeneratedTextColumn(
      'to_currency',
      $tableName,
      true,
    );
  }

  final VerificationMeta _toAmountMeta = const VerificationMeta('toAmount');
  GeneratedRealColumn _toAmount;
  @override
  GeneratedRealColumn get toAmount => _toAmount ??= _constructToAmount();
  GeneratedRealColumn _constructToAmount() {
    return GeneratedRealColumn(
      'to_amount',
      $tableName,
      true,
    );
  }

  final VerificationMeta _nativeCurrencyMeta =
      const VerificationMeta('nativeCurrency');
  GeneratedTextColumn _nativeCurrency;
  @override
  GeneratedTextColumn get nativeCurrency =>
      _nativeCurrency ??= _constructNativeCurrency();
  GeneratedTextColumn _constructNativeCurrency() {
    return GeneratedTextColumn(
      'native_currency',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nativeAmountMeta =
      const VerificationMeta('nativeAmount');
  GeneratedRealColumn _nativeAmount;
  @override
  GeneratedRealColumn get nativeAmount =>
      _nativeAmount ??= _constructNativeAmount();
  GeneratedRealColumn _constructNativeAmount() {
    return GeneratedRealColumn(
      'native_amount',
      $tableName,
      false,
    );
  }

  final VerificationMeta _usdAmountMeta = const VerificationMeta('usdAmount');
  GeneratedRealColumn _usdAmount;
  @override
  GeneratedRealColumn get usdAmount => _usdAmount ??= _constructUsdAmount();
  GeneratedRealColumn _constructUsdAmount() {
    return GeneratedRealColumn(
      'usd_amount',
      $tableName,
      false,
    );
  }

  final VerificationMeta _rawKindMeta = const VerificationMeta('rawKind');
  GeneratedTextColumn _rawKind;
  @override
  GeneratedTextColumn get rawKind => _rawKind ??= _constructRawKind();
  GeneratedTextColumn _constructRawKind() {
    return GeneratedTextColumn(
      'raw_kind',
      $tableName,
      true,
    );
  }

  final VerificationMeta _kindIdMeta = const VerificationMeta('kindId');
  GeneratedIntColumn _kindId;
  @override
  GeneratedIntColumn get kindId => _kindId ??= _constructKindId();
  GeneratedIntColumn _constructKindId() {
    return GeneratedIntColumn(
      'kind_id',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        fileId,
        timestamp,
        description,
        sourceCurrency,
        sourceAmount,
        toCurrency,
        toAmount,
        nativeCurrency,
        nativeAmount,
        usdAmount,
        rawKind,
        kindId
      ];
  @override
  $TransactionsTableTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'transactions_table';
  @override
  final String actualTableName = 'transactions_table';
  @override
  VerificationContext validateIntegrity(Insertable<TransactionEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('file_id')) {
      context.handle(_fileIdMeta,
          fileId.isAcceptableOrUnknown(data['file_id'], _fileIdMeta));
    } else if (isInserting) {
      context.missing(_fileIdMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp'], _timestampMeta));
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description'], _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('source_currency')) {
      context.handle(
          _sourceCurrencyMeta,
          sourceCurrency.isAcceptableOrUnknown(
              data['source_currency'], _sourceCurrencyMeta));
    } else if (isInserting) {
      context.missing(_sourceCurrencyMeta);
    }
    if (data.containsKey('source_amount')) {
      context.handle(
          _sourceAmountMeta,
          sourceAmount.isAcceptableOrUnknown(
              data['source_amount'], _sourceAmountMeta));
    } else if (isInserting) {
      context.missing(_sourceAmountMeta);
    }
    if (data.containsKey('to_currency')) {
      context.handle(
          _toCurrencyMeta,
          toCurrency.isAcceptableOrUnknown(
              data['to_currency'], _toCurrencyMeta));
    }
    if (data.containsKey('to_amount')) {
      context.handle(_toAmountMeta,
          toAmount.isAcceptableOrUnknown(data['to_amount'], _toAmountMeta));
    }
    if (data.containsKey('native_currency')) {
      context.handle(
          _nativeCurrencyMeta,
          nativeCurrency.isAcceptableOrUnknown(
              data['native_currency'], _nativeCurrencyMeta));
    } else if (isInserting) {
      context.missing(_nativeCurrencyMeta);
    }
    if (data.containsKey('native_amount')) {
      context.handle(
          _nativeAmountMeta,
          nativeAmount.isAcceptableOrUnknown(
              data['native_amount'], _nativeAmountMeta));
    } else if (isInserting) {
      context.missing(_nativeAmountMeta);
    }
    if (data.containsKey('usd_amount')) {
      context.handle(_usdAmountMeta,
          usdAmount.isAcceptableOrUnknown(data['usd_amount'], _usdAmountMeta));
    } else if (isInserting) {
      context.missing(_usdAmountMeta);
    }
    if (data.containsKey('raw_kind')) {
      context.handle(_rawKindMeta,
          rawKind.isAcceptableOrUnknown(data['raw_kind'], _rawKindMeta));
    }
    if (data.containsKey('kind_id')) {
      context.handle(_kindIdMeta,
          kindId.isAcceptableOrUnknown(data['kind_id'], _kindIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TransactionEntity map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return TransactionEntity.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $TransactionsTableTable createAlias(String alias) {
    return $TransactionsTableTable(_db, alias);
  }
}

class StatisticEntity extends DataClass implements Insertable<StatisticEntity> {
  final int id;
  final String name;
  final int priority;
  final DateTime createdTimestamp;
  StatisticEntity(
      {@required this.id,
      @required this.name,
      @required this.priority,
      @required this.createdTimestamp});
  factory StatisticEntity.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return StatisticEntity(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      priority:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}priority']),
      createdTimestamp: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_timestamp']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || priority != null) {
      map['priority'] = Variable<int>(priority);
    }
    if (!nullToAbsent || createdTimestamp != null) {
      map['created_timestamp'] = Variable<DateTime>(createdTimestamp);
    }
    return map;
  }

  StatisticTableCompanion toCompanion(bool nullToAbsent) {
    return StatisticTableCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      priority: priority == null && nullToAbsent
          ? const Value.absent()
          : Value(priority),
      createdTimestamp: createdTimestamp == null && nullToAbsent
          ? const Value.absent()
          : Value(createdTimestamp),
    );
  }

  factory StatisticEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return StatisticEntity(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      priority: serializer.fromJson<int>(json['priority']),
      createdTimestamp: serializer.fromJson<DateTime>(json['createdTimestamp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'priority': serializer.toJson<int>(priority),
      'createdTimestamp': serializer.toJson<DateTime>(createdTimestamp),
    };
  }

  StatisticEntity copyWith(
          {int id, String name, int priority, DateTime createdTimestamp}) =>
      StatisticEntity(
        id: id ?? this.id,
        name: name ?? this.name,
        priority: priority ?? this.priority,
        createdTimestamp: createdTimestamp ?? this.createdTimestamp,
      );
  @override
  String toString() {
    return (StringBuffer('StatisticEntity(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('priority: $priority, ')
          ..write('createdTimestamp: $createdTimestamp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          name.hashCode, $mrjc(priority.hashCode, createdTimestamp.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is StatisticEntity &&
          other.id == this.id &&
          other.name == this.name &&
          other.priority == this.priority &&
          other.createdTimestamp == this.createdTimestamp);
}

class StatisticTableCompanion extends UpdateCompanion<StatisticEntity> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> priority;
  final Value<DateTime> createdTimestamp;
  const StatisticTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.priority = const Value.absent(),
    this.createdTimestamp = const Value.absent(),
  });
  StatisticTableCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    @required int priority,
    @required DateTime createdTimestamp,
  })  : name = Value(name),
        priority = Value(priority),
        createdTimestamp = Value(createdTimestamp);
  static Insertable<StatisticEntity> custom({
    Expression<int> id,
    Expression<String> name,
    Expression<int> priority,
    Expression<DateTime> createdTimestamp,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (priority != null) 'priority': priority,
      if (createdTimestamp != null) 'created_timestamp': createdTimestamp,
    });
  }

  StatisticTableCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<int> priority,
      Value<DateTime> createdTimestamp}) {
    return StatisticTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      priority: priority ?? this.priority,
      createdTimestamp: createdTimestamp ?? this.createdTimestamp,
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
    if (priority.present) {
      map['priority'] = Variable<int>(priority.value);
    }
    if (createdTimestamp.present) {
      map['created_timestamp'] = Variable<DateTime>(createdTimestamp.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StatisticTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('priority: $priority, ')
          ..write('createdTimestamp: $createdTimestamp')
          ..write(')'))
        .toString();
  }
}

class $StatisticTableTable extends StatisticTable
    with TableInfo<$StatisticTableTable, StatisticEntity> {
  final GeneratedDatabase _db;
  final String _alias;
  $StatisticTableTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false,
        $customConstraints: 'UNIQUE');
  }

  final VerificationMeta _priorityMeta = const VerificationMeta('priority');
  GeneratedIntColumn _priority;
  @override
  GeneratedIntColumn get priority => _priority ??= _constructPriority();
  GeneratedIntColumn _constructPriority() {
    return GeneratedIntColumn(
      'priority',
      $tableName,
      false,
    );
  }

  final VerificationMeta _createdTimestampMeta =
      const VerificationMeta('createdTimestamp');
  GeneratedDateTimeColumn _createdTimestamp;
  @override
  GeneratedDateTimeColumn get createdTimestamp =>
      _createdTimestamp ??= _constructCreatedTimestamp();
  GeneratedDateTimeColumn _constructCreatedTimestamp() {
    return GeneratedDateTimeColumn(
      'created_timestamp',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, name, priority, createdTimestamp];
  @override
  $StatisticTableTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'statistic_table';
  @override
  final String actualTableName = 'statistic_table';
  @override
  VerificationContext validateIntegrity(Insertable<StatisticEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('priority')) {
      context.handle(_priorityMeta,
          priority.isAcceptableOrUnknown(data['priority'], _priorityMeta));
    } else if (isInserting) {
      context.missing(_priorityMeta);
    }
    if (data.containsKey('created_timestamp')) {
      context.handle(
          _createdTimestampMeta,
          createdTimestamp.isAcceptableOrUnknown(
              data['created_timestamp'], _createdTimestampMeta));
    } else if (isInserting) {
      context.missing(_createdTimestampMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StatisticEntity map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return StatisticEntity.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $StatisticTableTable createAlias(String alias) {
    return $StatisticTableTable(_db, alias);
  }
}

class StatisticKindEntity extends DataClass
    implements Insertable<StatisticKindEntity> {
  final int statisticId;
  final int kindId;
  StatisticKindEntity({@required this.statisticId, @required this.kindId});
  factory StatisticKindEntity.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    return StatisticKindEntity(
      statisticId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}statistic_id']),
      kindId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}kind_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || statisticId != null) {
      map['statistic_id'] = Variable<int>(statisticId);
    }
    if (!nullToAbsent || kindId != null) {
      map['kind_id'] = Variable<int>(kindId);
    }
    return map;
  }

  StatisticKindsTableCompanion toCompanion(bool nullToAbsent) {
    return StatisticKindsTableCompanion(
      statisticId: statisticId == null && nullToAbsent
          ? const Value.absent()
          : Value(statisticId),
      kindId:
          kindId == null && nullToAbsent ? const Value.absent() : Value(kindId),
    );
  }

  factory StatisticKindEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return StatisticKindEntity(
      statisticId: serializer.fromJson<int>(json['statisticId']),
      kindId: serializer.fromJson<int>(json['kindId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'statisticId': serializer.toJson<int>(statisticId),
      'kindId': serializer.toJson<int>(kindId),
    };
  }

  StatisticKindEntity copyWith({int statisticId, int kindId}) =>
      StatisticKindEntity(
        statisticId: statisticId ?? this.statisticId,
        kindId: kindId ?? this.kindId,
      );
  @override
  String toString() {
    return (StringBuffer('StatisticKindEntity(')
          ..write('statisticId: $statisticId, ')
          ..write('kindId: $kindId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(statisticId.hashCode, kindId.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is StatisticKindEntity &&
          other.statisticId == this.statisticId &&
          other.kindId == this.kindId);
}

class StatisticKindsTableCompanion
    extends UpdateCompanion<StatisticKindEntity> {
  final Value<int> statisticId;
  final Value<int> kindId;
  const StatisticKindsTableCompanion({
    this.statisticId = const Value.absent(),
    this.kindId = const Value.absent(),
  });
  StatisticKindsTableCompanion.insert({
    @required int statisticId,
    @required int kindId,
  })  : statisticId = Value(statisticId),
        kindId = Value(kindId);
  static Insertable<StatisticKindEntity> custom({
    Expression<int> statisticId,
    Expression<int> kindId,
  }) {
    return RawValuesInsertable({
      if (statisticId != null) 'statistic_id': statisticId,
      if (kindId != null) 'kind_id': kindId,
    });
  }

  StatisticKindsTableCompanion copyWith(
      {Value<int> statisticId, Value<int> kindId}) {
    return StatisticKindsTableCompanion(
      statisticId: statisticId ?? this.statisticId,
      kindId: kindId ?? this.kindId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (statisticId.present) {
      map['statistic_id'] = Variable<int>(statisticId.value);
    }
    if (kindId.present) {
      map['kind_id'] = Variable<int>(kindId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StatisticKindsTableCompanion(')
          ..write('statisticId: $statisticId, ')
          ..write('kindId: $kindId')
          ..write(')'))
        .toString();
  }
}

class $StatisticKindsTableTable extends StatisticKindsTable
    with TableInfo<$StatisticKindsTableTable, StatisticKindEntity> {
  final GeneratedDatabase _db;
  final String _alias;
  $StatisticKindsTableTable(this._db, [this._alias]);
  final VerificationMeta _statisticIdMeta =
      const VerificationMeta('statisticId');
  GeneratedIntColumn _statisticId;
  @override
  GeneratedIntColumn get statisticId =>
      _statisticId ??= _constructStatisticId();
  GeneratedIntColumn _constructStatisticId() {
    return GeneratedIntColumn(
      'statistic_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _kindIdMeta = const VerificationMeta('kindId');
  GeneratedIntColumn _kindId;
  @override
  GeneratedIntColumn get kindId => _kindId ??= _constructKindId();
  GeneratedIntColumn _constructKindId() {
    return GeneratedIntColumn(
      'kind_id',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [statisticId, kindId];
  @override
  $StatisticKindsTableTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'statistic_kinds_table';
  @override
  final String actualTableName = 'statistic_kinds_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<StatisticKindEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('statistic_id')) {
      context.handle(
          _statisticIdMeta,
          statisticId.isAcceptableOrUnknown(
              data['statistic_id'], _statisticIdMeta));
    } else if (isInserting) {
      context.missing(_statisticIdMeta);
    }
    if (data.containsKey('kind_id')) {
      context.handle(_kindIdMeta,
          kindId.isAcceptableOrUnknown(data['kind_id'], _kindIdMeta));
    } else if (isInserting) {
      context.missing(_kindIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  StatisticKindEntity map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return StatisticKindEntity.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $StatisticKindsTableTable createAlias(String alias) {
    return $StatisticKindsTableTable(_db, alias);
  }
}

class StatisticFileEntity extends DataClass
    implements Insertable<StatisticFileEntity> {
  final int statisticId;
  final int fileId;
  StatisticFileEntity({@required this.statisticId, @required this.fileId});
  factory StatisticFileEntity.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    return StatisticFileEntity(
      statisticId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}statistic_id']),
      fileId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}file_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || statisticId != null) {
      map['statistic_id'] = Variable<int>(statisticId);
    }
    if (!nullToAbsent || fileId != null) {
      map['file_id'] = Variable<int>(fileId);
    }
    return map;
  }

  StatisticFilesTableCompanion toCompanion(bool nullToAbsent) {
    return StatisticFilesTableCompanion(
      statisticId: statisticId == null && nullToAbsent
          ? const Value.absent()
          : Value(statisticId),
      fileId:
          fileId == null && nullToAbsent ? const Value.absent() : Value(fileId),
    );
  }

  factory StatisticFileEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return StatisticFileEntity(
      statisticId: serializer.fromJson<int>(json['statisticId']),
      fileId: serializer.fromJson<int>(json['fileId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'statisticId': serializer.toJson<int>(statisticId),
      'fileId': serializer.toJson<int>(fileId),
    };
  }

  StatisticFileEntity copyWith({int statisticId, int fileId}) =>
      StatisticFileEntity(
        statisticId: statisticId ?? this.statisticId,
        fileId: fileId ?? this.fileId,
      );
  @override
  String toString() {
    return (StringBuffer('StatisticFileEntity(')
          ..write('statisticId: $statisticId, ')
          ..write('fileId: $fileId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(statisticId.hashCode, fileId.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is StatisticFileEntity &&
          other.statisticId == this.statisticId &&
          other.fileId == this.fileId);
}

class StatisticFilesTableCompanion
    extends UpdateCompanion<StatisticFileEntity> {
  final Value<int> statisticId;
  final Value<int> fileId;
  const StatisticFilesTableCompanion({
    this.statisticId = const Value.absent(),
    this.fileId = const Value.absent(),
  });
  StatisticFilesTableCompanion.insert({
    @required int statisticId,
    @required int fileId,
  })  : statisticId = Value(statisticId),
        fileId = Value(fileId);
  static Insertable<StatisticFileEntity> custom({
    Expression<int> statisticId,
    Expression<int> fileId,
  }) {
    return RawValuesInsertable({
      if (statisticId != null) 'statistic_id': statisticId,
      if (fileId != null) 'file_id': fileId,
    });
  }

  StatisticFilesTableCompanion copyWith(
      {Value<int> statisticId, Value<int> fileId}) {
    return StatisticFilesTableCompanion(
      statisticId: statisticId ?? this.statisticId,
      fileId: fileId ?? this.fileId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (statisticId.present) {
      map['statistic_id'] = Variable<int>(statisticId.value);
    }
    if (fileId.present) {
      map['file_id'] = Variable<int>(fileId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StatisticFilesTableCompanion(')
          ..write('statisticId: $statisticId, ')
          ..write('fileId: $fileId')
          ..write(')'))
        .toString();
  }
}

class $StatisticFilesTableTable extends StatisticFilesTable
    with TableInfo<$StatisticFilesTableTable, StatisticFileEntity> {
  final GeneratedDatabase _db;
  final String _alias;
  $StatisticFilesTableTable(this._db, [this._alias]);
  final VerificationMeta _statisticIdMeta =
      const VerificationMeta('statisticId');
  GeneratedIntColumn _statisticId;
  @override
  GeneratedIntColumn get statisticId =>
      _statisticId ??= _constructStatisticId();
  GeneratedIntColumn _constructStatisticId() {
    return GeneratedIntColumn(
      'statistic_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _fileIdMeta = const VerificationMeta('fileId');
  GeneratedIntColumn _fileId;
  @override
  GeneratedIntColumn get fileId => _fileId ??= _constructFileId();
  GeneratedIntColumn _constructFileId() {
    return GeneratedIntColumn(
      'file_id',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [statisticId, fileId];
  @override
  $StatisticFilesTableTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'statistic_files_table';
  @override
  final String actualTableName = 'statistic_files_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<StatisticFileEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('statistic_id')) {
      context.handle(
          _statisticIdMeta,
          statisticId.isAcceptableOrUnknown(
              data['statistic_id'], _statisticIdMeta));
    } else if (isInserting) {
      context.missing(_statisticIdMeta);
    }
    if (data.containsKey('file_id')) {
      context.handle(_fileIdMeta,
          fileId.isAcceptableOrUnknown(data['file_id'], _fileIdMeta));
    } else if (isInserting) {
      context.missing(_fileIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  StatisticFileEntity map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return StatisticFileEntity.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $StatisticFilesTableTable createAlias(String alias) {
    return $StatisticFilesTableTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $ImportedFilesTableTable _importedFilesTable;
  $ImportedFilesTableTable get importedFilesTable =>
      _importedFilesTable ??= $ImportedFilesTableTable(this);
  $TransactionKindsTableTable _transactionKindsTable;
  $TransactionKindsTableTable get transactionKindsTable =>
      _transactionKindsTable ??= $TransactionKindsTableTable(this);
  $TransactionsTableTable _transactionsTable;
  $TransactionsTableTable get transactionsTable =>
      _transactionsTable ??= $TransactionsTableTable(this);
  $StatisticTableTable _statisticTable;
  $StatisticTableTable get statisticTable =>
      _statisticTable ??= $StatisticTableTable(this);
  $StatisticKindsTableTable _statisticKindsTable;
  $StatisticKindsTableTable get statisticKindsTable =>
      _statisticKindsTable ??= $StatisticKindsTableTable(this);
  $StatisticFilesTableTable _statisticFilesTable;
  $StatisticFilesTableTable get statisticFilesTable =>
      _statisticFilesTable ??= $StatisticFilesTableTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        importedFilesTable,
        transactionKindsTable,
        transactionsTable,
        statisticTable,
        statisticKindsTable,
        statisticFilesTable
      ];
}
