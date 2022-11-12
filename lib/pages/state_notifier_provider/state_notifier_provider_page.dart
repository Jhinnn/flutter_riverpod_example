import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_example/model/todo.dart';
import 'package:flutter_riverpod_example/pages/state_notifier_provider/todo_notifier.dart';

import 'package:random_string/random_string.dart';

class StateNotifierProviderPage extends ConsumerWidget {
  const StateNotifierProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Todo> todoList = ref.watch(todosProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('StateNotifierProviderPage')),
      floatingActionButton: const FunWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '待完成列表',
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text(
                  '完成列表',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        for (final todo in todoList)
                          CheckboxListTile(
                            value: todo.completed,
                            onChanged: ((value) => ref
                                .read(todosProvider.notifier)
                                .toggle(todo.id)),
                            title: Text(todo.title),
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(todo.description, maxLines: 1),
                                Text(todo.dateTime.toString().substring(0, 11))
                              ],
                            ),
                          )
                      ],
                    )),
                Expanded(
                  flex: 1,
                  child: Consumer(builder: (context, ref, child) {
                    final completedTodos = ref.watch(completedTodosProvider);
                    return Column(
                      children: [
                        for (final todo in completedTodos)
                          CheckboxListTile(
                            value: todo.completed,
                            onChanged: ((value) => ref
                                .read(todosProvider.notifier)
                                .toggle(todo.id)),
                            title: Text(todo.title),
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(todo.description, maxLines: 1),
                                Text(todo.dateTime.toString().substring(0, 11))
                              ],
                            ),
                          )
                      ],
                    );
                  }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FunWidget extends ConsumerWidget {
  const FunWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () {
        ref.read(todosProvider.notifier).addTodo(
              Todo(
                  id: randomBetween(100, 10000).toString(),
                  title: randomAlphaNumeric(10),
                  description: randomAlphaNumeric(20),
                  completed: randomBetween(0, 100) > 50,
                  dateTime: DateTime.now()),
            );
      },
      child: const Text(
        '增加',
      ),
    );
  }
}
