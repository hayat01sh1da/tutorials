"use strict;"

import {
  getJavaScriptVersion1,
  getJavaScriptVersion2
} from "../src/conditional_statements";

// If statement
test("getJavaScriptVersion1", () => {
  const ver_1 = getJavaScriptVersion1("ES5");
  const ver_2 = getJavaScriptVersion1("ES6");
  const ver_3 = getJavaScriptVersion1("ES7");
  const ver_4 = getJavaScriptVersion1("Foo");
  expect(ver_1).toBe("ECMAScript 5");
  expect(ver_2).toBe("ECMAScript 2015");
  expect(ver_3).toBe("ECMAScript 2016");
  expect(ver_4).toBe("Input a version of a specific JavaScript version.");
});

// Switch statement
test("getJavaScriptVersion2", () => {
  const ver_1 = getJavaScriptVersion2("ES5");
  const ver_2 = getJavaScriptVersion2("ES6");
  const ver_3 = getJavaScriptVersion2("ES7");
  const ver_4 = getJavaScriptVersion2("Foo");
  expect(ver_1).toBe("ECMAScript 5");
  expect(ver_2).toBe("ECMAScript 2015");
  expect(ver_3).toBe("ECMAScript 2016");
  expect(ver_4).toBe("Input a version of a specific JavaScript version.");
});
