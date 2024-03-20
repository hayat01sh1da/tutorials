"use strict;"

import {
  getDataTypes,
  getBoolean,
  getInteger,
  getBinary,
  getOctal,
  getHex,
  getFloat,
  getBigInt,
  getString,
  getNull,
  getObject,
  getRegExp
} from "../src/datatypes_and_literals";

test("getDataTypes", () => {
  const dataTypes = getDataTypes();
  expect(dataTypes[0]).toBe("boolean");
  expect(dataTypes[1]).toBe("number");
  expect(dataTypes[2]).toBe("bigint");
  expect(dataTypes[3]).toBe("string");
  expect(dataTypes[4]).toBe("object");
  expect(dataTypes[5]).toBe("symbol");
  expect(dataTypes[6]).toBe("undefined");
  expect(dataTypes[7]).toBe("object");
  expect(dataTypes[8]).toBe("object");
  expect(dataTypes[9]).toBe("object");
  expect(dataTypes[10]).toBe("function");
});

test("getBoolean", () => {
  const bools = getBoolean()
  expect(bools[0]).toBe(true);
  expect(bools[1]).toBe(false);
});

test("getInteger", () => {
  const int = getInteger();
  expect(int).toBe(20210314);
});

test("getBinary", () => {
  const bin = getBinary();
  expect(bin).toBe(1024);
});

test("getOctal", () => {
  const oct = getOctal();
  expect(oct).toBe(420);
});

test("getHex", () => {
  const hex = getHex();
  expect(hex).toBe(12450);
});

test("getFloat", () => {
  const floats = getFloat();
  expect(floats[0]).toBe(0.123);
  expect(floats[1]).toBe(200000000);
});

test("getBigInt", () => {
  const bigInts = getBigInt();
  expect(bigInts[0]).toBe(9007199254740991);
  expect(bigInts[1]).toBe(9007199254740992n);
});

test("getString", () => {
  const strs = getString();
  expect(strs[0]).toBe("String");
  expect(strs[1]).toBe("8 o'clock");
  expect(strs[2]).toBe("8 o'clock");
  expect(strs[3]).toBe("1st line\n2nd line\n3rd line");
  expect(strs[4]).toBe("I'm Oasist and 29 years old.");
});

test("getNull", () => {
  const val = getNull();
  expect(val).toBe(null);
});

test("getObject", () => {
  const obj = getObject();
  expect(obj).toStrictEqual({ "name": "Oasist" });
  expect(obj["name"]).toBe("Oasist");
  expect(obj.name).toBe("Oasist");
});

test("getRegExp", () => {
  const result = getRegExp();
  expect(result).toBe(true);
});
