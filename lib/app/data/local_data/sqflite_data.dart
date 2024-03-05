import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _database;

  Future<Database> get database async {
    _database ??= await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'your_database_name.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE boarding_destinations(id INTEGER PRIMARY KEY, boardingName TEXT, destinationName TEXT)"
        );
      },
      version: 1,
    );
  }

  Future<void> insertBoardingDestination(BoardingDestination destination) async {
    final Database db = await database;
    await db.insert(
      'boarding_destinations',
      destination.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}

class BoardingDestination {
  final String boardingName;
  final String destinationName;

  BoardingDestination({required this.boardingName, required this.destinationName});

  Map<String, dynamic> toMap() {
    return {
      'boardingName': boardingName,
      'destinationName': destinationName,
    };
  }
}