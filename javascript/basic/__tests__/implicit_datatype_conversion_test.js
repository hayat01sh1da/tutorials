"use strict;"

import {
  addBoolean,
  logicalEqual,
  addAnotherType,
  substractAnotherType,
  addMultipulTypes,
  convertToBoolean,
  convertToString,
  convertToNumber,
  parseInteger,
  parseFloat
} from "../src/implicit_datatype_conversion";

test("addBoolean", () => {
  const sum_1 = addBoolean(1, true);
  const sum_2 = addBoolean(1, false);
  expect(sum_1).toBe(2);
  expect(sum_2).toBe(1);
});

test("logicalEqual", () => {
  const result_1 = logicalEqual(1, true);
  const result_2 = logicalEqual(0, false);
  const result_3 = logicalEqual(100, "100");
  const result_4 = logicalEqual(100, [100]);
  const result_5 = logicalEqual(100, ["100"]);
  expect(result_1).toBe(true);
  expect(result_2).toBe(true);
  expect(result_3).toBe(true);
  expect(result_4).toBe(true);
  expect(result_5).toBe(true);
});

test("addAnotherType", () => {
  const result_1 = addAnotherType(1, "1");
  const result_2 = addAnotherType("1", "1");
  expect(result_1).toBe("11");
  expect(result_2).toBe("11");
});

test("substractAnotherType", () => {
  const result_1 = substractAnotherType(2, "1");
  const result_2 = substractAnotherType("2", "1");
  expect(result_1).toBe(1);
  expect(result_2).toBe(1);
});

test("addMultipulTypes", () => {
  const result_1 = addMultipulTypes(1, 2, "3");
  const result_2 = addMultipulTypes("1", 2, 3);
  const result_3 = addMultipulTypes(1, "2", 3);
  const result_4 = addMultipulTypes(1, undefined, 3);
  const result_5 = addMultipulTypes(1, NaN, 3);
  expect(result_1).toBe("33");
  expect(result_2).toBe("123");
  expect(result_3).toBe("123");
  expect(result_4).toBe(NaN);
  expect(result_5).toBe(NaN);
});

test("convertToBoolean", () => {
  // Non falsy
  const bool_1 = convertToBoolean("string");
  const bool_2 = convertToBoolean(1);
  const bool_3 = convertToBoolean({});
  expect(bool_1).toBe(true);
  expect(bool_2).toBe(true);
  expect(bool_3).toBe(true);
  // Falsy
  const bool_4 = convertToBoolean(0);
  const bool_5 = convertToBoolean("");
  const bool_6 = convertToBoolean(null);
  expect(bool_4).toBe(false);
  expect(bool_5).toBe(false);
  expect(bool_6).toBe(false);
});

test("convertToString", () => {
  // Primitive
  const str_1 = convertToString("String");
  const str_2 = convertToString(true);
  const str_3 = convertToString(null);
  const str_4 = convertToString(undefined);
  const str_5 = convertToString(Symbol("Symbol"));
  expect(str_1).toBe("String");
  expect(str_2).toBe("true");
  expect(str_3).toBe("null");
  expect(str_4).toBe("undefined");
  expect(str_5).toBe("Symbol(Symbol)");
  // Non primitive
  const str_6 = convertToString([1, 2, 3]);
  const str_7 = convertToString({ key: "value" });
  const str_8 = convertToString(function() {});
  expect(str_6).toBe("1,2,3");
  expect(str_7).toBe("[object Object]");
  expect(str_8).toBe("function () {}");
});

test("convertToNumber", () => {
  const num_1 = convertToNumber("42");
  const num_2 = convertToNumber("Foo");
  expect(num_1).toBe(42);
  expect(Number.isNaN(num_2)).toBe(true);
});

test("parseInteger", () => {
  const int_1 = parseInteger("1");
  const int_2 = parseInteger("42px");
  const int_3 = parseInteger("10.5");
  expect(int_1).toBe(1);
  expect(int_2).toBe(42);
  expect(int_3).toBe(10);
});

test("parseFloat", () => {
  const float_1 = parseFloat("1");
  const float_2 = parseFloat("42.5px");
  const float_3 = parseFloat("10.5");
  expect(float_1).toBe(1);
  expect(float_2).toBe(42.5);
  expect(float_3).toBe(10.5);
});
