"use strict";

// Binary operators
const add = (arg_1, arg_2) => {
  const sum = arg_1 + arg_2;
  return sum;
};

const substract = (arg_1, arg_2) => {
  const diff = arg_1 - arg_2;
  return diff;
};

const multiply = (arg_1, arg_2) => {
  const product = arg_1 * arg_2;
  return product;
};

const devide = (arg_1, arg_2) => {
  const quotient = arg_1 / arg_2;
  return quotient;
};

const modulusCalc = (arg_1, arg_2) => {
  const residue = arg_1 % arg_2;
  return residue;
};

const raise = (arg_1, arg_2) => {
  const result = arg_1 ** arg_2;
  return result;
};

// Unary operators
const plus = (arg) => {
  const result = +arg;
  return result;
};

const minus = (arg) => {
  const result = -arg;
  return result;
};

const increment = (init_val) => {
  let num_1 = init_val;
  const val_1 = num_1++;
  let num_2 = init_val;
  const val_2 = ++num_2;
  return [val_1, num_1, val_2, num_2];
};

const decrement = (init_val) => {
  let num_1 = init_val;
  const val_1 = num_1--;
  let num_2 = init_val;
  const val_2 = --num_2;
  return [val_1, num_1, val_2, num_2];
};

// Comparative operators
const strictEquality = (arg_1, arg_2) => {
  const result = arg_1 === arg_2;
  return result;
};

const strictInequal = (arg_1, arg_2) => {
  const result = arg_1 !== arg_2;
  return result;
};

const equal = (arg_1, arg_2) => {
  const result = arg_1 == arg_2;
  return result;
};

const inequal = (arg_1, arg_2) => {
  const result = arg_1 != arg_2;
  return result;
};

const greaterThan = (arg_1, arg_2) => {
  const result = arg_1 > arg_2;
  return result;
};

const greaterThan_or_equalTo = (arg_1, arg_2) => {
  const result = arg_1 >= arg_2;
  return result;
};

const lessThan = (arg_1, arg_2) => {
  const result = arg_1 < arg_2;
  return result;
};

const lessThan_or_equalTo = (arg_1, arg_2) => {
  const result = arg_1 <= arg_2;
  return result;
};

// Bit operators
const bitAND = (arg_1, arg_2) => {
  const result = arg_1 & arg_2;
  return result;
};

const bitOR = (arg_1, arg_2) => {
  const result = arg_1 | arg_2;
  return result;
};

const bitXOR = (arg_1, arg_2) => {
  const result = arg_1 ^ arg_2;
  return result;
};

const bitNOT = (arg) => {
  const result = ~ arg;
  return result;
};

const leftShift = (num, shift) => {
  const result = num << shift;
  return result;
};

const rightShift = (num, shift) => {
  const result = num >> shift;
  return result;
};

const zeroRightShift = (num, shift) => {
  const result = num >>> shift;
  return result;
};

// Assignment operators
const assignObj = (key, val) => {
  const obj = { [key]: val };
  return obj;
};

// Logical operators
const logicalAND = (arg_1, arg_2) => {
  const result = arg_1 && arg_2;
  return result;
};

const logicalOR = (arg_1, arg_2) => {
  const result = arg_1 || arg_2;
  return result;
};

const logicalNOT = (arg) => {
  const result = !arg;
  return result;
};

const logicalDoubleNOT = (arg) => {
  const result = !!arg;
  return result;
};

const coalesceNullishValues = (arg_1, arg_2) => {
  const result = arg_1 ?? arg_2;
  return result;
};

const ternary = (boolean_arg, argTrue, argFalse) => {
  const result = boolean_arg ? argTrue : argFalse;
  return result;
};

export {
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
};
