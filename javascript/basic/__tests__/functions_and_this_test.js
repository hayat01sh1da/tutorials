"use strict;"

import {
  getGreetingMessage,
  greet,
  userTitle1,
  userTitle2
} from "../src/functions_and_this";

test("getGreetingMessage", () => {
  const userName = "Noel Gallagher";
  const greeting = getGreetingMessage(userName);
  expect(greeting).toBe("Hi, I'm Noel Gallagher. Nice to see you!");
});

test("call/apply/bind", () => {
  const user = { name: "Noel Gallagher" };
  const greeting_1 = greet.call(user, "Nice to see you!");
  const greeting_2 = greet.apply(user, ["Nice to see you!"]);
  const greeting_3 = greet.bind(user, "Nice to see you!");
  expect(greeting_1).toBe("Hi, I'm Noel Gallagher. Nice to see you!");
  expect(greeting_2).toBe("Hi, I'm Noel Gallagher. Nice to see you!");
  expect(greeting_3()).toBe("Hi, I'm Noel Gallagher. Nice to see you!");
});

test("userTitle1", () => {
  const users = userTitle1.addTitle(["Noel Gallagher", "Liam Gallagher"])
  expect(users).toStrictEqual(["Mr. Noel Gallagher", "Mr. Liam Gallagher"])
});

test("userTitle2", () => {
  const users = userTitle2.addTitle(["Noel Gallagher", "Liam Gallagher"])
  expect(users).toStrictEqual(["Mr. Noel Gallagher", "Mr. Liam Gallagher"])
});
