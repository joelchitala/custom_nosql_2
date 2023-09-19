import 'collection.dart';
import 'utils.dart';

class Database {
  final String object_id = "D-${generateUUID()}-${generateTimeStamp()}";
  final String creation_date = generateTimeStamp();
  final Types type = Types.DATABASE;
  final String name;
  final List<Collection> collections = [];

  Database({required this.name});

  void createCollection(String name){
    name = name.toLowerCase();

    Collection? collection = getCollectionByName(name);

    if(collection == null){
      Collection(database: this, name: name);
    }
  }
  void addCollection(Collection collection) {
    try {
      collections.add(collection);
    } catch (e) {
      print(e);
    }
  }

  void removeCollectionById(String collectionObjectId) {
    Collection? collection = getCollectionById(collectionObjectId);
    try {
      collections.remove(collection);
    } catch (e) {
      print(e);
    }
  }

  void removeCollectionByName(String name) {
    name = name.toLowerCase();
    Collection? collection = getCollectionByName(name);
    try {
      collections.remove(collection);
    } catch (e) {
      print(e);
    }
  }

  Collection? getCollectionById(String id) {
    for(var i=0; i<collections.length; i++){
      Collection collection = collections[i];
      if(collection.object_id == id){
        return collection;
      }
    }

    return null;
  }

  Collection? getCollectionByName(String name) {
    name = name.toLowerCase();
    for(var i=0; i<collections.length; i++){
      Collection collection = collections[i];
      if(collection.name == name){
        return collection;
      }
    }

    return null;
  }

  Map<String, dynamic> toJson() {
    return {
      "object-id": object_id,
      "creation-date": creation_date,
      "type": type,
      "name": name,
      "collections": collections.map((e) => e.toJson())
    };
  }
}
