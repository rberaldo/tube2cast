#!/bin/bash

# tube2cast.sh
# May 18, 2013
# Copyright 2013 Rafael Beraldo <rberaldo at cabaladada.org>

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

usage()
{
  cat << EOF
  usage: $0 [link to YouTube video] [options]

  This script downloads a video from YouTube, extracts the audio and then
  servers it on port 8000 by default.

  OPTIONS:
   -h           Show this message
   -f FORMAT    Specifies audio format
                Audio formats supported: "aac", "vorbis", "mp3", "m4a", "opus" and "wav"
   -p PORT      Specifies port on which the audio file will be served

  EXAMPLE:
   $0 http://www.youtube.com/watch?v=dQw4w9WgXcQ -f ogg -p 8080

EOF
}

# Initial variables
YT_LINK=
PORT=8000
FILETYPE="vorbis"

# Parse command line options
while getopts "hf:p:" OPTION
do
  case $OPTION in
    h)
      # Show help message
      usage
      exit 1
      ;;
    f)
      # Change filetype
      FILETYPE=$OPTARG
      ;;
    p)
      # Change default port
      PORT=$OPTARG
      ;;
  esac
done

# if user didn't specify a YouTube link, show usage
if [ -z "$1" ]
then
  usage
  exit 1
else
  mkdir /tmp/tube2cast

  # use youtube-dl to download the video and convert to audio. The -f options
  # specifies lower, common formats to download. I don't want a 300mb file
  # downloading to my system. See
  # http://en.wikipedia.org/wiki/YouTube#Quality_and_codecs for a table of
  # formats.
  youtube-dl -x --audio-format $FILETYPE -o "/tmp/tube2cast/tube2cast.%(ext)s" -f 43/34/18/5/35/44 $1

  # cd to tube2cast directory and serve
  cd /tmp/tube2cast/
  python3 -m http.server $PORT
  # I tried using while true ; do cat /tmp/tube2cast.$FILETYPE | nc -l -p $PORT \
  # 2> /dev/null ; done but that simply didn't work out. I'll serve the
  # /tmp/tube2cast/ directory instead
  echo "Servering file... Press Ctrl-C to end."
fi

rm -rf /tmp/tube2cast/
exit
