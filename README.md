# tube2cast.sh -- listen to YouTube videos while washing the dishes

`tube2cast.sh` does only one thing: it downloads videos from YouTube (actually,
from any website that `youtube-dl` can talk to) and then serves their audio
portion over HTTP. You can then stream the audio to your smartphone or similar
device.

I wrote it because I want to be able to "watch" to talks and tutorials on
YouTube without having to deal with their app.

The script is pretty simple and depends on `python3` and `youtube-dl`. I'll be
expanding on these notes and adding features as I need them.

## Usage

By default, `tube2cast.sh` downloads a video, converts it to vorbis and serves
the file at port 8000. If that's what you need, simply run

    tube2cast.sh [link to YouTube video]

To download [this video from YouTube][rickroll], have it converted to mp3 and
served at port 8080, run:

    tube2cast.sh -f mp3 -port 8080 http://www.youtube.com/watch?v=dQw4w9WgXcQ

## Troubleshooting

* "`tube2cast.sh` is using the built-in options for port and filetype.
  * You are probably giving the YouTube link before the options. Instead, run
    `tube2cast.sh` like this: `tube2cast.sh [options] [link to YouTube video]`.


## TODO

* Implement a way of showing your local IP, for convenience. I could `grep` and
  `awk` this from `ifconfig`, but not everybody uses the same interfaces.
* Create install scripts and package for Arch Linux.
* Enjoy the script.

[rickroll]: http://www.youtube.com/watch?v=dQw4w9WgXcQ
