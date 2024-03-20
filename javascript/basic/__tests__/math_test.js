"use strict;"

import {
  getRandom,
  getMax,
  getMin,
  getFloor,
  getCeil,
  getRound,
  getTrunc
} from "../src/math";

test("getRandom", () => {
  const random = getRandom(10, 0);
  expect(typeof random).toBe("number");
});

test("getMax", () => {
  const nums = [...Array(10).keys()].map(num => ++num);
  const max  = getMax(nums);
  expect(max).toBe(10);
});

test("getMin", () => {
  const nums = [...Array(10).keys()].map(num => ++num);
  const max  = getMin(nums);
  expect(max).toBe(1);
});

test("getFloor", () => {
  const float_1 = 1.3
  const float_2 = -1.3
  const floor_1 = getFloor(float_1);
  const floor_2 = getFloor(float_2);
  expect(floor_1).toBe(1.0);
  expect(floor_2).toBe(-2.0);
});

test("getCeil", () => {
  const float_1 = 1.3
  const float_2 = -1.3
  const ceil_1 = getCeil(float_1);
  const ceil_2 = getCeil(float_2);
  expect(ceil_1).toBe(2.0);
  expect(ceil_2).toBe(-1.0);
});

test("getRound", () => {
  const float_1 = 1.3
  const float_2 = 1.6
  const float_3 = -1.3
  const round_1 = getRound(float_1);
  const round_2 = getRound(float_2);
  const round_3 = getRound(float_3);
  expect(round_1).toBe(1.0);
  expect(round_2).toBe(2.0);
  expect(round_3).toBe(-1.0);
});

test("getTrunc", () => {
  const float_1 = 1.3
  const float_2 = -1.3
  const trunc_1 = getTrunc(float_1);
  const trunc_2 = getTrunc(float_2);
  expect(trunc_1).toBe(1.0);
  expect(trunc_2).toBe(-1.0);
});
