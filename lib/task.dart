  import 'package:uuid/uuid.dart';
  class Task {
    Task(
      {
      required this.title,
      String? id,
      }
    ): id = id ?? const Uuid().v4();
    final String title;
    final String id;
  }