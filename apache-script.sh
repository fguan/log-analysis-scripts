#!/bin/bash

echo "Number of lines in log"
cat /var/log/apache2/access.log | wc -l

echo "Number of unique IP addresses"
cat access.log | cut -d " " -f 1 | sort -u | wc -l

echo "View the unique IP addresses"
cat access.log | cut -d " " -f 1 | sort -u

echo "Count how many times each unique IP address counted"
cat access.log | cut -d " " -f 1 | sort | uniq -c | sort -n

echo "View how fast connections are happening"
grep 192.168.1.3 access.log | cut -d " " -f 1,4 | uniq -c | sort -n

echo "View most common user-agent"
cat access.log | cut -d '"' -f 7 | sort | uniq -c | sort -n

echo "Grep each user-agent to see what it belongs to"
grep 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0;)' access.log | cut -d " " -f 1 | sort -u

echo "Find number of each reported OS"
cat access.log | cut -d "(" -f 2 | cut -d ")" -f 1 | sort | uniq -c | sort -n
