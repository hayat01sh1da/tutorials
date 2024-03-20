"use strict";

const getDataTypes = () => {
  const type_1  = typeof true;
  const type_2  = typeof 42;
  const type_3  = typeof 9007199254740992n;
  const type_4  = typeof "JavaScript";
  const type_5  = typeof new String("JavaScript");
  const type_6  = typeof Symbol("シンボル");
  const type_7  = typeof undefined;
  const type_8  = typeof null;
  const type_9  = typeof ["配列"];
  const type_10 = typeof { "key": "value" };
  const type_11 = typeof function() {};
  return [
    type_1,
    type_2,
    type_3,
    type_4,
    type_5,
    type_6,
    type_7,
    type_8,
    type_9,
    type_10,
    type_11
  ]
};

const getBoolean = () => {
  const bool_1  = true;
  const bool_2  = false;
  return [bool_1, bool_2];
};

const getInteger = () => {
  const int = 20210314;
  return int;
};

const getBinary = () => {
  const bin = 0b10000000000;
  return bin;
};

const getOctal = () => {
  const oct = 0o644;
  return oct;
};

const getHex = () => {
  const hex = 0x30A2;
  return hex;
};

const getFloat = () => {
  const float_1  = .123;
  const float_2  = 2e8;
  return [float_1, float_2];
};

const getBigInt = () => {
  const bigInt_1 = Number.MAX_SAFE_INTEGER;
  const bigInt_2 = 9007199254740992n;
  return [bigInt_1, bigInt_2];
};

const getString = () => {
  const str_1 = "String";
  const str_2 = '8 o\'clock';
  const str_3 = "8 o'clock";
  const str_4 = `1st line
2nd line
3rd line`;
  const name = "Oasist";
  const age  = 29;
  const str_5 = `I'm ${name} and ${age} years old.`;
  return [str_1, str_2, str_3, str_4, str_5];
};

const getNull = () => {
  const val = null;
  return val;
};

const getObject = () => {
  const obj = { "name": "Oasist" };
  return obj;
};

const getRegExp = () => {
  const numberRegExp = /\d+/;
  const result = numberRegExp.test("123");
  return result;
}

export {
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
};
