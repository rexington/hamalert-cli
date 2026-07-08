# Troubleshooting

## `hamalert-cli` Not Found

If inside this repository, use:

```bash
cargo run -- <command>
```

To install from the repo:

```bash
cargo install --path .
```

## Missing Config

Run:

```bash
hamalert-cli auth login
```

or use a custom config:

```bash
hamalert-cli --config-file /path/to/config.toml auth login
```

## Keyring Unavailable

Headless Linux, SSH sessions, or locked desktop keyrings may not provide a usable keyring. The CLI can fall back to a plaintext config password, but only use that path when the user explicitly accepts the security tradeoff.

## Login Failed

Check:

- Username/callsign spelling.
- Password source (`--password-stdin`, `--password-env`, or interactive prompt).
- Whether `HAMALERT_PASSWORD` or the named environment variable is set when using `--password-env`.

## Empty Import

For local files, verify the file exists and contains callsigns as the first word on non-comment lines.

For PoLo notes, verify the URL is reachable and returns the expected text content.

## Backup Location Confusion

Default backups are not written to the current directory. Use the path printed by `hamalert-cli backup`, normally under:

```text
~/.local/share/hamalert/backups/
```

## Profile Mismatch

Run:

```bash
hamalert-cli profile status
```

Use the status output to decide whether to update the recorded current profile, save current triggers as a profile, or ignore the mismatch.
