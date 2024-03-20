"use strict;"

import {
  removeDuplicateSpace,
  getBaseURL,
  getURLQueryString,
  getIndexInSearch,
  getIndexInMatch,
  getIndexInMatchAll,
  convertToEnDate,
  replaceString
} from "../src/string";

test("removeDuplicateSpace", () => {
  const str = "a     b    c      d";
  const newStr = removeDuplicateSpace(str);
  expect(newStr).toBe("a b c d");
});

test("String#slice/String#substring", () => {
  const text = "You said good-bye and I said hello.";
  const str_1 = text.slice(4);
  const str_2 = text.substring(4);
  expect(str_1).toBe("said good-bye and I said hello.");
  expect(str_2).toBe("said good-bye and I said hello.");
  const str_3 = text.slice(2, 8);
  const str_4 = text.substring(2, 8);
  expect(str_3).toBe("u said");
  expect(str_4).toBe("u said");
  const str_5 = text.slice(-1);
  // Same as text.substring(0)
  const str_6 = text.substring(-1);
  expect(str_5).toBe(".");
  expect(str_6).toBe("You said good-bye and I said hello.");
  const str_7 = text.slice(9, 3);
  // Same as text.substring(3, 9)
  const str_8 = text.substring(9, 3);
  expect(str_7).toBe("");
  expect(str_8).toBe(" said ");
});

test("String#indexOf/String#lastIndexOf", () => {
  const text = "You said good-bye and I said hello.";
  const index_1 = text.indexOf("said");
  const index_2 = text.lastIndexOf("said");
  expect(index_1).toBe(4);
  expect(index_2).toBe(24);
});

test("String#startsWith/String#endsWith/String#includes/RegExp#test", () => {
  const text = "You said good-bye and I said hello.";
  const result_1 = text.startsWith("You said");
  const result_2 = /^You said/.test(text);
  const result_3 = text.startsWith("I said");
  const result_4 = /^I said/.test(text);
  expect(result_1).toBe(true);
  expect(result_2).toBe(true);
  expect(result_3).toBe(false);
  expect(result_4).toBe(false);
  const result_5 = text.endsWith("hello.");
  const result_6 = /hello.$/.test(text);
  const result_7 = text.endsWith("good-bye.");
  const result_8 = /good-bye.$/.test(text);
  expect(result_5).toBe(true);
  expect(result_6).toBe(true);
  expect(result_7).toBe(false);
  expect(result_8).toBe(false);
  const result_9  = text.includes("You");
  const result_10 = /You/.test(text);
  const result_11 = text.includes("I");
  const result_12 = /I/.test(text);
  expect(result_9).toBe(true);
  expect(result_10).toBe(true);
  expect(result_11).toBe(true);
  expect(result_12).toBe(true);
});

test("getBaseURL", () => {
  const url  = "https://example.com?param=1";
  const host = getBaseURL(url);
  expect(host).toBe("https://example.com");
});

test("getURLQueryString", () => {
  const url = "https://example.com?param=1";
  const querystr = getURLQueryString(url);
  expect(querystr).toBe("param=1");
});

// Regular expression
test("getIndexInSearch", () => {
  const text    = "ABC123EFG";
  const pattern = /\d{3}/;
  const index   = getIndexInSearch(text, pattern);
  expect(index).toBe(3);
});

test("getIndexInMatch", () => {
  const text_1 = "ABC123EFG";
  const pattern_1 = /[a-zA-Z]+/;
  const pattern_2 = /[a-zA-Z]+/g;
  const result_1  = getIndexInMatch(text_1, pattern_1);
  const result_2  = getIndexInMatch(text_1, pattern_2);
  expect(`"${result_1[0]}", index: ${result_1.index}, input: "${result_1.input}", groups: "${result_1.groups}"`).toBe('"ABC", index: 0, input: "ABC123EFG", groups: "undefined"');
  expect(result_2).toStrictEqual(["ABC", "EFG"]);
  // Capture
  const text_2 = "ECMAScript 6";
  const pattern_3 = /ECMAScript (\d+)/;
  const result_3  = getIndexInMatch(text_2, pattern_3);
  expect(`"${result_3[0]}", ${result_3[1]}, index: ${result_3.index}, input: "${result_3.input}", groups: "${result_3.groups}"`).toBe('"ECMAScript 6", 6, index: 0, input: "ECMAScript 6", groups: "undefined"');
});

test("getIndexInMatchAll", () => {
  const text_1 = "ABC123EFG";
  const pattern_1 = /[a-zA-Z]+/g;
  const info_1 = getIndexInMatchAll(text_1, pattern_1);
  expect(info_1).toStrictEqual([
    '"ABC", undefined, index: 0, input: "ABC123EFG", groups: undefined',
    '"EFG", undefined, index: 6, input: "ABC123EFG", groups: undefined'
  ]);
  // Capture
  const text_2 = "ES2015、ES2016、ES2017";
  const pattern_2 = /ES(\d+)/g;
  const info_2 = getIndexInMatchAll(text_2, pattern_2);
  expect(info_2).toStrictEqual([
    '"ES2015", 2015, index: 0, input: "ES2015、ES2016、ES2017", groups: undefined',
    '"ES2016", 2016, index: 7, input: "ES2015、ES2016、ES2017", groups: undefined',
    '"ES2017", 2017, index: 14, input: "ES2015、ES2016、ES2017", groups: undefined'
  ]);
});

test("replaceString", () => {
  const text = "HogeHogeFooBarPiyoHoge";
  const pattern_1 = "Hoge";
  const pattern_2 = /Hoge/;
  const pattern_3 = /Hoge/g;
  const altChar1 = "";
  const newText1 = replaceString(text, pattern_1, altChar1);
  const newText2 = replaceString(text, pattern_2, altChar1);
  const newText3 = replaceString(text, pattern_3, altChar1);
  expect(newText1).toBe("HogeFooBarPiyoHoge");
  expect(newText2).toBe("HogeFooBarPiyoHoge");
  expect(newText3).toBe("FooBarPiyo");
  const jaDate    = "2020-03-22";
  const pattern_4 = /(\d{4})-(\d{2})-(\d{2})/;
  const altChar2  = convertToEnDate;
  const enDate    = replaceString(jaDate, pattern_4, altChar2);
  expect(enDate).toBe("22 Mar 2020");
});
