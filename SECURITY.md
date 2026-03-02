## Supported Versions

- Only the `master` branch shell scripts are supported. Re-run scripts from the latest commit before reporting issues.
- Scripts executed with shells other than GNU Bash 5.0.x are out of scope unless the issue reproduces with the documented environment.

## Ecosystem & Compatibility

| Component        | Version(s) / Tooling                  | Notes |
| ---------------- | ------------------------------------- | ----- |
| OS baseline      | WSL (Ubuntu 24.04.3 LTS)              | Mirrors the environment documented in the README. |
| Shell runtime    | GNU Bash 5.0.17(1)-release            | `bash` is required; `sh` is unsupported for several scripts. |
| External tools   | Core GNU utilities (`sed`, `awk`, etc.) | Dependencies are noted inline within each script. |

## Backward Compatibility

- Scripts aim to remain compatible with GNU Bash 5.0.x. If newer Bash features are introduced, the release notes will document the minimum version bump.
- POSIX `sh` and older Bash 4.x releases are not tested and will not receive fixes.

## Reporting a Vulnerability

Please report issues privately via **GitHub Security Advisory** (preferred) — open through the repository’s **Security → Report a vulnerability** workflow.

Acknowledgement occurs and status updates follow as soon as possible.  
After remediation we publish guidance alongside required dependency updates.
