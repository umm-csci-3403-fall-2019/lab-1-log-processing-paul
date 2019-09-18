#!/usr/bin/env bash

# Inserts the header into hours_dist.html
cat html_components/hours_dist_header.html > "${1}"/hours_dist.html

# Looks at all the failed_login_data.txt files and grabs just the hours
# Then gets a list of the unique hours and their number of occurrences and creates the addRow lines with the number of failed logins for each hour and inserts them into hours_dist.html
awk '{ print $3 }' "${1}"/*/failed_login_data.txt | sort | uniq -c | awk 'match($0, /([0-9]+) ([0-9]+)/, groups) {print "data.addRow([\x27" groups[2] "\x27, " groups[1] "]);"}' >> "${1}"/hours_dist.html

# Inserts the footer into hours_dist.html
cat html_components/hours_dist_footer.html >> "${1}"/hours_dist.html