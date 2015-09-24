#! /bin/bash
# Uses jq to parse output json files and extract required values
# Outputs written to Cleaned/
# Example below extracts key information about overall route

jq .routes[].legs[].start_address       json/example.json > Cleaned/example_start_address.txt &
jq .routes[].legs[].end_address         json/example.json > Cleaned/example_end_address.txt   &
jq .routes[].legs[].departure_time.text json/example.json > Cleaned/example_depart_time.txt   &
jq .routes[].legs[].arrival_time.text   json/example.json > Cleaned/example_arrival_time.txt  &
jq .routes[].legs[].distance.text       json/example.json > Cleaned/example_distance.txt      &
jq .routes[].legs[].duration.text       json/example.json > Cleaned/example_duration.txt
