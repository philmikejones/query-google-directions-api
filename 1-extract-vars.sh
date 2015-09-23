#! /bin/bash
# Uses jq to parse output json files and extract required values
# It's provided as an example only
# Outputs written to Cleaned/

jq .routes[].legs[].start_address       json/output_one_a.json > Cleaned/one_a_start_address.txt &
jq .routes[].legs[].end_address         json/output_one_a.json > Cleaned/one_a_end_address.txt   &
jq .routes[].legs[].departure_time.text json/output_one_a.json > Cleaned/one_a_depart_time.txt   &
jq .routes[].legs[].arrival_time.text   json/output_one_a.json > Cleaned/one_a_arrival_time.txt  &
jq .routes[].legs[].distance.text       json/output_one_a.json > Cleaned/one_a_distance.txt      &
jq .routes[].legs[].duration.text       json/output_one_a.json > Cleaned/one_a_duration.txt
