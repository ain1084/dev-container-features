# Notes

A feature for playing sounds using PulseAudio inside a dev container. This feature installs PulseAudio and alsa-utils.
 Transfer the sound from inside the dev container to the host and play the sound (using PulseAudio's server/client mechanism). The socket on the server side uses /run/user/${UID}/pulse/native and connects with the dev container with bind mount.

Operation has been confirmed on Ubuntu 22.04.
