#!/bin/bash

TORRENT=$1
TYPE=$(echo -e "tv\nmovies\ntorrents" | dmenu)


scp "$TORRENT" "pontus.flaskpost.org:$TYPE"


