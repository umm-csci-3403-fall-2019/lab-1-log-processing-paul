#!/usr/bin/env bash

#for d in "${1}"/*; do
#	BOX_NAME=$(basename "$d")
#	
#done 

#ls "${1}"/*/failed_login_data.txt

cat html_components/username_dist_header.html > "${1}"/username_dist.html

awk '{ print $4 }' "${1}"/*/failed_login_data.txt | sort | uniq -c | awk 'match($0, /([0-9]+) ([A-Za-z0-9_-]+)/, groups) {print "data.addRow([\x27" groups[2] "\x27, " groups[1] "]);"}' >> "${1}"/username_dist.html

cat html_components/username_dist_footer.html >> "${1}"/username_dist.html