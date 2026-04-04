## Support Scope

- Security fixes target the latest Docker configuration on `master`.
- Custom images or diverging compose stacks are out of scope unless the issue reproduces with the documented versions below.

## Ecosystem & Compatibility

| Component         | Version(s) / Tooling        | Notes                                                                     |
| ----------------- | --------------------------- | ------------------------------------------------------------------------- |
| OS baseline       | WSL (Ubuntu 25.10)          | Shared environment across tracks.                                         |
| Container runtime | Docker 29.2.1               | Required for building the image.                                          |
| Database image    | `mysql/mysql-server:8.0.32` | Pulled via `docker-compose.yml`; includes sample schema from `setup.sql`. |
| Client tooling    | `docker-compose`, MySQL CLI | Use `docker-compose exec db mysql -u root` for local testing.             |

## Backward Compatibility

- Compose files target the MySQL 8.0.x series. We maintain backward compatibility for patch-level upgrades (8.0.x → 8.0.y). Older major versions (5.7, 5.6) are unsupported.
- Custom schema tweaks are outside the scope of this repo; if you diverge from `setup.sql`, rebase onto the latest version before requesting fixes.

## Reporting a Vulnerability

Please report issues privately via **GitHub Security Advisory** (preferred) — open through the repository’s **Security → Report a vulnerability** workflow.

Acknowledgement occurs and status updates follow as soon as possible.  
After remediation we publish guidance alongside required dependency updates.
