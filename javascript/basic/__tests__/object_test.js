"use strict;"

import {
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
} from "../src/object";

// Access properties
test("getUserName1", () => {
  const user = {
    name: "Oasist"
  }
  const username = getUserName1(user);
  expect(username).toBe("Oasist");
});

test("getUserName2", () => {
  const user = {
    name: "Oasist"
  }
  const username = getUserName2(user);
  expect(username).toBe("Oasist");
});

// Destructuring assignment
test("getLanguages1", () => {
  const langs = {
    en: "English",
    ja: "Japanese"
  }
  const keys = Object.keys(langs);
  const vals = Object.values(langs);
  const entries = Object.entries(langs);
  const langsArr = getLanguages1(langs);
  const english   = langsArr[0];
  const japanese  = langsArr[1];
  expect(keys).toStrictEqual(["en", "ja"]);
  expect(vals).toStrictEqual(["English", "Japanese"]);
  expect(entries).toStrictEqual([["en", "English"], ["ja", "Japanese"]]);
  expect(english).toBe("English");
  expect(japanese).toBe("Japanese");
  // Property presence
  expect("en" in langs).toBe(true);
  expect(langs.hasOwnProperty("en")).toBe(true);
  expect("ja" in langs).toBe(true);
  expect(langs.hasOwnProperty("ja")).toBe(true);
  // Delete property
  delete langs.en;
  expect(langs).toStrictEqual({ ja: "Japanese" });
  // Property presence
  expect("en" in langs).toBe(false);
  expect(langs.hasOwnProperty("en")).toBe(false);
  expect("ja" in langs).toBe(true);
  expect(langs.hasOwnProperty("ja")).toBe(true);
});

test("getLanguages2", () => {
  const langs = {
    en: "English",
    ja: "Japanese"
  }
  const keys = Object.keys(langs);
  const vals = Object.values(langs);
  const entries = Object.entries(langs);
  const langsArr = getLanguages2(langs);
  const english   = langsArr[0];
  const japanese  = langsArr[1];
  expect(keys).toStrictEqual(["en", "ja"]);
  expect(vals).toStrictEqual(["English", "Japanese"]);
  expect(entries).toStrictEqual([["en", "English"], ["ja", "Japanese"]]);
  expect(english).toBe("English");
  expect(japanese).toBe("Japanese");
  // Property presence
  expect("en" in langs).toBe(true);
  expect(langs.hasOwnProperty("en")).toBe(true);
  expect("ja" in langs).toBe(true);
  expect(langs.hasOwnProperty("ja")).toBe(true);
  // Delete property
  delete langs.ja;
  expect(langs).toStrictEqual({ en: "English" });
  // Property presence
  expect("en" in langs).toBe(true);
  expect(langs.hasOwnProperty("en")).toBe(true);
  expect("ja" in langs).toBe(false);
  expect(langs.hasOwnProperty("ja")).toBe(false);
});

// Add property
test("addProperty1", () => {
  const key  = "name";
  const val  = "Oasist";
  const user = addProperty1(key, val);
  expect(user).toStrictEqual({ name: "Oasist" });
});

test("addProperty2", () => {
  const key  = "name";
  const val  = "Oasist";
  const user = addProperty2(key, val);
  expect(user).toStrictEqual({ name: "Oasist" });
});

// Optional chaining operator
test("getProgrammingLanguages", () => {
  const pLangs = getProgrammingLanguages();
  const staticLang  = pLangs?.["staticLang"];
  const dynamicLang = pLangs?.["dynamicLang"];
  const nonExistent = pLangs?.markup?.foo;
  expect(staticLang).toStrictEqual(["C", "C++", "Java"]);
  expect(dynamicLang).toStrictEqual(["Python", "Python", "PHP", "JavaScript"]);
  expect(nonExistent).toBe(undefined);
});

// Merge
test("mergeObjects1", () => {
  const objA = { a: 1, b: 2};
  const objB = { c: 3, d: 4};
  const mergedObj = mergeObjects1(objA, objB);
  expect(mergedObj).toStrictEqual({ a: 1, b: 2, c: 3, d: 4})
});

test("mergeObjects2", () => {
  const objA = { a: 1, b: 2};
  const objB = { c: 3, d: 4};
  const mergedObj = mergeObjects2(objA, objB);
  expect(mergedObj).toStrictEqual({ a: 1, b: 2, c: 3, d: 4})
});

// Clone
test("shallowClone", () => {
  const obj = {
      level: 1,
      nest: {
          level: 2
      },
  };
  const cloneObj = shallowClone(obj);
  expect(obj.nest === cloneObj.nest).toBe(true);
});

test("deepClone", () => {
  const obj = {
      level: 1,
      nest: {
          level: 2
      },
  };
  const cloneObj = deepClone(obj);
  expect(obj.nest === cloneObj.nest).toBe(false);
});
