
# PulseAudio (pulseaudio)

Installs PulseAudio and alsa-utils into the devcontainer

## Example Usage

```json
"features": {
    "ghcr.io/ain1084/dev-container-features/pulseaudio:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|


# Notes

A feature for playing sounds using PulseAudio inside a dev container. This feature installs PulseAudio and alsa-utils.
 Transfer the sound from inside the dev container to the host and play the sound (using PulseAudio's server/client mechanism). The socket on the server side uses /run/user/${UID}/pulse/native and connects with the dev container with bind mount.

Operation has been confirmed on Ubuntu 22.04.


---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/ain1084/dev-container-features/blob/main/src/pulseaudio/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
