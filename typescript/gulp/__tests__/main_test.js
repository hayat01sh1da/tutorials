"use strict;"

import { greet } from "../dist/greetings";
import { greetFromCompiler } from "../dist/main";

test("greetFromCompiler", () => {
  const greeting = greet(1);
  const compiler = "TypeScript";
  const message  = greetFromCompiler(greeting, compiler);
  expect(message).toBe("Hello from TypeScript!!");
})
