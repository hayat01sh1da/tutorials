"use strict;"

import {
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
} from "../src/array";

// Access elememts
test("getVectorElement", () => {
  const denseVector  = ["a", "b", "c", "d"]
  const sparseVector = ["a", "b", , "d"]
  const denseA  = getVectorElement(denseVector, 0);
  const denseB  = getVectorElement(denseVector, 1);
  const denseC  = getVectorElement(denseVector, 2);
  const denseD  = getVectorElement(denseVector, 3);
  const sparseA = getVectorElement(sparseVector, 0);
  const sparseB = getVectorElement(sparseVector, 1);
  const sparseC = getVectorElement(sparseVector, 2);
  const sparseD = getVectorElement(sparseVector, 3);
  expect(denseA).toBe("a");
  expect(denseB).toBe("b");
  expect(denseC).toBe("c");
  expect(denseD).toBe("d");
  expect(sparseA).toBe("a");
  expect(sparseB).toBe("b");
  expect(sparseC).toBe(undefined);
  expect(sparseD).toBe("d");
});

test("getMatrixElement", () => {
  const matrix = [
    ["a", "b"],
    ["c", "d"]
  ];
  const a  = getMatrixElement(matrix, 0, 0);
  const b  = getMatrixElement(matrix, 0, 1);
  const c  = getMatrixElement(matrix, 1, 0);
  const d  = getMatrixElement(matrix, 1, 1);
  const dd = getMatrixElement(matrix, matrix.length-1, matrix.length-1);
  const e  = getMatrixElement(matrix, 1, 2);
  expect(a).toBe("a");
  expect(b).toBe("b");
  expect(c).toBe("c");
  expect(d).toBe("d");
  expect(dd).toBe("d");
  expect(e).toBe(undefined);
  expect(() => {
    getMatrixElement(arr, 2, 2);
  }).toThrow();
});

test("Array#isArray", () => {
  const arr = [];
  const obj = {};
  expect(Array.isArray(arr)).toBe(true);
  expect(Array.isArray(obj)).toBe(false);
});

// Destructuring assignment
test("Destructuring assignment of an array", () => {
  const vector = ["a", "b", "c", "d"];
  const [a, b, c, d] = vector
  expect(a).toBe("a")
  expect(b).toBe("b");
  expect(c).toBe("c");
  expect(d).toBe("d");
})

// Index/element reference
test("getLangIndex", () => {
  const langs   = ["Java", "Python", "Ruby", "JavaScript"];
  const javaIdx = getLangIndex(langs, "Java");
  const pyIdx   = getLangIndex(langs, "Python");
  const rbIdx   = getLangIndex(langs, "Ruby");
  const jsIdx   = getLangIndex(langs, "JavaScript");
  const tsIdx   = getLangIndex(langs, "TypeScript");
  expect(javaIdx).toBe(0);
  expect(pyIdx).toBe(1);
  expect(rbIdx).toBe(2);
  expect(jsIdx).toBe(3);
  expect(tsIdx).toBe(-1);
  const indexArr1 = langs.slice(1, 3);
  const indexArr2 = langs.slice(2);
  const indexArr3 = langs.slice(-1);
  const indexArr4 = langs.slice(1, 1);
  const indexArr5 = langs.slice(2, 1);
  expect(indexArr1).toStrictEqual(["Python", "Ruby"]);
  expect(indexArr2).toStrictEqual(["Ruby", "JavaScript"]);
  expect(indexArr3).toStrictEqual(["JavaScript"]);
  expect(indexArr4).toStrictEqual([]);
  expect(indexArr5).toStrictEqual([]);
  const result_1 = langs.includes("Java");
  const result_2 = langs.includes("Python");
  const result_3 = langs.includes("Ruby");
  const result_4 = langs.includes("JavaScript");
  const result_5 = langs.includes("TypeScript");
  expect(result_1).toBe(true);
  expect(result_2).toBe(true);
  expect(result_3).toBe(true);
  expect(result_4).toBe(true);
  expect(result_5).toBe(false);
  // Add an element to the head
  langs.unshift("C");
  expect(langs).toStrictEqual(["C", "Java", "Python", "Ruby", "JavaScript"]);
  // Delete the first element
  langs.shift();
  expect(langs).toStrictEqual(["Java", "Python", "Ruby", "JavaScript"]);
  // Delete the last element
  langs.pop();
  expect(langs).toStrictEqual(["Java", "Python", "Ruby"]);
  // Concatenate another array
  const cloudServer = ["AWS", "GCP", "Azure"];
  const newArray1 = langs.concat(cloudServer);
  const newArray2 = ["Java", "Python", "Ruby", ...cloudServer];
  expect(newArray1).toStrictEqual(["Java", "Python", "Ruby", "AWS", "GCP", "Azure"]);
  expect(newArray2).toStrictEqual(["Java", "Python", "Ruby", "AWS", "GCP", "Azure"]);
});

test("getSingerIndex", () => {
  const singers = [
    { name: "Noel Gallagher" },
    { name: "Liam Gallagher" },
    { name: "Michal Jackson" },
    { name: "Freddie Mercury" }
  ]
  const noelIdx = getSingerIndex(singers);
  expect(noelIdx).toBe(0);
});

test("getSingerElement", () => {
  const singers = [
    { name: "Noel Gallagher" },
    { name: "Liam Gallagher" },
    { name: "Michal Jackson" },
    { name: "Freddie Mercury" }
  ]
  const noelIdx = getSingerElement(singers);
  expect(noelIdx).toStrictEqual({ name: "Noel Gallagher" });
});

// Flatten nested array
test("flattenNestedArray", () => {
 const arr = [1, [2], [3, [4, [5]]], 6];
 const flatArr1 = flattenNestedArray(arr, 1);
 const flatArr2 = flattenNestedArray(arr, 2);
 const flatArr3 = flattenNestedArray(arr, 3);
 const flatArr4 = flattenNestedArray(arr, Infinity);
 expect(flatArr1).toStrictEqual([1, 2, 3, [4, [5]], 6]);
 expect(flatArr2).toStrictEqual([1, 2, 3, 4, [5], 6]);
 expect(flatArr3).toStrictEqual([1, 2, 3, 4, 5, 6]);
 expect(flatArr4).toStrictEqual([1, 2, 3, 4, 5, 6]);
 // Splice elements
 flatArr3.splice(0, 3);
 flatArr4.splice(0, 3, ...[7, 8, 9]);
 expect(flatArr3).toStrictEqual([4, 5, 6]);
 expect(flatArr4).toStrictEqual([7, 8, 9, 4, 5, 6]);
 // Delete elements
 flatArr3.splice(0, flatArr1.length);
 flatArr4.length = 0;
 expect(flatArr3).toStrictEqual([]);
 expect(flatArr4).toStrictEqual([]);
});

// Loop methods
test("addInForEach", () => {
  const nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  const sum  = addInForEach(nums);
  expect(sum).toBe(55);
});

test("multiplyNums", () => {
  const nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  const products  = multiplyNums(nums);
  expect(products).toStrictEqual([10, 20, 30, 40, 50, 60, 70, 80, 90, 100]);
});

test("getEvenNums", () => {
  const nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  const evenNums = getEvenNums(nums);
  expect(evenNums).toStrictEqual([2, 4, 6, 8, 10]);
});

test("addInReduce", () => {
  const nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  const sum  = addInReduce(nums);
  expect(sum).toBe(55);
});
