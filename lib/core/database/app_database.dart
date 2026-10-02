import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'app_database.g.dart';

class Properties extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1, max: 120)();
  TextColumn get propertyType => text()();
  TextColumn get transactionType => text()();
  TextColumn get status => text().withDefault(const Constant('active'))();
  TextColumn get address => text().withDefault(const Constant(''))();
  TextColumn get detailAddress => text().withDefault(const Constant(''))();
  RealColumn get latitude => real().nullable()();
  RealColumn get longitude => real().nullable()();
  IntColumn get salePrice => integer().nullable()();
  IntColumn get deposit => integer().nullable()();
  IntColumn get monthlyRent => integer().nullable()();
  TextColumn get warning => text().withDefault(const Constant(''))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}

class Contacts extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 80)();
  TextColumn get phone => text().withDefault(const Constant(''))();
  TextColumn get relation => text().withDefault(const Constant(''))();
  TextColumn get memo => text().withDefault(const Constant(''))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}

class PropertyContacts extends Table {
  IntColumn get propertyId => integer().references(Properties, #id, onDelete: KeyAction.cascade)();
  IntColumn get contactId => integer().references(Contacts, #id, onDelete: KeyAction.cascade)();
  TextColumn get role => text().withDefault(const Constant('owner'))();

  @override
  Set<Column<Object>> get primaryKey => {propertyId, contactId, role};
}

class PropertyPhotos extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get propertyId => integer().references(Properties, #id, onDelete: KeyAction.cascade)();
  TextColumn get filePath => text()();
  TextColumn get caption => text().withDefault(const Constant(''))();
  IntColumn get sortOrder => integer().withDefault(const Constant(0))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

class PropertyNotes extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get propertyId => integer().references(Properties, #id, onDelete: KeyAction.cascade)();
  TextColumn get content => text()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

class Reminders extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get propertyId => integer().nullable().references(Properties, #id, onDelete: KeyAction.setNull)();
  IntColumn get contactId => integer().nullable().references(Contacts, #id, onDelete: KeyAction.setNull)();
  TextColumn get title => text()();
  DateTimeColumn get scheduledAt => dateTime()();
  DateTimeColumn get completedAt => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

@DriftDatabase(tables: [
  Properties,
  Contacts,
  PropertyContacts,
  PropertyPhotos,
  PropertyNotes,
  Reminders,
])
final class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor])
      : super(executor ?? driftDatabase(name: 'jip_care'));

  @override
  int get schemaVersion => 1;
}
