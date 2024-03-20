"use strict;"

const parseJSON = (json) => {
  try {
    const obj = JSON.parse(json);
    return obj;
  } catch (error) {
    return error.message
  }
};

const replacer = (key, val) => {
  if (val === null) {
    return undefined;
  }
  return val;
};

const stringifyObject = (obj) => {
  try {
    const json = JSON.stringify(obj, replacer, 2);
    return json;
  } catch (error) {
    return error.message
  }
};

export {
  parseJSON,
  stringifyObject
};
