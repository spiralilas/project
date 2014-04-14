part of todo_mvc_app;

class Todos {
  Element _todoList = querySelector('#todo-list');

  add(Task task) {
    var element = new Element.html('''
      <li>      
        <label id='title'>${task.title}</label>
      </li>
    ''');
    _todoList.nodes.add(element);
  }
}

part of gardens_app;

class GardensView {
  Element _todoList = querySelector('#todo-list');

  add(Task task) {
    var element = new Element.html('''
      <li>      
        <label id='title'>${task.title}</label>
      </li>
    ''');
    _todoList.nodes.add(element);
  }
}

