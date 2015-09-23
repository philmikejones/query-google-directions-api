#!/bin/bash

# 1. Replace 'insert_api_key_here' with your api key
# 2. Batch input_xxxx.csv files in to rows of 2,500 (or a factor of 2,500)
#    You can use more if you enable billing
# 3. Place input_xxxx.csv files in Scheduled/
# 4. Dropbox stops to prevent syncing errors while file is still being written
# 5. Batch calls into days (2,500 calls per day; 2,500 rows per file)
# 6. Construct URL as per Google Maps Directions API documentation:
#    https://developers.google.com/maps/documentation/directions/intro
# 7. Quotas reset midnight PST so set sleep delays accordingly
# 8. JSON output written to json/

# Day 1
dropbox stop
sed 1d Scheduled/input_one_a.csv |  # 'skips' the first row containing headers
while IFS=, read student origin destination O_lat O_long D_lat D_long
do
	curl "https://maps.googleapis.com/maps/api/directions/json?origin=$O_lat,$O_long&destination=$D_lat,$D_long&mode=transit&transit_routing_preference=fewer_transfers&arrival_time=1441612800&key=insert_api_key_here";
	sleep 0.5  # 2 calls per second
done > json/output_one_a.json
dropbox start

sleep 84600  # About 24 hours. Set this to start just after midnight PST

# Day 2
dropbox stop
sed 1d Scheduled/input_two.csv |
while IFS=, read student origin destination O_lat O_long D_lat D_long
do
	curl "https://maps.googleapis.com/maps/api/directions/json?origin=$O_lat,$O_long&destination=$D_lat,$D_long&mode=transit&transit_routing_preference=fewer_transfers&arrival_time=1441612800&key=insert_api_key_here";
	sleep 0.5
done > json/output_three.json
dropbox start

sleep 84600  # About 24 hours

# Day 3
dropbox stop
sed 1d Scheduled/input_five.csv |
while IFS=, read student origin destination O_lat O_long D_lat D_long
do
	curl "https://maps.googleapis.com/maps/api/directions/json?origin=$O_lat,$O_long&destination=$D_lat,$D_long&mode=transit&transit_routing_preference=fewer_transfers&arrival_time=1441612800&key=insert_api_key_here";
	sleep 0.5
done > json/output_five.json
dropbox start
