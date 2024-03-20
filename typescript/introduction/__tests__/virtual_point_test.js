"use strict;"

import { logPoint } from "../lib/log_point";
import { VirtualPoint } from "../lib/virtual_point";

test("VirtualPoint", () => {
  const newVPoint = new VirtualPoint(13, 56);
  expect(logPoint(newVPoint)).toStrictEqual([13, 56]);
})
