"use strict;"

import {
  add,
  substract,
  multiply,
  devide,
  modulusCalc,
  raise,
  plus,
  minus,
  increment,
  decrement,
  strictEquality,
  strictInequal,
  equal,
  inequal,
  greaterThan,
  greaterThan_or_equalTo,
  lessThan,
  lessThan_or_equalTo,
  bitAND,
  bitOR,
  bitXOR,
  bitNOT,
  leftShift,
  rightShift,
  zeroRightShift,
  assignObj,
  logicalAND,
  logicalOR,
  logicalNOT,
  logicalDoubleNOT,
  coalesceNullishValues,
  ternary
} from "../src/operands";

// Binary operators
test("add", () => {
    const sum_1 = add(100, 200);
    const sum_2 = add(10, 0.5);
    const str  = add("Java", "Script");
    expect(sum_1).toBe(300);
    expect(sum_2).toBe(10.5);
    expect(str).toBe("JavaScript");
});

test("substract", () => {
    const diff_1 = substract(300, 200);
    const diff_2 = substract(10, 0.5);
    expect(diff_1).toBe(100);
    expect(diff_2).toBe(9.5);
});

test("multiply", () => {
    const product_1 = multiply(300, 200);
    const product_2 = multiply(10, 0.5);
    expect(product_1).toBe(60000);
    expect(product_2).toBe(5);
});

test("devide", () => {
    const quotient_1 = devide(300, 200);
    const quotient_2 = devide(10, 0.5);
    expect(quotient_1).toBe(1.5);
    expect(quotient_2).toBe(20);
});

test("modulusCalc", () => {
    const residue_1 = modulusCalc(300, 100);
    const residue_2 = modulusCalc(10, 3);
    expect(residue_1).toBe(0);
    expect(residue_2).toBe(1);
});

test("raise", () => {
    const result = raise(4, 4);
    expect(result).toBe(256);
});

// Unary operators
test("plus", () => {
    const result_1 = plus("100");
    const result_2 = plus("String");
    expect(result_1).toBe(100);
    expect(Number.isNaN(result_2)).toBe(true);
});

test("minus", () => {
    const result_1 = minus("100");
    const result_2 = minus("String");
    expect(result_1).toBe(-100);
    expect(Number.isNaN(result_2)).toBe(true);
});

test("increment", () => {
    const vals = increment(1);
    const result_1 = vals[0];
    const num_1 = vals[1];
    const result_2 = vals[2];
    const num_2 = vals[3];
    expect(result_1).toBe(1);
    expect(num_1).toBe(2);
    expect(result_2).toBe(2);
    expect(num_2).toBe(2);
});

test("decrement", () => {
    const vals = decrement(1);
    const result_1 = vals[0];
    const num_1 = vals[1];
    const result_2 = vals[2];
    const num_2 = vals[3];
    expect(result_1).toBe(1);
    expect(num_1).toBe(0);
    expect(result_2).toBe(0);
    expect(num_2).toBe(0);
});

// Comparative operator
test("strictEquality", () => {
    const result_1 = strictEquality(1, 1);
    const result_2 = strictEquality(1, "1");
    const obj_1 = {};
    const obj_2 = {};
    const result_3 = strictEquality(obj_1, obj_2);
    const result_4 = strictEquality(obj_1, obj_1);
    expect(result_1).toBe(true);
    expect(result_2).toBe(false);
    expect(result_3).toBe(false);
    expect(result_4).toBe(true);
});

test("strictInequal", () => {
    const result_1 = strictInequal(1, 1);
    const result_2 = strictInequal(1, "1");
    const obj_1 = {};
    const obj_2 = {};
    const result_3 = strictInequal(obj_1, obj_2);
    const result_4 = strictInequal(obj_1, obj_1);
    expect(result_1).toBe(false);
    expect(result_2).toBe(true);
    expect(result_3).toBe(true);
    expect(result_4).toBe(false);
});

test("equal", () => {
    const result_1 = equal(1, 1);
    const result_2 = equal(1, "1");
    const result_3 = equal(0, false);
    const result_4 = equal(0, null);
    const result_5 = equal(null, undefined);
    const obj_1 = {};
    const obj_2 = {};
    const result_6 = equal(obj_1, obj_2);
    const result_7 = equal(obj_1, obj_1);
    expect(result_1).toBe(true);
    expect(result_2).toBe(true);
    expect(result_3).toBe(true);
    expect(result_4).toBe(false);
    expect(result_5).toBe(true);
    expect(result_6).toBe(false);
    expect(result_7).toBe(true);
});

test("inequal", () => {
    const result_1 = inequal(1, 1);
    const result_2 = inequal(1, "01");
    const result_3 = inequal(0, false);
    const result_4 = inequal(0, null);
    const result_5 = inequal(null, undefined);
    const obj_1 = {};
    const obj_2 = {};
    const result_6 = inequal(obj_1, obj_2);
    const result_7 = inequal(obj_1, obj_1);
    expect(result_1).toBe(false);
    expect(result_2).toBe(false);
    expect(result_3).toBe(false);
    expect(result_4).toBe(true);
    expect(result_5).toBe(false);
    expect(result_6).toBe(true);
    expect(result_7).toBe(false);
});

test("greaterThan", () => {
  const result_1 = greaterThan(20, 10);
  const result_2 = greaterThan(10, 20);
  expect(result_1).toBe(true);
  expect(result_2).toBe(false);
});

