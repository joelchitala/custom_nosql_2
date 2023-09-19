import 'dart:math';

enum Types { DATABASE, COLLECTION, DOCUMENT }

const UUID_MAX = 1000;

int generateUUID() {
  return Random().nextInt(UUID_MAX);
}

String generateTimeStamp() {
  var now = DateTime.now();
  String formattedTime = "${now.day}-${now.month}-${now.year}";
  return formattedTime;
}
