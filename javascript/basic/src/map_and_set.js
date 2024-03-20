"use strict;"

const newMap = (entry) => {
  const map = new Map(entry);
  return map;
};

const setMap = (key, val) => {
  const map = new Map();
  map.set(key, val);
  return map;
};

const getKeys = (map) => {
  const keys = [];
  for (const key of map.keys()) {
    keys.push(key);
  }
  return keys;
};

const getValues = (map) => {
  const vals = [];
  for (const val of map.values()) {
    vals.push(val);
  }
  return vals;
};

const getEntries = (map) => {
  const entries = [];
  for (const [key, val] of map) {
    entries.push(`${key}: ${val}`);
  }
  return entries;
};

const ShoppingCart = class {
  constructor() {
    this.items = new Map();
  }
  addToCart(item) {
    const count = this.items.get(item) ?? 0;
    this.items.set(item, count + 1);
  }
  getTotalPrice() {
    return Array.from(this.items).reduce((total, [item, count]) => {
      return total + item.price * count;
    }, 0);
  }
  getItemsInCart() {
    return Array.from(this.items).map(([item, count]) => {
      return `${item.name}: ${count}`;
    }).join(", ");
  }
};

const setWeakMap = (key, val) => {
  const map = new Map();
  map.set(key, val);
  return map;
};

const EventEmittter = class {
  constructor() {
    this.listenersMap = new WeakMap();
  }
  addListener(listener) {
    const listeners = this.listenersMap.get(this) ?? [];
    const newListeners = listeners.concat(listener);
    this.listenersMap.set(this, newListeners);
    return this.listenersMap;
  }
}

const newSet = (entry) => {
  const set = new Set(entry);
  return set;
};

const getSetValues = (entry) => {
  const set = new Set(entry);
  const vals = [];
  for (const val of set) {
    vals.push(val);
  }
  return vals;
};

export {
  newMap,
  setMap,
  getKeys,
  getValues,
  getEntries,
  ShoppingCart,
  setWeakMap,
  EventEmittter,
  newSet,
  getSetValues
};
