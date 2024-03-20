"use strict;"

import {
  getDate,
  formatEnglishDate,
  getHourInUTC
} from "../src/date";

test("newDate", () => {
  const date = getDate(1136214245999);
  expect(date.toISOString()).toBe("2006-01-02T15:04:05.999Z");
  const inUTC = getDate("2006-01-02T15:04:05.999Z");
  expect(inUTC.toISOString()).toBe("2006-01-02T15:04:05.999Z");
  const dateInTokyo = new Date("2006-01-02T15:04:05.999");
  expect(dateInTokyo.toISOString()).toBe("2006-01-02T06:04:05.999Z");
  const today = new Date(2020, 2, 31, 0, 0, 0);
  expect(today.toISOString()).toBe("2020-03-30T15:00:00.000Z");
});

test("Invalid Date", () => {
  const invalidDate = new Date("Invalid Date");
  expect(isNaN(invalidDate)).toBe(true);
  expect(invalidDate.toString()).toBe("Invalid Date");
});

test("formatEnglishDate", () => {
  const date = new Date("2006-01-02T15:04:05.999");
  const enDate = formatEnglishDate(date);
  expect(enDate).toBe("02 Jan 2006");
});

test("getHourInUTC", () => {
  const date = new Date("2006-01-02T15:04:05.999");
  const hourInUTC = getHourInUTC(date);
  expect(hourInUTC).toBe("Hours in UTC: 6");
});
