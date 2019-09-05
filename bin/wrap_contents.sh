#!/usr/bin/env bash

# Paul Friederichsen

if [[ $# -ne 3 ]]; then
	echo "Error: You must provide 3 arguments, $# provided" 
	exit 1
fi

CONTENTS="$1"
SPECIFIER="$2"
RESULT="$3"

cat "$SPECIFIER"_header.html "$CONTENTS" "$SPECIFIER"_footer.html > "$RESULT"