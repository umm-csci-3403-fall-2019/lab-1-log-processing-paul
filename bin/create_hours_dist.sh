#!/usr/bin/env bash

cat html_components/hours_dist_header.html > "${1}"/hours_dist.html

awk '{ print $3 }' "${1}"/*/failed_login_data.txt | sort | uniq -c | awk 'match($0, /([0-9]+) ([0-9]+)/, groups) {print "data.addRow([\x27" groups[2] "\x27, " groups[1] "]);"}' >> "${1}"/hours_dist.html

cat html_components/hours_dist_footer.html >> "${1}"/hours_dist.html