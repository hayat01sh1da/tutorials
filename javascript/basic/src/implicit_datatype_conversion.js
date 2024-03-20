"use strict";

const addBoolean = (num, bool) => {
  const sum = num + bool;
  return sum;
};

const logicalEqual = (arg_1, arg_2) => {
  const result = arg_1 == arg_2;
  return result;
};

const addAnotherType = (arg_1, arg_2) => {
  const result = arg_1 + arg_2;
  return result;
};

const substractAnotherType = (arg_1, arg_2) => {
  const result = arg_1 - arg_2;
  return result;
};

const addMultipulTypes = (arg_1, arg_2, arg_3) => {
  const result = arg_1 + arg_2 + arg_3;
  return result;
};

const convertToBoolean = (arg) => {
  const bool = Boolean(arg);
  return bool;
};

const convertToString = (arg) => {
  const str = String(arg);
  return str;
};

const convertToNumber = (arg) => {
  const num = Number(arg);
  return num;
};

const parseInteger = (arg) => {
  const int = Number.parseInt(arg, 10);
  return int;
};

const parseFloat = (arg) => {
  const float = Number.parseFloat(arg);
  return float;
};

export {
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
};
