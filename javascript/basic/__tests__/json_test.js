"use strict;"

import {
  parseJSON,
  stringifyObject
} from "../src/json";


test("parseJSON", () => {
  const json_1 = '{ "id": 1, "name": "Oasist" }';
  const json_2 = '["Foo", "Bar", "Piyo", "Hoge"]';
  const obj_1  = parseJSON(json_1);
  const obj_2  = parseJSON(json_2);
  expect(obj_1).toStrictEqual({ id: 1, name: "Oasist" })
  expect(obj_2).toStrictEqual(["Foo", "Bar", "Piyo", "Hoge"])
  // Exception
  const text  = "FooBarPiyoHoge";
  const error = parseJSON(text);
  expect(error).toStrictEqual("Unexpected token 'F', \"FooBarPiyoHoge\" is not valid JSON")
})

test("stringifyObject", () => {
  const obj_1  = { id: 1, name: "Oasist", age: null };
  const json_1 = stringifyObject(obj_1);
  expect(json_1).toStrictEqual('{\n  "id": 1,\n  "name": "Oasist"\n}')
  // Value is a fcuntion
  const obj_2  = { x: () => {} };
  const json_2 = stringifyObject(obj_2);
  expect(json_2).toStrictEqual('{}');
  // Key is a symbol
  const obj_3  = { [Symbol("Foo")]: "Bar" };
  const json_3 = stringifyObject(obj_3);
  expect(json_3).toStrictEqual('{}');
  // Value is a symbol
  const obj_4  = { x: Symbol("Foo") };
  const json_4 = stringifyObject(obj_4);
  expect(json_4).toStrictEqual('{}');
  // Value is undefined
  const obj_5  = { x: undefined };
  const json_5 = stringifyObject(obj_5);
  expect(json_5).toStrictEqual('{}');
  // Value is an array
  const obj_6  = { x: ["Foo", "Bar", () => {}] };
  const json_6 = stringifyObject(obj_6);
  expect(json_6).toStrictEqual(
    '{\n  "x": [\n    "Foo",\n    "Bar",\n    null\n  ]\n}'
  );
  // Value is RegExp
  const obj_7  = { x: /Foo/ };
  const json_7 = stringifyObject(obj_7);
  expect(json_7).toStrictEqual('{\n  "x": {}\n}');
  // Value is Map
  const map = new Map([["Foo", "Bar"]]);
  const obj_8  = { x: map };
  const json_8 = stringifyObject(obj_8);
  expect(json_8).toStrictEqual('{\n  "x": {}\n}');
  // Exception
  const obj_9  = { foo: "foo" };
  obj_9.self = obj_9;
  const error = stringifyObject(obj_9);
  expect(error).toBe(
    "Converting circular structure to JSON\n    --> starting at object with constructor 'Object'\n    --- property 'self' closes the circle"
  );
  // toJSON serialise
  const obj_10 = {
    foo: "foo",
    toJSON() {
      return "bar";
    }
  };
  const json_10 = stringifyObject(obj_10);
  const json_11 = stringifyObject({ x: obj_10 });
  expect(json_10).toStrictEqual('"bar"');
  expect(json_11).toStrictEqual('{\n  "x": "bar"\n}');
})
