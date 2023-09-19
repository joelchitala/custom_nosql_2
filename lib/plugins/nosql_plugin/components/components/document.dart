import 'collection.dart';
import 'utils.dart';

class Document {
  final String object_id = "DOC-${generateUUID()}-${generateTimeStamp()}";
  final Collection collection;
  final String creation_date = generateTimeStamp();
  final Types type = Types.DOCUMENT;
  Map<String, dynamic> fields = {};

  Document({required this.collection}) {
    collection.addDocument(this);
  }

  void addField(Map<String, dynamic> field) {
    try {
      fields.addAll(field);
    } catch (e) {
      print(e);
    }
  }

  void removeField(String field) {
    try {
      fields.remove(field);
    } catch (e) {
      print(e);
    }
  }

  Map<String, dynamic> getFields() {
    return fields;
  }

  Map<String, dynamic> toJson() {
    return {
      "object-id": object_id,
      "collection-id": collection.object_id,
      "creation-date": creation_date,
      "fields": fields
    };
  }
}
