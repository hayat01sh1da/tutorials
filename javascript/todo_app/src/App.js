"use strict;"

import { TodoItemModel } from "./model/TodoItemModel.js";
import { TodoListModel } from "./model/TodoListModel.js";
import { TodoListView } from "./view/TodoListView.js";
import { element, render } from "./view/html_util.js";

const App = class {
  constructor({ formElement, formInputElement, todoListContainerElement, todoCountElement }) {
    this.todoListView = new TodoListView();
    this.todoListModel = new TodoListModel([]);
    this.formElement = formElement;
    this.formInputElement = formInputElement;
    this.todoListContainerElement = todoListContainerElement;
    this.todoCountElement = todoCountElement;
    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleChange = this.handleChange.bind(this);
  }

  handleAdd(title) {
    this.todoListModel.addTodo(new TodoItemModel({ title, completed: false }));
  }

  handleUpdate({ id, completed }) {
    this.todoListModel.updateTodo({ id, completed });
  }

  handleDelete({ id }) {
    this.todoListModel.deleteTodo({ id });
  }

  handleChange() {
    const todoCountElement = this.todoCountElement;
    const todoListContainerElement = this.todoListContainerElement;
    const todoItems = this.todoListModel.getTodoItems();
    const todoListElement = this.todoListView.createElement(todoItems, {
      onUpdateTodo: ({ id, completed }) => {
        this.handleUpdate({ id, completed });
      },
      onDeleteTodo: ({ id }) => {
        this.handleDelete({ id });
      }
    });
    render(todoListElement, todoListContainerElement);
    todoCountElement.textContent = `Number of Todos: ${this.todoListModel.getTotalCount()}`;
  }
  
  handleSubmit(event) {
    event.preventDefault();
    const inputElement = this.formInputElement;
    this.handleAdd(inputElement.value);
    inputElement.value = "";
  }
  
  mount() {
    this.todoListModel.onChange(this.handleChange);
    this.formElement.addEventListener("submit", this.handleSubmit);
  }
  
  unmount() {
    this.todoListModel.offChange(this.handleChange);
    this.formElement.addEventListener("submit", this.handleSubmit);
  }
};

export {
  App
};
