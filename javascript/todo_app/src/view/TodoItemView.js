"use strict;"
import {
  element
} from "./html_util.js";

const TodoItemView = class {
  createElement(todoItem, { onUpdateTodo, onDeleteTodo }) {
    const todoItemElement = todoItem.completed ?
    element`<li><input type="checkbox" class="checkbox" checked><s>${todoItem.title}</s><button class="delete">x</button></li>` :
    element`<li><input type="checkbox" class="checkbox">${todoItem.title}<button class="delete">x</button></li>`;
    const inputCheckboxElement = todoItemElement.querySelector(".checkbox");
    inputCheckboxElement.addEventListener("change", () => {
      onUpdateTodo({ id: todoItem.id, completed: !todoItem.completed });
    });
    const deleteButtonElement = todoItemElement.querySelector(".delete");
    deleteButtonElement.addEventListener("click", () => {
      onDeleteTodo({ id: todoItem.id });
    });
    return todoItemElement;
  }
};

export {
  TodoItemView
};
