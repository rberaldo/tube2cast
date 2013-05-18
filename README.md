# tube2cast.sh -- listen to YouTube videos while washing the dishes

`tube2cast.sh` does only one thing: it downloads videos from YouTube (actually,
from any website that `youtube-dl` can talk to) and then serves their audio
portion over HTTP. You can then stream the audio to your smartphone or similar
device.

I wrote it because I want to be able to "watch" to talks and tutorials on
YouTube without having to deal with their app.

The script is pretty simple and depends on `python3` and `youtube-dl`. I'll be
expanding on these notes and adding features as I need them.

## TODO

* Implement a way of showing your local IP, for convenience. I could `grep` and
  `awk` this from `ifconfig`, but not everybody uses the same interfaces.
* Create install scripts and package for Arch Linux.
* Enjoy the script.
