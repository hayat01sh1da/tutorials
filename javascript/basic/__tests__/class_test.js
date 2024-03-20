"use strict;"

import {
  User,
  Admin
} from "../src/class";

test("User", () => {
  const user_1 = new User("Noel Gallagher", 53);
  const user_2 = new User("Liam Gallagher", 48);
  expect(user_1 instanceof User).toBe(true);
  expect(user_1.name).toBe("Noel Gallagher");
  expect(user_1.age).toBe(53);
  expect(user_1.greet()).toBe("Hello. I'm Noel Gallagher and 53 years old. Nice to see you!");
  expect(user_2 instanceof User).toBe(true);
  expect(user_2.name).toBe("Liam Gallagher");
  expect(user_2.age).toBe(48);
  expect(user_2.greet()).toBe("Hello. I'm Liam Gallagher and 48 years old. Nice to see you!");
  expect(user_1.greet === user_2.greet).toBe(true);
  // Getter
  const user_3 = new User("UserA", 30);
  expect(user_3.name).toBe("UserA");
  expect(user_3.age).toBe(30);
  // Setter
  user_3.name = "UserB";
  user_3.age  = 40;
  expect(user_3.name).toBe("UserB");
  expect(user_3.age).toBe(40);
  // Class method
  expect(User.classMethod()).toBe("This is a class method!!");
  // Instance object method/Prototype method
  const user_4 = new User("Conflict methods", 0);
  expect(user_4.method()).toBe("This is an instance object method!!");
  delete user_4.method;
  expect(user_4.method()).toBe("This is a prototype method!!");
  expect(typeof User.prototype.method).toBe("function");
  expect(User.prototype.constructor).toBe(User);
  // Prototype chain
  const user_5 = new User("Prototype chain", 0);
  const UserPrototype = Object.getPrototypeOf(user_5);
  expect(UserPrototype === User.prototype).toBe(true);
  delete user_5.method
  expect(user_5.method === UserPrototype.method).toBe(true);
  // Inheritance
  const user_6 = new User("User", 0);
  expect(user_6 instanceof User).toBe(true);
  expect(user_6 instanceof Admin).toBe(false);
});

test("Admin", () => {
  const admin = new Admin("Admin",  0);
  expect(admin.name).toBe("Admin");
  expect(admin.age).toBe(0);
  expect(admin.type).toBe("Administrator");
  expect(Admin.classMethod()).toBe("This is a class method!!");
  expect(admin instanceof User).toBe(true);
  expect(admin instanceof Admin).toBe(true);
});
