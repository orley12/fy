import 'package:hive_flutter/hive_flutter.dart';

class HiveRepository<T> {
  late Box<T> box;

  HiveRepository(boxName) {
    box = Hive.box<T>(boxName);
  }

  put(String key, T value) {
    box.put(key, value);
  }

  T? get(String key) {
    return box.get(key);
  }

  Iterable<T> getAll() {
    return box.values;
  }
}
