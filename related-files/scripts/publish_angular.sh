#!/bin/bash

function apply_pause() {
  read -p "$*"
}

echo "Publication des fichiers Angular sur le serveur Web local"
apply_pause "Appuyer sur la touche [Retour] pour continuer..."

# Source (so)8
so=/home/dev2607/Documents/XD01/aspnet-e08/angular08/dist/angular08/browser
# Destination (de)
de=/var/www/html/d003/aspnet-e08

rm -r $de/media
rm $de/favicon.ico
rm $de/index.html
rm $de/main*.js
rm $de/styles*.css
cp -R $so/media $de/media
cp $so/*.* $de/
sed -i 's/<base href="\/">/<base href="\/d003\/aspnet-e08\/">/g' $de/index.html
