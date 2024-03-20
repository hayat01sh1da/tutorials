"use strict;"

// Access elememts
const getVectorElement = (vector, index) => {
  return vector[index];
};

const getMatrixElement = (matrix, y, x) => {
  return matrix[y][x];
};

// Index/element reference
const getLangIndex = (langs, lang) => {
  const index = langs.indexOf(lang);
  return index;
};

const isNoel = (singer) => {
  return singer.name === "Noel Gallagher";
};

const getSingerIndex = (singers) => {
  const index = singers.findIndex(isNoel);
  return index;
}

const getSingerElement = (singers) => {
  const elem = singers.find(isNoel);
  return elem;
}

// Flatten nested array
const flattenNestedArray = (arr, depth) => {
  const flatArr = arr.flat(depth);
  return flatArr;
};

// Loop methods
const addInForEach = (nums) => {
  let sum = 0;
  nums.forEach(num => {
    sum += num;
  });
  return sum;
};

const multiplyNums = (nums) => {
  const products = nums.map(num => {
    return num * 10;
  });
  return products;
};

const isEven = (num) => {
  return num % 2 === 0;
};

const getEvenNums = (nums) => {
  const evenNums = nums.filter(isEven);
  return evenNums;
};

const addInReduce = (nums) => {
  const sum = nums.reduce((sum, num) => {
    return sum + num;
  }, 0)
  return sum;
};

export {
  getVectorElement,
  getMatrixElement,
  getLangIndex,
  getSingerIndex,
  getSingerElement,
  flattenNestedArray,
  addInForEach,
  multiplyNums,
  getEvenNums,
  addInReduce
};
