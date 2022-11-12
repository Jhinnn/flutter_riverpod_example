import 'package:flutter_riverpod_example/model/todo.dart';
import 'package:riverpod/riverpod.dart';

class TodosNotifier extends StateNotifier<List<Todo>> {
  // We initialize the list of todos to an empty list
  TodosNotifier() : super([]);

  // TodosNotifier(List<Todo>? todos) : super(todos ?? []);

  void setTodo(List<Todo> todoList) {
    state = todoList;
  }

  // Let's allow the UI to add todos.
  void addTodo(Todo todo) {
    // Since our state is immutable, we are not allowed to do `state.add(todo)`.
    // Instead, we should create a new list of todos which contains the previous
    // items and the new one.
    // Using Dart's spread operator here is helpful!
    /*
      //因为我们的状态是不可变的，所以我们不允许执行' state.add(todo) '。
      //相反，我们应该创建一个新的todo列表，其中包含前面的项目和新的。
      //使用Dart的扩散操作符是很有帮助的!
    */
    state = [...state, todo];

    // No need to call "notifyListeners" or anything similar. Calling "state ="
    // will automatically rebuild the UI when necessary.
    //不需要调用"notifyListeners"或任何类似的东西。调用"state =" 将在必要时自动重建UI。
  }

  // Let's allow removing todos
  void removeTodo(String todoId) {
    // Again, our state is immutable. So we're making a new list instead of
    // changing the existing list.
    state = [
      for (final todo in state)
        if (todo.id != todoId) todo,
    ];
  }

  // Let's mark a todo as completed
  void toggle(String todoId) {
    state = [
      for (final todo in state)
        // we're marking only the matching todo as completed
        if (todo.id == todoId)
          // Once more, since our state is immutable, we need to make a copy
          // of the todo. We're using our `copyWith` method implemented before
          // to help with that.
          //再次强调，由于我们的状态是不可变的，我们需要进行一个复制的todo。我们使用之前实现的copyWith方法来帮助你。
          todo.copyWith(completed: !todo.completed)
        else
          // other todos are not modified
          todo,
    ];
  }
}

/*
StateNotifierProvider
  是一个用于监听和公开StateNotifier(来自包state_notifier, Riverpod重新导出)的提供程序。
StateNotifierProvider和StateNotifier是Riverpod推荐的管理状态的解决方案，这些状态可能会根据用户交互的反应而变化。
它通常用于:
暴露不可变状态，在响应自定义事件后可以随时间变化。
将修改某些状态的逻辑(又名“业务逻辑”)集中在一个地方，随着时间的推移提高可维护性。
作为一个使用示例，我们可以使用StateNotifierProvider来实现待办事项列表。这样做将允许我们公开addTodo等方法，让UI在用户交互中修改todo列表:
*/

// The StateNotifier class that will be passed to our StateNotifierProvider.
// This class should not expose state outside of its "state" property, which means
// no public getters/properties!
// The public methods on this class will be what allow the UI to modify the state.

// Finally, we are using StateNotifierProvider to allow the UI to interact with
// our TodosNotifier class.
final todosProvider = StateNotifierProvider<TodosNotifier, List<Todo>>((ref) {
  // return TodosNotifier(null);
  return TodosNotifier();
});

final completedTodosProvider = Provider<List<Todo>>((ref) {
  // We obtain the list of all todos from the todosProvider
  final todos = ref.watch(todosProvider);
  // we return only the completed todos
  return todos.where((todo) => todo.completed).toList();
});
