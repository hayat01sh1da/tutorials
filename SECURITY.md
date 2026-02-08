# Security Policy

## Supported Versions

- Each tutorial track (Ruby on Rails, Python, JavaScript/TypeScript, React,
  Vue) is supported only on the latest `master` content.
- Archived lessons or historical commits are not patched once superseded.

## Ecosystem & Compatibility

| Track / Component        | Version(s) / Tooling                 | Notes |
| ------------------------ | ----------------------------------- | ----- |
| OS baseline              | WSL (Ubuntu 24.04.3 LTS)            | Shared environment across tracks. |
| Ruby / Rails content     | Ruby 4.0.1 (`.ruby-version`)        | Rails subprojects rely on Bundler; check each subfolder for gem specs. |
| Python content           | CPython 3.14.3 (`.python-version`)  | Install per-track requirements as documented. |
| JavaScript/TypeScript    | Node v25.6.0 (`.node-version`)      | Frontend tracks (React/Vue/TS/JS) use Node tooling plus per-project `package.json`. |

## Backward Compatibility

- Each track promises stability within the same major runtime (Ruby 4.0.x, Python 3.14.x, Node 25.x). If breaking curriculum updates are required, the README of the affected lesson will describe the migration.
- Deprecated tutorials remain available for reference but do not receive fixes. Upgrade to the latest commit before reporting issues.

## Reporting a Vulnerability

Please disclose issues privately via GitHub’s **Security → Report a vulnerability** workflow, including the track, lesson, reproduction steps, and dependency versions. Expect acknowledgement within **3 business days** and status updates every **7 business days** until
resolution.
