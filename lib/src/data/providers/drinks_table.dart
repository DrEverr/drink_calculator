part of 'database.dart';

@DataClassName('DrinkRow')
class Drinks extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 50)();
  RealColumn get alcoholContent => real()();
  RealColumn get volume => real()();
  TextColumn get volumeUnit => text().withLength(min: 1, max: 10)();
  RealColumn get price => real()();
  TextColumn get priceUnit => text().withLength(min: 1, max: 10)();
}

@DriftAccessor(tables: [Drinks])
class DrinksDao extends DatabaseAccessor<AppDatabase> with _$DrinksDaoMixin {
  DrinksDao(super.db);

  Future<List<DrinkRow>> getAllDrinks() => select(drinks).get();
  Stream<List<DrinkRow>> watchAllDrinks() => select(drinks).watch();
  Future<int> insertDrink(Insertable<DrinkRow> drink) => into(drinks).insert(drink);
  Future updateDrink(Insertable<DrinkRow> drink) => update(drinks).replace(drink);
  Future deleteDrink(Insertable<DrinkRow> drink) => delete(drinks).delete(drink);
  Future deleteAllDrinks() => delete(drinks).go();
}