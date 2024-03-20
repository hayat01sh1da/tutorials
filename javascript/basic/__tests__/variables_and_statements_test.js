"use strict;"

import {
  stateConstants,
  overrideConstant,
  overrideLet,
  overrideVar
} from "../src/variables_and_statements";

test("stateConstants", () => {
  const constants = stateConstants("JavaScript Primer", "Front-end");
  const projectName     = constants[0]
  const projectCategory = constants[1]
  expect(projectName).toBe("JavaScript Primer");
  expect(projectCategory).toBe("Front-end");
});

test("overrideConstant", () => {
  expect(() => {
    overrideConstant("Foo");
  }).toThrow();
});

test("overrideLet", () => {
  const lets = overrideLet("JavaScript Primer", "Front-end");
  const projectName     = lets[0]
  const projectCategory = lets[1]
  expect(projectName).toBe("Bar");
  expect(projectCategory).toBe("Front-end");
});

test("overrideVar", () => {
  const vars = overrideVar("JavaScript Primer", "Front-end");
  const projectName     = vars[0]
  const projectCategory = vars[1]
  expect(projectName).toBe("Hoge");
  expect(projectCategory).toBe("Front-end");
});
