"use strict;"

import {
  greet
} from "../dist/greetings";

test("greet", () => {
  const greeting_1 = greet(0);
  const greeting_2 = greet(1);
  const greeting_3 = greet(2);
  const greeting_4 = greet(3);
  const greeting_5 = greet(4);
  const greeting_6 = greet(5);
  const greeting_7 = greet(6);
  expect(greeting_1).toBe("Good morning");
  expect(greeting_2).toBe("Hello");
  expect(greeting_3).toBe("Hi");
  expect(greeting_4).toBe("Good evening");
  expect(greeting_5).toBe("Good night");
  expect(greeting_6).toBe("See you");
  expect(greeting_7).toBe("The index you assign is out of range.");
})
