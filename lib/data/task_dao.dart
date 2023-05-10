import 'package:flutter_alura/components/task.dart';
import 'package:flutter_alura/data/database.dart';
import 'package:sqflite/sqflite.dart';

class TaskDao {
  static const String tableSql = 'CREATE TABLE $_tablename('
      '$_name TEXT, '
      '$_difficulty INTEGER, '
      '$_image TEXT)';

  static const String _tablename = 'taskTable';
  static const String _name = 'name';
  static const String _difficulty = 'difficulty';
  static const String _image = 'image';

  save(Task task) async {
    print('🚀🚀🚀 acessando o método save');

    final Database database = await getDatabase();
    var itemExists = await findByName(task.nome);
    Map<String, dynamic> taskMap = toMap(task);

    if (itemExists.isEmpty) {
      return await database.insert(_tablename, taskMap);
    } else {
      print('🚀🚀🚀 tarefa já existe');
      return await database.update(
        _tablename,
        taskMap,
        where: '$_name = ?',
        whereArgs: [task.nome],
      );
    }
  }

  Map<String, dynamic> toMap(Task task) {
    print('🚀🚀🚀 acessando o método toMap');

    final Map<String, dynamic> taskMap = Map();

    taskMap[_name] = task.nome;
    taskMap[_difficulty] = task.difficulty;
    taskMap[_image] = task.photo;

    return taskMap;
  }

  Future<List<Task>> findAll() async {
    print('🚀🚀🚀 acessando o método findAll');

    final Database database = await getDatabase();
    final List<Map<String, dynamic>> result = await database.query(_tablename);

    return toList(result);
  }

  List<Task> toList(List<Map<String, dynamic>> tasksMap) {
    print('🚀🚀🚀 acessando o método toList');
    final List<Task> tasks = [];

    for (Map<String, dynamic> row in tasksMap) {
      final Task task = Task(row[_name], row[_image], row[_difficulty]);
      tasks.add(task);
    }

    print('🚀🚀🚀 tarefas: $tasks');

    return tasks;
  }

  Future<List<Task>> findByName(String taskName) async {
    print('🚀🚀🚀 acessando o método findByName');

    final Database database = await getDatabase();
    final List<Map<String, dynamic>> result = await database.query(
      _tablename,
      where: '$_name = ?',
      whereArgs: [taskName],
    );

    return toList(result);
  }

  deleteByName(String taskName) async {
    print('🚀🚀🚀 acessando o método deleteByName');

    final Database database = await getDatabase();

    return database.delete(
      _tablename,
      where: '$_name = ?',
      whereArgs: [taskName],
    );
  }
}
