import 'package:isar/isar.dart';

part 'author.g.dart';

@Collection()
class Author {
  Id id;
  final String name;

  Author({this.id = Isar.autoIncrement, required this.name});
}
