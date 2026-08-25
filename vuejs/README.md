## 1. Environment

- WSL (Ubuntu 25.10)
- Node v26.7.0
- pnpm 11.24.0
- Vue 3.5.41

## 2. Reference

- [Vue Mastery](https://www.vuemastery.com/courses/intro-to-vue-3/intro-to-vue3/)
- [Vue Test Utils](https://test-utils.vuejs.org/)
- [JEST > Using Matchers](https://jestjs.io/docs/using-matchers)

## 3. Unit Test

### 3-1. Install the dependencies

```bash
$ pnpm install
```

### 3-2. Run all the unit tests

```bash
$ pnpm test
 PASS  __tests__/main_test.js
 PASS  __tests__/components/review_form_test.js
 PASS  __tests__/components/review_list_test.js
 PASS  __tests__/components/product_display_test.js

Test Suites: 4 passed, 4 total
Tests:       50 passed, 50 total
Snapshots:   0 total
```

---

To execute a single unit test, run `pnpm exec jest ./__tests__/{path}_test.js`.

```bash
$ pnpm exec jest ./__tests__/components/review_list_test.js
```

### 3-3. How the components are loaded

`index.html` pulls Vue from a CDN and then loads `main.js` and the three component files as plain `<script>` tags, so they share one scope: `main.js` declares `app` and each component file registers itself on it.
None of them is a module, so none of them can be `require`d from a test.

`__tests__/support/load_app.js` reproduces that arrangement by concatenating the four files in the order `index.html` lists them and evaluating them as a single function body with `Vue` passed in.
The registered definitions are then read back with `app.component(name)` and mounted with [Vue Test Utils](https://test-utils.vuejs.org/), which keeps the application sources completely untouched by the test setup.
