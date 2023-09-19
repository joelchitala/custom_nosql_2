import 'package:custom_nosql_2/plugins/nosql_plugin/components/components/collection.dart';
import 'package:custom_nosql_2/plugins/nosql_plugin/components/components/database.dart';
import 'package:custom_nosql_2/plugins/nosql_plugin/components/components/document.dart';

class NoSqlManager{
  final List<Database> _databases = [];

  NoSqlManager._();
  static final _instance = NoSqlManager._();

  factory NoSqlManager(){
    return _instance;
  }

  void createDatabase(String name){
    name = name.toLowerCase();

    Database? db = getDatabaseByName(name);
    if(db == null){
      _databases.add(Database(name: name));
    }
  }

  void removeDatabaseByName(String name){
    name = name.toLowerCase();

    Database? db = getDatabaseByName(name);

    if(db != null){
      _databases.remove(db);
    }
  }

  void removeDatabaseById(String id){
    Database? db = getDatabaseById(id);
    if(db != null){
      _databases.remove(db);
    }
  }

  Database? getDatabaseByName(String name){
    name = name.toLowerCase();

    for(var i=0; i<_databases.length; i++){
      Database db = _databases[i];
      if(db.name == name){
        return db;
      }
    }

    return null;
  }

  Database? getDatabaseById(String id){
    for(var i=0; i<_databases.length; i++){
      Database db = _databases[i];
      if(db.object_id == id){
        return db;
      }
    }

    return null;
  }
}