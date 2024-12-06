import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const TodoListScreen(),
    );
  }
}

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {

  final List<String> _tasks = [];
  final TextEditingController _controller = TextEditingController();

  void _addTask(){
    if(_controller.text.isNotEmpty){
      setState(() {
        _tasks.add(_controller.text);
        _controller.clear();
      });
    }
  }

  void _removerTask(int index){
    setState(() {
      _tasks.remove(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('TO do List'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: TextField(
                    controller: _controller,
                  ),
              ),
              TextButton(onPressed: _addTask, child: const Text('Add')),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context,index){
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(_tasks[index]),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => _removerTask(index),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
