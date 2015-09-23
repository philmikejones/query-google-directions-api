# Query Goolge Maps Directions API

## Purpose
This repository sends queries to the Google Maps Directions API and returns directions results in json format. You can optionally use `jq` to filter the json results. The scripts use bash so you need a *nix machine with bash or [cygwin](https://www.cygwin.com/) for Windows.

## Instructions
1. You need a Google Maps Directions API key. Instructions from [Google Developers](https://developers.google.com/maps/documentation/directions/get-api-key).
2. Add your key to the file `0-query-api.sh` where instructed.
3. It's best if you can geocode (i.e. convert postcodes/address to long/lat co-ordinates) your origin and destinations beforehand. Options to do this include [GeoConvert](http://geoconvert.mimas.ac.uk/) (now free, UK only) and Google's own [Maps Geocoding API](https://developers.google.com/maps/documentation/geocoding/intro).
4. Use the coordinates to create a unique hyperlink for each origin/destination pair you want to query and save these one per line in a text file. Use *nix line endings.
5. Make `0-query-api.sh` executable (`chmod u+x 0-query-api.sh`) and run it. I strongly suggest testing with just a few cases first to get a feel for what's happening and check for errors; you only get 2,500 queries/day with a free account.
6. The results are returned in `json` format which you can read as plain text and optionally parse with `jq`.
7. To be compliant with the Google terms and conditions you should really provide an online interface using your API key. You can set up a [Google Sites page](https://sites.google.com/) with your Google account, or a [Wordpress.com](https://wordpress.com/) account, both of which are free. I'm not a lawyer so I suggest you read the [terms and conditions](https://developers.google.com/maps/terms#section_10).

## License
Copyright 2015 Phil Mike Jones. Licensed under MIT License.

It's really only a simple script so it's hardly worth a formal license, so I've used MIT to be as permissive for you as possible.
