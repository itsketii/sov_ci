import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/orientation_models.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();
  static Database? _database;

  factory DatabaseService() => _instance;

  DatabaseService._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'sov_ci_final.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('CREATE TABLE results (id INTEGER PRIMARY KEY AUTOINCREMENT, level TEXT, date TEXT, scores TEXT)');
        await db.execute('CREATE TABLE favorites (id TEXT PRIMARY KEY, name TEXT, type TEXT, location TEXT, fees TEXT, field TEXT, totalFields INTEGER, reputation INTEGER, insertionRate TEXT, status TEXT)');
        await db.execute('CREATE TABLE establishments (id TEXT PRIMARY KEY, name TEXT, type TEXT, location TEXT, fees TEXT, field TEXT, totalFields INTEGER, reputation INTEGER, insertionRate TEXT)');
      },
    );
  }

  Future<void> saveResult(StudentLevel level, Map<String, double> scores) async {
    final db = await database;
    await db.insert('results', {
      'level': level == StudentLevel.bepc ? 'BEPC' : 'BAC',
      'date': DateTime.now().toIso8601String(),
      'scores': scores.toString(),
    });
  }

  Future<void> addFavorite(Establishment est) async {
    final db = await database;
    await db.insert(
      'favorites',
      {
        'id': est.id,
        'name': est.name,
        'type': est.type,
        'location': est.location,
        'fees': est.fees,
        'field': est.field,
        'totalFields': est.totalFields,
        'reputation': est.reputation,
        'insertionRate': est.insertionRate,
        'status': est.status.name,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Establishment>> getFavorites() async {
    try {
      final db = await database;
      final List<Map<String, dynamic>> maps = await db.query('favorites');
      return List.generate(maps.length, (i) {
        return Establishment(
          id: maps[i]['id'],
          name: maps[i]['name'],
          type: maps[i]['type'],
          location: maps[i]['location'],
          fees: maps[i]['fees'],
          field: maps[i]['field'],
          totalFields: maps[i]['totalFields'],
          reputation: maps[i]['reputation'],
          insertionRate: maps[i]['insertionRate'],
          status: ApplicationStatus.values.firstWhere(
            (e) => e.name == maps[i]['status'],
            orElse: () => ApplicationStatus.enPrepa,
          ),
        );
      });
    } catch (e) {
      return [];
    }
  }

  Future<void> updateFavoriteStatus(String id, ApplicationStatus status) async {
    final db = await database;
    await db.update('favorites', {'status': status.name}, where: 'id = ?', whereArgs: [id]);
  }
}
