## Supported Versions

- Each tutorial track (Ruby on Rails, Python, JavaScript/TypeScript, React,
  Vue) is supported only on the latest `master` content.
- Archived lessons or historical commits are not patched once superseded.

## Ecosystem & Compatibility

| Track / Component     | Version(s) / Tooling               | Notes                                                                               |
| --------------------- | ---------------------------------- | ----------------------------------------------------------------------------------- |
| OS baseline           | WSL (Ubuntu 25.10)                 | Shared environment across tracks.                                                   |
| Ruby / Rails content  | Ruby 4.0.3 (`.ruby-version`)       | Rails subprojects rely on Bundler; check each subfolder for gem specs.              |
| Python content        | CPython 3.14.4 (`.python-version`) | Install per-track requirements as documented.                                       |
| JavaScript/TypeScript | Node v25.9.0 (`.node-version`)     | Frontend tracks (React/Vue/TS/JS) use Node tooling plus per-project `package.json`. |

## Backward Compatibility

- Each track promises stability within the same major runtime (Ruby 4.0.x, Python 3.14.x, Node 25.x). If breaking curriculum updates are required, the README of the affected lesson will describe the migration.
- Deprecated tutorials remain available for reference but do not receive fixes. Upgrade to the latest commit before reporting issues.

## Reporting a Vulnerability

Please report issues privately via **GitHub Security Advisory** (preferred) — open through the repository’s **Security → Report a vulnerability** workflow.

Acknowledgement occurs and status updates follow as soon as possible.  
After remediation we publish guidance alongside required dependency updates.
