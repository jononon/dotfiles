#!/bin/bash

function redir() {
key=$(curl -s -X POST -H "Content-Type:application/json"  https://us-central1-redirect-5c8c2.cloudfunctions.net/httpShortenURL -d '{"text": "'$1'"}')
echo "https://jdami.co/$key"
echo "https://jdami.co/$key" | pbcopy
}

function imsg(){
/usr/bin/osascript -e 'tell application "Messages"
        send "'"$2"'" to buddy "'"$1"'" of service "E:jj_damico@yahoo.com"
        end tell'
        echo "Sent"
}

function kbtrains(){
	curl https://us-central1-londonstatus-74ab5.cloudfunctions.net/knightsbridgeMessage
}

function sqtrains() {
	curl https://us-central1-londonstatus-74ab5.cloudfunctions.net/sloaneSquareMessage
}

function zzz() {
	pmset sleepnow
}