test("greaterThan_or_equalTo", () => {
  const result_1 = greaterThan_or_equalTo(20, 10);
  const result_2 = greaterThan_or_equalTo(10, 20);
  const result_3 = greaterThan_or_equalTo(20, 20);
  expect(result_1).toBe(true);
  expect(result_2).toBe(false);
  expect(result_3).toBe(true);
});

test("lessThan", () => {
  const result_1 = lessThan(20, 10);
  const result_2 = lessThan(10, 20);
  expect(result_1).toBe(false);
  expect(result_2).toBe(true);
});

test("lessThan_or_equalTo", () => {
  const result_1 = lessThan_or_equalTo(20, 10);
  const result_2 = lessThan_or_equalTo(10, 20);
  const result_3 = lessThan_or_equalTo(20, 20);
  expect(result_1).toBe(false);
  expect(result_2).toBe(true);
  expect(result_3).toBe(true);
});

// Bit operators
test("bitAND", () => {
  const result_1 = bitAND(15, 9);
  const result_2 = bitAND(0b1111, 0b1001);
  expect(result_1).toBe(9);
  expect(result_2).toBe(0b1001);
});

test("bitOR", () => {
  const result_1 = bitOR(15, 9);
  const result_2 = bitOR(0b1111, 0b1001);
  expect(result_1).toBe(15);
  expect(result_2).toBe(0b1111);
});

test("bitXOR", () => {
  const result_1 = bitXOR(15, 9);
  const result_2 = bitXOR(0b1111, 0b1001);
  expect(result_1).toBe(6);
  expect(result_2).toBe(0b0110);
});

test("bitNOT", () => {
  const result_1 = bitNOT(15);
  const result_2 = bitNOT(0b1111);
  const result_3 = bitNOT(0);
  const result_4 = bitNOT(-1);
  expect(result_1).toBe(-16);
  expect(result_2).toBe(-0b10000);
  expect(result_3).toBe(-1);
  expect(result_4).toBe(0);
});

test("leftShift", () => {
  const result_1 = leftShift(9, 2);
  const result_2 = leftShift(0b1111, 2);
  expect(result_1).toBe(36);
  expect(result_2).toBe(0b111100);
});

test("rightShift", () => {
  const result = rightShift(-9, 2);
  expect(result).toBe(-3);
});

test("zeroRightShift", () => {
  const result = zeroRightShift(-9, 2);
  expect(result).toBe(1073741821);
});

// Assignment operators
test("assignObj", () => {
  const key = "name";
  const val = "Oasist";
  const obj = assignObj(key, val);
  const { name } = obj;
  const cloneName = obj.name;
  expect(name === cloneName).toBe(true);
});

// Logical operators
test("logicalAND", () => {
  const result_1 = logicalAND(true, "Foo");
  const result_2 = logicalAND(false, "Foo");
  const result_3 = logicalAND("Bar", "Foo");
  const result_4 = logicalAND(100, "Foo");
  const result_5 = logicalAND("", "Foo");
  const result_6 = logicalAND(0, "Foo");
  const result_7 = logicalAND(null, "Foo");
  expect(result_1).toBe("Foo");
  expect(result_2).toBe(false);
  expect(result_3).toBe("Foo");
  expect(result_4).toBe("Foo");
  expect(result_5).toBe("");
  expect(result_6).toBe(0);
  expect(result_7).toBe(null);
});

test("logicalOR", () => {
  const result_1 = logicalOR(true, "Foo");
  const result_2 = logicalOR(false, "Foo");
  const result_3 = logicalOR("Bar", "Foo");
  const result_4 = logicalOR(100, "Foo");
  const result_5 = logicalOR("", "Foo");
  const result_6 = logicalOR(0, "Foo");
  const result_7 = logicalOR(null, "Foo");
  expect(result_1).toBe(true);
  expect(result_2).toBe("Foo");
  expect(result_3).toBe("Bar");
  expect(result_4).toBe(100);
  expect(result_5).toBe("Foo");
  expect(result_6).toBe("Foo");
  expect(result_7).toBe("Foo");
});

test("logicalNOT", () => {
  const result_1 = logicalNOT(true);
  const result_2 = logicalNOT(false);
  const result_3 = logicalNOT(0);
  const result_4 = logicalNOT("");
  const result_5 = logicalNOT(null);
  const result_6 = logicalNOT(100);
  const result_7 = logicalNOT("Foo");
  expect(result_1).toBe(false);
  expect(result_2).toBe(true);
  expect(result_3).toBe(true);
  expect(result_4).toBe(true);
  expect(result_5).toBe(true);
  expect(result_6).toBe(false);
  expect(result_7).toBe(false);
});

test("logicalNOT", () => {
  const result = logicalNOT("Foo");
  expect(result).toBe(false);
});

test("coalesceNullishValues", () => {
  const result_1 = coalesceNullishValues(null, "Foo");
  const result_2 = coalesceNullishValues(undefined, "Foo");
  const result_3 = coalesceNullishValues(true, "Foo");
  const result_4 = coalesceNullishValues(false, "Foo");
  const result_5 = coalesceNullishValues(0, "Foo");
  const result_6 = coalesceNullishValues("Bar", "Foo");
  expect(result_1).toBe("Foo");
  expect(result_2).toBe("Foo");
  expect(result_3).toBe(true);
  expect(result_4).toBe(false);
  expect(result_5).toBe(0);
  expect(result_6).toBe("Bar");
});

test("ternary", () => {
  const result_1 = ternary(true, "Foo", "Bar");
  const result_2 = ternary(false, "Foo", "Bar");
  expect(result_1).toBe("Foo");
  expect(result_2).toBe("Bar");
});
