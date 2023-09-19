import 'dart:convert';
import 'dart:io';

import 'components/collection.dart';
import 'components/database.dart';
import 'components/document.dart';

Future<Map<String, dynamic>> readJsonFile(path) async {
  var input = await File(path).readAsString();
  var map = jsonDecode(input);

  return map;
}

void main() async {
  var db = Database(name: "myDB");
  var collection = Collection(database: db, name: "users");
  var record = Document(collection: collection);
  record.addField({"name": "Joel", "age": 23});

  print(db.toJson());
}
