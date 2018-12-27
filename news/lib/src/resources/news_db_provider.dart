import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'dart:async';
import '../models/item_model.dart';

class NewsDbProvider {
  Database db;


  init() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentDirectory.path, "items.db");
    db = await openDatabase(
        path,
        version: 1,
        onCreate: (Database newDb, int version) {
          newDb.execute("""
            CREATE TABLE Items
              (
                
              )
            """);
        },
    );
  }

}