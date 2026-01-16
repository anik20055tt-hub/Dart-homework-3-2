import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'todo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'ToDo List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<ToDo> todos = [];

  void _addTodo() {
    final now = DateTime.now();
    final date = DateFormat('dd.MM.yyyy HH:mm').format(now);

    final todo = ToDo(
      id: now.millisecondsSinceEpoch.toString(),
      title: 'Задача ${todos.length + 1}',
      isFinished: false,
      date: date,
    );

    setState(() {
      todos.add(todo);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          final todo = todos[index];

          return ListTile(
            title: Text(todo.title),
            subtitle: Text('Дата: ${todo.date}'),
            trailing: Checkbox(
              value: todo.isFinished,
              onChanged: (value) {
                setState(() {
                  todo.isFinished = value!;
                });

                // 🔥 вывод объекта задачи в консоль
                print(todo);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTodo,
        child: const Icon(Icons.add),
      ),
    );
  }
}
