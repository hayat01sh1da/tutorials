"use strict;"

const { rootOptions } = require("./support/load_app");

// main.js only ever hands its options object to Vue.createApp, so the root
// data and methods are exercised directly against a freshly built state.
const freshState = () => rootOptions().data();

const call = (method, state, ...args) => rootOptions().methods[method].apply(state, args);

describe("root application options", () => {
  test("starts with an empty cart and the premium flag on", () => {
    const state = freshState();
    expect(state.cart).toStrictEqual([]);
    expect(state.premium).toBe(true);
  });

  test("exposes the source-code link rendered by the nav bar", () => {
    expect(freshState().github.url).toBe("https://github.com/hayat01sh1da/vuejs_tutorial");
  });

  test("hands out a new state object on every call", () => {
    expect(freshState()).not.toBe(freshState());
  });
});

describe("pushItems", () => {
  test("appends the id to the cart", () => {
    const state = freshState();
    call("pushItems", state, 2234);
    expect(state.cart).toStrictEqual([2234]);
  });

  test("keeps duplicates so the cart counts quantity, not distinct products", () => {
    const state = freshState();
    call("pushItems", state, 2234);
    call("pushItems", state, 2234);
    call("pushItems", state, 2235);
    expect(state.cart).toStrictEqual([2234, 2234, 2235]);
  });
});

describe("removeItems", () => {
  test("removes one occurrence of the id", () => {
    const state = freshState();
    state.cart = [2234, 2235, 2234];
    call("removeItems", state, 2234);
    expect(state.cart).toStrictEqual([2235, 2234]);
  });

  test("empties the cart when the only item is removed", () => {
    const state = freshState();
    state.cart = [2234];
    call("removeItems", state, 2234);
    expect(state.cart).toStrictEqual([]);
  });

  test("leaves an empty cart empty", () => {
    const state = freshState();
    call("removeItems", state, 2234);
    expect(state.cart).toStrictEqual([]);
  });

  // Known quirk: indexOf returns -1 for an id that is not in the cart, and
  // splice(-1, 1) counts from the end, so the last item is dropped instead.
  test("drops the last item when asked to remove an id the cart does not hold", () => {
    const state = freshState();
    state.cart = [2234, 2235];
    call("removeItems", state, 9999);
    expect(state.cart).toStrictEqual([2234]);
  });
});
