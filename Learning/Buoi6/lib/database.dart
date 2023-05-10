import 'package:sqflite/sqflite.dart';

Future<void> callDatabase() async {
  final databasePath = await getDatabasesPath();
  final database = await openDatabase(databasePath, version: 1,
    onCreate: (Database database, int version) async {
      await database.execute(
        ""
      );
    }
  );
  try {} catch (error) {
  } finally {
    await database.close();
  }
}
