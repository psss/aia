# aia

Run OpenCode in a disposable Fedora container with your current directory mounted.

## Requirements

- [Podman](https://podman.io/)

## Usage

```sh
./aia                 # start OpenCode
./aia bash            # open a shell in the container
./aia opencode run .  # run OpenCode with arguments
```

The image is built automatically on first run.

## Configuration

| Variable | Default | Description |
| --- | --- | --- |
| `OPENCODE_IMAGE` | `opencode-agent` | Image name to build/run |
| `XDG_CONFIG_HOME` | `~/.config` | Config mount base |
| `XDG_DATA_HOME` | `~/.local/share` | Data mount base |
| `XDG_STATE_HOME` | `~/.local/state` | State mount base |

API keys are forwarded from the host environment.
