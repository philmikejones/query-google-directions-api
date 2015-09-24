#! /bin/bash

# 1. Replace 'insert_api_key_here' with your api key
# 2. Batch directions in to csv files in rows of 2,500 (or a factor of 2,500)
#    You can use more if you enable billing
# 3. Place input csv files in Scheduled/
# 4. Construct URL as per Google Maps Directions API documentation:
#    https://developers.google.com/maps/documentation/directions/intro
#    Key option is the transit mode
# 5. Quotas reset midnight PST so set sleep delays accordingly
# 6. JSON output written to json/. Set appropriate file names
# 7. If writing to a dropbox synced folder I strongly recommend stopping
#    dropbox while writing. This can be achieved with 'dropbox stop' and
#    'dropbox start' once the file is written.

# Day 1
# dropbox stop  # uncomment if writing to dropbox synced folder
sed 1d Scheduled/example.csv |  # 'skips' the first row containing headers
while IFS=, read id origin destination O_lat O_long D_lat D_long
do
	curl "https://maps.googleapis.com/maps/api/directions/json?origin=$O_lat,$O_long&destination=$D_lat,$D_long&mode=transit&key=insert_api_key_here";
	sleep 0.5  # 2 calls per second
done > json/example.json
# dropbox start  # resume syncing once file fully written

# sleep 84600  # About 24 hours. Set this to resume just after midnight PST

# # Day 2
# sed 1d Scheduled/day_two.csv |
# while IFS=, read id origin destination O_lat O_long D_lat D_long
# do
# 	curl "https://maps.googleapis.com/maps/api/directions/json?origin=$O_lat,$O_long&destination=$D_lat,$D_long&mode=transit&key=insert_api_key_here";
# 	sleep 0.5
# done > json/day_two.json
#
# sleep 84600  # About 24 hours
#
# # Day 3
# sed 1d Scheduled/day_three.csv |
# while IFS=, read id origin destination O_lat O_long D_lat D_long
# do
# 	curl "https://maps.googleapis.com/maps/api/directions/json?origin=$O_lat,$O_long&destination=$D_lat,$D_long&mode=transit&key=insert_api_key_here";
# 	sleep 0.5
# done > json/day_three.json
