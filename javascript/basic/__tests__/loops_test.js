"use strict;"

import {
  addInWhile1,
  addInWhile2,
  addInFor,
  addInForEach,
  isEvenIncluded1,
  isEvenIncluded2,
  evenNums1,
  evenNums2,
  evenNums3,
  getOnjectProperties1,
  getOnjectProperties2,
  addInForOf,
  addInReduce
} from "../src/loops";

// While
test("addInWhile1", () => {
  const sum = addInWhile1(0, 10);
  expect(sum).toBe(55);
});

test("addInWhile2", () => {
  const sum = addInWhile2(0, 10);
  expect(sum).toBe(55);
});

// For
test("addInFor", () => {
  const nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  const sum  = addInFor(nums);
  expect(sum).toBe(55);
});

// ForEach
test("addInForEach", () => {
  const nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  const sum  = addInForEach(nums);
  expect(sum).toBe(55)
});

// Break loop
test("isEvenIncluded1", () => {
  const nums   = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  const result = isEvenIncluded1(nums)
  expect(result).toBe(true);
});

test("isEvenIncluded2", () => {
  const nums   = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  const result = isEvenIncluded2(nums)
  expect(result).toBe(true);
});

// Continue loop
test("evenNums1", () => {
  const nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  const evenNumsArray = evenNums1(nums);
  expect(evenNumsArray).toStrictEqual([2, 4, 6, 8, 10]);
});

test("evenNums2", () => {
  const nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  const evenNumsArray = evenNums2(nums);
  expect(evenNumsArray).toStrictEqual([2, 4, 6, 8, 10]);
});

test("evenNums3", () => {
  const nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  const evenNumsArray = evenNums3(nums);
  expect(evenNumsArray).toStrictEqual([2, 4, 6, 8, 10]);
});

// for...in
test("getOnjectProperties1", () => {
  const obj = {
    "a": 1,
    "b": 2,
    "c": 3
  };
  const properties = getOnjectProperties1(obj);
  expect(properties).toStrictEqual(["key: a, val: 1", "key: b, val: 2", "key: c, val: 3"]);
});

test("getOnjectProperties2", () => {
  const obj = {
    "a": 1,
    "b": 2,
    "c": 3
  };
  const properties = getOnjectProperties2(obj);
  expect(properties).toStrictEqual(["key: a, val: 1", "key: b, val: 2", "key: c, val: 3"]);
});

// for...of
test("addInForOf", () => {
  const nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  const sum  = addInForOf(nums);
  expect(sum).toBe(55)
});

test("addInReduce", () => {
  const nums  = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  const total = addInReduce(nums);
  expect(total).toBe(55)
});
