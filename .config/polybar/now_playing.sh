#!/bin/bash

function get_meta() {
    if [[ $1 = "any" ]]; then
	META=$(playerctl metadata | grep -v spotify)
    else
	META=$(playerctl metadata -p $1)
    fi;

    echo -n "$META" | grep xesam:$2 | awk '{for (i = 3; i<NF; i++) printf $i " "; print $NF}';
}

if [[ $(playerctl status -p spotify 2>&1) = "Playing" ]]; then
    NAME=$(get_meta spotify title)
    ARTIST=$(get_meta spotify artist)

    echo "%{F#E5704B}$NAME%{F-} - $ARTIST"
else
    if [[ $(playerctl status 2>&1) = "Playing" ]]; then
	NAME=$(get_meta any title)
	ARTIST=$(get_meta any artist)
    fi
fi

if [[ $NAME != "" ]] || [[ $NAME == "xesam:title" ]]; then
    if [[ $ARTIST = "xesam:artist" ]] || [[ $ARTIST = "" ]]; then
	echo "%{F#E5704B}$NAME%{F-}"
    else
	echo "%{F#E5704B}$NAME%{F-} - $ARTIST"
    fi;
else
    echo " ";
    exit 1;
fi    

