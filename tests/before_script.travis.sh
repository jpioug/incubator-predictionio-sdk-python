#!/bin/sh

mkdir -p predictionio-setup/bin
cd predictionio-setup
curl -o bin/pio-setup https://raw.githubusercontent.com/jpioug/predictionio-setup/master/bin/pio-setup
chmod +x bin/pio-setup

#PIO_GIT_USER=apache PIO_GIT_BRANCH=develop PIO_EVENTDATA_REFRESH=true ./bin/pio-setup deploy
PIO_EVENTDATA_REFRESH=true ./bin/pio-setup deploy
touch target/pio-setup.log
tail -f target/pio-setup.log &
./bin/pio-setup start

./bin/pio-setup status

