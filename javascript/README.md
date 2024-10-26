## 1. Environment

- node v23.1.0
- node 10.9.0

## 2. Reference

- [JavaScript Primer](https://jsprimer.net/)
- [JavaScriptでも単体テストを導入しよう！ってかテストって何？](https://sbfl.net/blog/2019/01/20/javascript-unittest/)
- [JEST > Using Matchers](https://jestjs.io/docs/using-matchers)
  - [Timer Mocks](https://jestjs.io/docs/timer-mocks)

## 3. JEST install for Unit Test

### 3-1. Build a Node.js project

```bash
$ npm init
```

You will be asked some questions, but just keep tapping "Enter" key.

### 3-2. Install required packages

```bash
$ npm install --save-dev jest babel-jest babel-core @babel/core @babel/preset-env
```

### 3-3. Install a plugin with babel to convert JEST to CommonJS

```bash
$ npm install --save-dev jest babel-jest
```

### 3-4. Run a unittest

To execute all unit tests, run `npx jest`.

```bash
$ npx jest
 PASS  __tests__/hello.test.js (24.047 s)
  ✓ Hello (3 ms)

Test Suites: 1 passed, 1 total
Tests:       1 passed, 1 total
Snapshots:   0 total
Time:        48.781 s
Ran all test suites.
```

---

To execute a unit test, run `npx jest ./__test__/{filename}_test.js`.

```bash
$ npx jest ./basic/__tests__/hello_test.js
PASS  basic/__tests__/hello_test.js (15.283 s)
 ✓ hello (2 ms)

Test Suites: 1 passed, 1 total
Tests:       1 passed, 1 total
Snapshots:   0 total
Time:        38.076 s
Ran all test suites matching /basic\/__tests__\/hello_test.js/i.
```

## 4. Ajax

To setup a local server, run the following command and access `http://localhost:3000`.
\- To use another port, assign one with `--port [port]` option.

```bash
$ cd ajax
$ npx @js-primer/local-server
```

## 5. Node.js

### 5-1. Setup local server
To setup a local server, run the following command and access `http://localhost:3000`.
\- To use another port, assign one with `--port [port]` option.

```bash
$ cd nodejs
$ npx @js-primer/local-server
```

### 5-2. Unit test

To execute unit tests, run the following command.

```bash
$ npm test
```

## 6. Todo App

### 6-1. Setup local server
To setup a local server, run the following command and access `http://localhost:3000`.
\- To use another port, assign one with `--port [port]` option.

```bash
$ cd todo_app
$ npx @js-primer/local-server
```
