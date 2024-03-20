"use strict;"

// Access properties
const getUserName1 = (user) => {
  const username = user.name;
  return username;
};

const getUserName2 = (user) => {
  const username = user["name"];
  return username;
};

// Destructuring assignment
const getLanguages1 = (langs) => {
  const en = langs["en"];
  const ja = langs["ja"];
  return [en, ja]
};

const getLanguages2 = (langs) => {
  const { en, ja } = langs;
  return [en, ja]
};

// Add property
const addProperty1 = (key, val) => {
  const user = {};
  user[key] = val;
  return user;
};

const addProperty2 = (key, val) => {
  const user = {
    [key]: val
  };
  return user;
};

// Optional chaining operator
const getProgrammingLanguages = () => {
  const pLangs = {
    "staticLang": [
      "C",
      "C++",
      "Java"
    ],
    "dynamicLang": [
      "Python",
      "Python",
      "PHP",
      "JavaScript"
    ]
  };
  return pLangs;
};

// Merge
const mergeObjects1 = (obj_1, obj_2) => {
  const mergedObj = Object.assign({}, obj_1, obj_2);
  return mergedObj;
};

const mergeObjects2 = (obj_1, obj_2) => {
  const mergedObj = { ...obj_1, ...obj_2};
  return mergedObj;
};

// Clone
const shallowClone = (obj) => {
  const cloneObj = Object.assign({}, obj);
  return cloneObj;
};

const deepClone = (obj) => {
  const cloneObj = shallowClone(obj);
  Object.keys(cloneObj)
  .filter(key => typeof cloneObj[key] === "object")
  .forEach(key => cloneObj[key] = deepClone(cloneObj[key]));
  return cloneObj;
}

export {
  getUserName1,
  getUserName2,
  getLanguages1,
  getLanguages2,
  addProperty1,
  addProperty2,
  getProgrammingLanguages,
  mergeObjects1,
  mergeObjects2,
  shallowClone,
  deepClone
};
