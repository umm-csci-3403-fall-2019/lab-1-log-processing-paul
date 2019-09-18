#!/usr/bin/env bash

# Inserts the header into country_dist.html
cat html_components/country_dist_header.html > "${1}"/country_dist.html

# First this goes through the country to IP map and sets it up and then it goes through all the failed_login_data.txt files and replaces the IPs with country codes
# Then it gets the unique country codes and their number of occurrences and creates the addRow lines for the number of failed logins for each country code and inserts them into country_dist.html
awk 'FNR==NR{a[$1]=$2;next} {for (i in a)sub(i, a[i]); print $5}' etc/country_IP_map.txt "${1}"/*/failed_login_data.txt | sort | uniq -c | awk 'match($0, /([0-9]+) ([A-Za-z]+)/, groups) {print "data.addRow([\x27" groups[2] "\x27, " groups[1] "]);"}' >> "${1}"/country_dist.html

# Inserts the footer into country_dist.html
cat html_components/country_dist_footer.html >> "${1}"/country_dist.html