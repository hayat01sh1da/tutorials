"use strict;"

import { element } from "./html_util.js";
import { TodoItemView } from "./TodoItemView.js";

const TodoListView = class {
  createElement(todoItems, { onUpdateTodo, onDeleteTodo }) {
    const todoListElement = element`<ul />`;
    todoItems.forEach(todoItem => {
      const todoItemView = new TodoItemView();
      const todoItemElement = todoItemView.createElement(todoItem, {
        onUpdateTodo,
        onDeleteTodo
      });
      todoListElement.appendChild(todoItemElement);
    });
    return todoListElement;
  }
};

export {
  TodoListView
};
