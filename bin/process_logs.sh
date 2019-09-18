#!/usr/bin/env bash

# Setup the temporary directory to work in
TEMP_PATH=$(mktemp --directory)

# Loop through all provided arguments ([machine name]_secure.tgz files)
for file in "$@"; do

	#Find the base computer name from the file and use that as the output to extract into
	OUTPUT_FOLDER="$TEMP_PATH"/$(basename "$file" "_secure.tgz")

	# Checks that the generated output directory doesn't already exist and untars the file into it
	if [[ ! -d "$OUTPUT_FOLDER" ]]; then
		mkdir "$OUTPUT_FOLDER"
		tar -xzf "$file" -C "$OUTPUT_FOLDER"
	fi
	
	# Run the process_client_logs script on the output folder for this file
	bin/process_client_logs.sh "$OUTPUT_FOLDER"
done

# Run each of the processing scripts on the temp path
bin/create_username_dist.sh "$TEMP_PATH"
bin/create_hours_dist.sh "$TEMP_PATH"
bin/create_country_dist.sh "$TEMP_PATH"

bin/assemble_report.sh "$TEMP_PATH"

# Move the generated summary into the path this script was run in
mv "$TEMP_PATH"/failed_login_summary.html failed_login_summary.html

# Clean up the temporary directory
rm -r "$TEMP_PATH"