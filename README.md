# Query Goolge Maps Directions API

## Purpose
This repository sends queries to the Google Maps Directions API and returns directions results in `json` format. There are some example `jq` filters to parse the `json` results. The scripts use bash so you need a \*nix machine with bash or [cygwin](https://www.cygwin.com/) for Windows.

## Instructions
1. You need a Google Maps Directions API key. Instructions from [Google Developers](https://developers.google.com/maps/documentation/directions/get-api-key).
2. Add your key to the file `0-query-api.sh` where instructed.
3. It's best if you can geocode (i.e. convert postcodes/address to long/lat co-ordinates) your origin and destinations beforehand. Options to do this include [GeoConvert](http://geoconvert.mimas.ac.uk/) (now free, UK only) and Google's own [Maps Geocoding API](https://developers.google.com/maps/documentation/geocoding/intro).
4. Enter your coordinates into a csv file saved in Scheduled/. An example is provided in the correct format. Make sure your csv file uses \*nix line endings. The easiest way to do this in Windows is to use [LibreOffice Calc](https://www.libreoffice.org/download/libreoffice-fresh/) rather than Microsoft Excel.
5. Make `0-query-api.sh` executable (`chmod u+x 0-query-api.sh`) and run it (`./0-query-api.sh`). I strongly suggest testing with just a few cases first - or use the example provided - to get a feel for what's happening and check for errors; you only get 2,500 queries/day with a free account.
6. The results are returned in `json` format which you can read as plain text and optionally parse with `jq`.

## Compliance with Google Terms of Service
It is your responsibility to ensure you're compliant with the Google terms of service. You should be ok to just provide a map that uses your API key (you can set up a [Google Sites page](https://sites.google.com/) with your Google account, or a [Wordpress.com](https://wordpress.com/) account, both of which are free) but I'm not a lawyer so I suggest you read the [Google Maps Directions API terms of service](https://developers.google.com/maps/terms#section_10) before commencing.

## License
Copyright 2015 Phil Mike Jones. Licensed under MIT License.

It's really only a simple script so it's hardly worth a formal license, so I've used MIT to be as permissive for you as possible.
