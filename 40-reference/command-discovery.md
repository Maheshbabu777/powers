# Command discovery

Use fast local discovery before guessing project commands.

Search commands:

```text
rg --files
rg "script-name-or-symbol"
rg "\"scripts\"" package.json
rg "pytest|jest|vitest|playwright|ruff|eslint|tsc|cargo test|go test"
```

Inspect likely command sources:

- `package.json`
- `Makefile`
- `pyproject.toml`
- `pytest.ini`
- `tox.ini`
- `Cargo.toml`
- `go.mod`
- CI workflow files
- project-specific agent docs

Prefer the smallest relevant check first, then expand by risk and impact.

