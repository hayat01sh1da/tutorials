"use strict;"

import {
  handleError1,
  handleError2,
  handleError3,
  referenceError,
  syntaxError,
  typeError
} from "../src/error_handling";

test("handleError1", () => {
  const error = handleError1();
  expect(error instanceof ReferenceError).toBe(true);
  expect(error.message).toBe("undefinedFunction is not defined");
});

test("handleError2", () => {
  const message = handleError2();
  expect(message).toBe("This line is executed every time.");
});

test("handleError3", () => {
  const message = handleError3();
  expect(message).toBe("An exception raised!!");
});

// Built-in error object
test("referenceError", () => {
  const error = referenceError();
  expect(error instanceof ReferenceError).toBe(true);
  expect(error.name).toBe("ReferenceError");
  expect(error.message).toBe("x is not defined");
});

test("syntaxError", () => {
  const error = syntaxError();
  expect(error instanceof SyntaxError).toBe(true);
  expect(error.name).toBe("SyntaxError");
  expect(error.message).toBe("Unexpected token '!'");
});

test("typeError", () => {
  const error = typeError();
  expect(error instanceof TypeError).toBe(true);
  expect(error.name).toBe("TypeError");
  expect(error.message).toBe("obj is not a function");
});
