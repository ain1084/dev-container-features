## Notes

A feature for playing sounds using PulseAudio inside a dev container. This feature installs PulseAudio and ALSA library (libasound2-dev).
 Transfer the sound from inside the dev container to the host and play the sound (using PulseAudio's server/client mechanism). The socket on the server side uses /Users/$USER$/.config/pulse and connects with the dev container with bind mount.

In short, it is a feature that installs pulseaudio and libasound2-dev by apt-get and mounts the socket of PulseAudio.

## Prepatation

### PulseAudio installation on HOST
```
brew install pulseaudio
```

### Modifying the configuration file

Added the following line to /opt/homebrew/etc/pulse/daemon.conf
```
exit-idle-time = -1
```

Added the following line to /opt/homebrew/etc/pulse/default.pa
```
load-module module-native-protocol-tcp
load-module module-switch-on-connect
```

### Starting PulseAudio
```
brew services start pulseaudio
```

### Setting default sink

Display sink list.
```
pacmd list-sinks | grep -e 'name:' -e 'index:' -e 'card:'
```
For example, the following is displayed.
```
  * index: 0
	    name: <Channel_1__Channel_2>
	    card: 0 <EV3237>
    index: 1
	    name: <1__2>
	    card: 1 <Mac_mini__________________>
```
To set index: 1 (in this example, the Mac mini's built-in speakers) as a sink, run:
```
pactl set-default-sink 1__2
```

## CI Test
CI Test is removed. It always fails because $HOME/.config/pulse is required in HOST.

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
