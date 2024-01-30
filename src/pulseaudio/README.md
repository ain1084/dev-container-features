
# PulseAudio (pulseaudio)

Installs PulseAudio into the devcontainer

## Example Usage

```json
"features": {
    "ghcr.io/ain1084/dev-container-features/pulseaudio:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|


## Notes

A feature for playing sounds using PulseAudio inside a dev container. This feature installs PulseAudio and ALSA library (libasound2-dev).
 Transfer the sound from inside the dev container to the host and play the sound (using PulseAudio's server/client mechanism). The socket on the server side uses /run/user/${UID}/pulse/native and connects with the dev container with bind mount.

In short, it is a feature that installs pulseaudio and libasound2-dev by apt-get and mounts the socket of PulseAudio.

## Limitation

This feature depends on docker's host environment. It works only on Ubuntu 22.04 x64. It **doesn't work** on WSL2 docker. In order for it to work, you need to change the PulseAudio server path. This is ${XDG_RUNTIME_DIR}/pulse/native (e.g. usually /run/user/1000/pulse/native) on Ubuntu, but /mnt/wslg/PulseServer on WSL2.

## CI Test
CI Test is removed. It always fails because the XDG_RUNTIME_DIR environment variable it references from "mounts" is not set.

## Additional information
### Use from Rust
For example, if you use the Rust image (mcr.microsoft.com/devcontainers/rust), you can use libpulse-binding by doing a cargo add.

```
cargo init
cargo add libpulse-binding libpulse-simple-binding
```

Also, [CPAL](https://github.com/RustAudio/cpal) can work.
```
cargo add cpal
```


---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/ain1084/dev-container-features/blob/main/src/pulseaudio/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
