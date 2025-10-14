#!/bin/bash

log_file="./log_file"

top_five_request=$(awk '{print $1}' "$log_file" | sort | uniq -c | sort -nr | head -5 |tr ' ' '\n')
top_five_path=$( awk '{print $7}' "$log_file" | sort | uniq -c | sort -nr | head -5 |tr ' ' '\n')
top_5_response_code=$( awk '{print $9}' "$log_file" | sort | uniq -c | sort -nr | head -5 |tr ' ' '\n')
top_5_user_agent=$(awk -F'"' '{print $6}' "$log_file" | sort | uniq -c | sort -nr | head -5 |tr ' ' '\n')

cat <<EOF

Top 5 IP addresses with the most requests:
$top_five_request

Top 5 most requested paths:
$top_five_path

Top 5 response status codes:
$top_5_response_code

Top 5 User-Agents:
$top_5_user_agent

EOF
