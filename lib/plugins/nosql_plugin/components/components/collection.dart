import 'database.dart';
import 'document.dart';
import 'utils.dart';

class Collection {
  final String object_id = "C-${generateUUID()}-${generateTimeStamp()}";
  final Database database;
  final String creation_date = generateTimeStamp();
  final Types type = Types.COLLECTION;
  String name;
  List<Document> documents = [];

  Collection({required this.database, required this.name}) {
    database.addCollection(this);
  }

  void addDocument(Document document) {
    try {
      documents.add(document);
    } catch (e) {
      print(e);
    }
  }

  void removeCollection(String documentObjectId) {
    Document document = getDocument(documentObjectId);
    try {
      documents.remove(document);
    } catch (e) {
      print(e);
    }
  }

  Document getDocument(String documentObjectId) {
    return documents.firstWhere((e) => e.object_id == documentObjectId);
  }

  Map<String, dynamic> toJson() {
    return {
      "object-id": object_id,
      "database-id": database.object_id,
      "creation-date": creation_date,
      "type": type,
      "name": name,
      "documents": documents.map((e) => e.getFields())
    };
  }
}
