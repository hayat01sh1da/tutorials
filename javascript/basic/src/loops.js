"use strict;"

// While
const addInWhile1 = (init_val, max_val) => {
  let sum = 0;
  let num = init_val;
  while (num <= max_val) {
    sum += num;
    num += 1;
  };
  return sum;
};

const addInWhile2 = (init_val, max_val) => {
  let sum = 0;
  let num = init_val;
  do {
    sum += num;
    num += 1;
  } while (num <= max_val);
  return sum;
};

// For
const addInFor = (nums) => {
  let sum = 0;
  for (let i = 0; i < nums.length; i++) {
    sum += i + 1;
  };
  return sum;
};

// ForEach
const addInForEach = (nums) => {
  let sum = 0;
  nums.forEach(num => {
    sum += num;
  });
  return sum;
};

// Break loop
const isEven = (num) => {
  return num % 2 === 0;
};

const isEvenIncluded1 = (nums) => {
  let evenInNums = false;
  for (let i = 0; nums.length; i++) {
    const num = nums[i];
    if (isEven(num)) {
      evenInNums = true;
      break;
    }
  }
  return evenInNums;
};

const isEvenIncluded2 = (nums) => {
  return nums.some(isEven);;
};

// Continue loop
const evenNums1 = (nums) => {
  const evenNumsArray = [];
  for (let i = 0; i < nums.length; i++) {
    let num = nums[i];
    if (!isEven(num)) {
      continue;
    }
    evenNumsArray.push(num);
  }
  return evenNumsArray;
};

const evenNums2 = (nums) => {
  const evenNumsArray = [];
  for (let i = 0; i < nums.length; i++) {
    let num = nums[i];
    if (isEven(num)) {
      evenNumsArray.push(num);
    }
  }
  return evenNumsArray;
};

const evenNums3 = (nums) => {
  return nums.filter(isEven);;
};

// for...in
const getOnjectProperties1 = (obj) =>{
  const properties = [];
  for (const key in obj) {
    const val = obj[key];
    properties.push(`key: ${key}, val: ${val}`);
  }
  return properties;
};

const getOnjectProperties2 = (obj) =>{
  const properties = [];
  Object.keys(obj).forEach(key => {
    const val = obj[key];
    properties.push(`key: ${key}, val: ${val}`);
  });
  return properties;
};

// for...of
const addInForOf = (nums) => {
  let sum = 0;
  for (const num of nums) {
    sum += num;
  };
  return sum;
};

const addInReduce = (nums) => {
  const total = nums.reduce((sum, num) => {
    return sum + num;
  }, 0);
  return total;
};

export {
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
};
