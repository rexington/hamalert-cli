# Data Formats and Locations

## Config

Default config path:

```text
~/.config/hamalert/config.toml
```

Preferred config stores only the username:

```toml
username = "N0CALL"
```

When the OS keyring is unavailable, the CLI may use a legacy plaintext fallback:

```toml
username = "N0CALL"
password = "secret"
```

Do not create or print plaintext password config unless the user explicitly asks for that fallback.

## Callsign Files

`import-file` reads a text file where the first word on each non-comment line is the callsign.

```text
W1AW
K3LR friend from contest
N0CALL met at hamfest
```

Skipped lines:

```text
# comment
// comment

```

Notes after the first word are ignored.

## Backup Files

`backup` writes a JSON array of HamAlert trigger objects. A backup may include runtime fields such as `_id`, `user_id`, `matchCount`, `disabled`, `conditions`, `actions`, `comment`, and `options`.

Default backup directory:

```text
~/.local/share/hamalert/backups/
```

Use the actual path printed by `hamalert-cli backup`; platform data directories can vary.

## Profiles

Profile data lives under the platform data directory, normally:

```text
~/.local/share/hamalert/
  permanent.json
  current-profile
  profiles/
    home.json
    portable.json
```

Profile and permanent trigger files store trigger-like JSON without runtime-only IDs. Matching is based on `conditions` and `comment`; actions and options are preserved but are not part of identity matching.
