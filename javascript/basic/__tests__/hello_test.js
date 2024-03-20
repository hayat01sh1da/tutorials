"use strict;"

import { hello } from "../src/hello";

test("hello", () => {
  const message = hello("Oasist");
  expect(message).toBe("Hello, Oasist");
});
