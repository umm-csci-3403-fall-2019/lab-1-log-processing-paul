#!/usr/bin/env bash

# Combines the header, country_dist, hours_dist, username_dist, and footer HTML files into the complete summary
cat html_components/summary_plots_header.html "${1}"/country_dist.html "${1}"/hours_dist.html "${1}"/username_dist.html html_components/summary_plots_footer.html > "${1}"/failed_login_summary.html