"use strict;"

import {
  defaultArgFunc,
  falsyAcceptiveFunc,
  falsyRejectingFunc,
  restArgsFunc1,
  restArgsFunc2,
  argsSpreadFunc,
  returnUserId1,
  returnUserId2,
  returnUserId3
} from "../src/functions_and_statements";

// Fuxntions dealing with a default argument
test("defaultArgFunc", () =>{
  const text_1 = defaultArgFunc("string");
  const text_2 = defaultArgFunc("string", "Custom ");
  expect(text_1).toBe("Default string");
  expect(text_2).toBe("Custom string");
});

test("falsyAcceptiveFunc", () =>{
  // Non falsy
  const text_1 = falsyAcceptiveFunc("string");
  const text_2 = falsyAcceptiveFunc("string", "Custom ");
  expect(text_1).toBe("Default string");
  expect(text_2).toBe("Custom string");
  // Falsy
  const text_3 = falsyAcceptiveFunc("string", false);
  const text_4 = falsyAcceptiveFunc("string", undefined);
  const text_5 = falsyAcceptiveFunc("string", null);
  const text_6 = falsyAcceptiveFunc("string", 0);
  const text_7 = falsyAcceptiveFunc("string", 0n);
  const text_8 = falsyAcceptiveFunc("string", NaN);
  const text_9 = falsyAcceptiveFunc("string", "");
  expect(text_3).toBe("Default string");
  expect(text_4).toBe("Default string");
  expect(text_5).toBe("Default string");
  expect(text_6).toBe("Default string");
  expect(text_7).toBe("Default string");
  expect(text_8).toBe("Default string");
  expect(text_9).toBe("Default string");
});

test("falsyRejectingFunc", () =>{
  // Non falsy
  const text_1 = falsyRejectingFunc("string");
  const text_2 = falsyRejectingFunc("string", "Custom ");
  expect(text_1).toBe("Default string");
  expect(text_2).toBe("Custom string");
  // Falsy
  const text_3 = falsyRejectingFunc("string", false);
  const text_4 = falsyRejectingFunc("string", undefined);
  const text_5 = falsyRejectingFunc("string", null);
  const text_6 = falsyRejectingFunc("string", 0);
  const text_7 = falsyRejectingFunc("string", 0n);
  const text_8 = falsyRejectingFunc("string", NaN);
  const text_9 = falsyRejectingFunc("string", "");
  expect(text_3).toBe("falsestring");
  expect(text_4).toBe("Default string");
  expect(text_5).toBe("Default string");
  expect(text_6).toBe("0string");
  expect(text_7).toBe("0string");
  expect(text_8).toBe("NaNstring");
  expect(text_9).toBe("string");
});

// Rest parameters
test("restArgsFunc1", () =>{
  const nums = restArgsFunc1(1, 2, 3);
  expect(nums).toStrictEqual([1, 2, 3]);
});

test("restArgsFunc2", () =>{
  const nums = restArgsFunc2(1, 2, 3);
  expect(nums[0]).toBe(1);
  expect(nums[1]).toStrictEqual([2, 3]);
});

test("argsSpreadFunc", () =>{
  const numsArray = [1, 2, 3]
  const nums = argsSpreadFunc(...numsArray)
  expect(nums[0]).toBe(1);
  expect(nums[1]).toBe(2);
  expect(nums[2]).toBe(3);
});

// Destructuring assignment
test("returnUserId1", () =>{
  const user = { "id": 1}
  const userID = returnUserId1(user)
  expect(userID).toBe(1)
});

test("returnUserId2", () =>{
  const user = { "id": 1}
  const { id } = user
  const userID = returnUserId2(id)
  expect(userID).toBe(1)
});

test("returnUserId3", () =>{
  const user = { "id": 1}
  const userID = returnUserId3(user)
  expect(userID).toBe(1)
});
