#!/usr/bin/env bash
TEMP_PATH="/tmp/tmp_logs" #TODO use mktemp

if [[ ! -d "$TEMP_PATH" ]]; then
	mkdir "$TEMP_PATH"
fi

for file in "$@"; do
	OUTPUT_FOLDER="$TEMP_PATH"/$(basename "$file" "_secure.tgz")
	if [[ ! -d "$OUTPUT_FOLDER" ]]; then
		mkdir "$OUTPUT_FOLDER"
		tar -xzf "$file" -C "$OUTPUT_FOLDER"
	fi
	
	bin/process_client_logs.sh "$OUTPUT_FOLDER"
done

bin/create_username_dist.sh "$TEMP_PATH"
bin/create_hours_dist.sh "$TEMP_PATH"
bin/create_country_dist.sh "$TEMP_PATH"

bin/assemble_report.sh "$TEMP_PATH"