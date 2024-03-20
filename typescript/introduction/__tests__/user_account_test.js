"use strict;"

import {
  UserAccount
} from "../lib/user_account";

test("User", () => {
  const user = new UserAccount(1, "User1");
  expect(user.id).toBe(1);
  expect(user.name).toBe("User1");
  user.id = 2;
  user.name = "User2";
  expect(user.id).toBe(2);
  expect(user.name).toBe("User2");
})
