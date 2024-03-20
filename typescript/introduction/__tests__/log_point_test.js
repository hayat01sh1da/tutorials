"use strict;"

import {
  logPoint
} from "../lib/log_point";

test("logPoint", () => {
  const point_1 = { x: 12, y: 26 };
  const point_2 = { x: 12, y: 26, z: 89 };
  const rect = { x: 33, y: 3, width: 30, height: 80 };
  expect(logPoint(point_1)).toStrictEqual([12, 26]);
  expect(logPoint(point_2)).toStrictEqual([12, 26]);
  expect(logPoint(rect)).toStrictEqual([33, 3]);
})
