#!/usr/bin/env bash

# Paul Friederichsen

# Exit with error message if there are not 3 arguments provided
if [[ $# -ne 3 ]]; then
	echo "Error: You must provide 3 arguments, $# provided" 
	exit 1
fi

CONTENTS="$1" # The contents to be put between the header and footer
SPECIFIER="$2" # The name to be prepended to _header.html and _footer.html that will be put on either end of CONTENTS
RESULT="$3" # The file to put the result in

cat "$SPECIFIER"_header.html "$CONTENTS" "$SPECIFIER"_footer.html > "$RESULT"