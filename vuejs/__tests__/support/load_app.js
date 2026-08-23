"use strict;"

const fs = require("fs");
const path = require("path");
const Vue = require("vue");

const APP_ROOT = path.resolve(__dirname, "../..");

// index.html pulls Vue from a CDN and then loads these four plain <script>
// tags into one shared scope, so that main.js can declare `app` and the three
// component files can register themselves on it. None of them is a module, so
// none of them can be `require`d. Instead they are concatenated in the same
// order index.html lists them and evaluated as a single function body, which
// reproduces the one property the application depends on: all four files
// seeing the same `app` binding.
const SCRIPTS = [
  "main.js",
  "components/ProductDisplay.js",
  "components/ReviewForm.js",
  "components/ReviewList.js"
];

const read = (script) => fs.readFileSync(path.join(APP_ROOT, script), "utf8");

let loaded = null;

const loadApp = () => {
  if (loaded) {
    return loaded;
  }

  const capture = {};
  const VueStub = {
    ...Vue,
    createApp(options) {
      // main.js keeps its root options to itself, so they are captured on the
      // way past in order to unit-test the root data and methods.
      capture.rootOptions = options;
      return Vue.createApp(options);
    }
  };

  const source = `${SCRIPTS.map(read).join("\n;\n")}\n;\nreturn app;`;
  const app = new Function("Vue", source)(VueStub);

  loaded = { app, rootOptions: capture.rootOptions };
  return loaded;
};

// `app.component(name)` called with a single argument returns the registered
// definition, which is the public way back to what each file registered.
const component = (name) => loadApp().app.component(name);

const rootOptions = () => loadApp().rootOptions;

// Every component template refers to the other two by their global names, so
// tests mount them with the whole registry available.
const globalComponents = () => ({
  "product-display": component("product-display"),
  "review-form": component("review-form"),
  "review-list": component("review-list")
});

module.exports = { APP_ROOT, SCRIPTS, loadApp, component, rootOptions, globalComponents };
