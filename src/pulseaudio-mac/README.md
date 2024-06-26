
# PulseAudioMac (pulseaudio-mac)

Installs PulseAudio into the container for mac

## Example Usage

```json
"features": {
    "ghcr.io/ain1084/dev-container-features/pulseaudio-mac:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|


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
**Adding module-switch-on-connect is optional.** This option specifies that the sink automatically switches to newly connected devices. For example, if you later connect your Bluetooth earphones, you can automatically toggle the sync. However, note that this sync does not necessarily sync with the default device specified in your macOS sound settings. Also, the settings may change depending on the connection status of your device. Therefore, we recommend that you do not use this option and instead use a device that can remain active at all times, such as a USB-Audio Adapter, and set it as the default sink.
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
  * index: 1
	    name: <Front_Left__Front_Right>
	    card: 1 <USB_SPDIF_Adapter>
    index: 2
	    name: <1__2>
	    card: 2 <Mac_mini__________________>
    index: 26
	    name: <Channel_1__Channel_2>
	    card: 26 <EV3237>
```
To set index: 2 (in this example, the Mac mini's built-in speakers) as a sink, run:
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


---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/ain1084/dev-container-features/blob/main/src/pulseaudio-mac/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
