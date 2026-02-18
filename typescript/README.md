## 1. Environment

- WSL(Ubuntu 24.04.3 LTS)
- Node v25.6.1
- pnpm 10.26.2

## 2. Reference

- [TypeScript](https://www.typescriptlang.org/)
- [TypeScript + Node.js プロジェクトのはじめかた2020](https://qiita.com/notakaos/items/3bbd2293e2ff286d9f49)

## 3. Run TypeScript

### 3-1. tsc

`tsc` converts TypeScript to JavaScript and run the file.

```bash
$ pnpm install typescript
$ pnpm tsc --noEmit
$ node ./lib/user_account.js
=> ID: 1, Name: User1
```

### 3-2. ts-node

`ts-node` directly runs TypeScript file.

```bash
$ pnpm dlx ts-node ./lib/user_account.ts
=> ID: 1, Name: User1
```

## 4. JEST install for Unit Test

### 4-1. Build a Node.js project

```bash
$ pnpm init
```

You will be asked some questions, but just keep tapping "Enter" key.

### 4-2. Install required packages

```bash
$ pnpm install --save-dev jest babel-jest babel-core @babel/core @babel/preset-env
```

### 4-3. Install a plugin with babel to convert JEST to CommonJS

```bash
$ pnpm install --save-dev jest babel-jest
```

### 4-4. Run a unittest

To execute all unit tests, run `pnpm exec jest`.

```bash
$ pnpm exec jest
 PASS  __tests__/hello.test.js (24.047 s)
  ✓ Hello (3 ms)

Test Suites: 1 passed, 1 total
Tests:       1 passed, 1 total
Snapshots:   0 total
Time:        48.781 s
Ran all test suites.
```

---

To execuate a unittest, run `pnpm exec jest ./__test__/{filename}_test.js`.

```bash
$ pnpm exec jest ./basic/__tests__/hello_test.js
PASS  basic/__tests__/hello_test.js (15.283 s)
 ✓ hello (2 ms)

Test Suites: 1 passed, 1 total
Tests:       1 passed, 1 total
Snapshots:   0 total
Time:        38.076 s
Ran all test suites matching /basic\/__tests__\/hello_test.js/i.
```
