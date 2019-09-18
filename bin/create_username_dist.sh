#!/usr/bin/env bash

# Inserts the header into username_dist.html
cat html_components/username_dist_header.html > "${1}"/username_dist.html

# Looks at all the failed_login_data.txt files and grabs just the usernames
# Then gets a list of the unique usernames and their number of occurrences and creates the addRow lines with the number of failed logins for each username and inserts them into username_dist.html
awk '{ print $4 }' "${1}"/*/failed_login_data.txt | sort | uniq -c | awk 'match($0, /([0-9]+) ([A-Za-z0-9_-]+)/, groups) {print "data.addRow([\x27" groups[2] "\x27, " groups[1] "]);"}' >> "${1}"/username_dist.html

# Inserts the footer into username_dist.html
cat html_components/username_dist_footer.html >> "${1}"/username_dist.html