#!/usr/bin/env bash

# Scaffold a changelog .md file
# Usage: ./changelog.sh "#1234 My Ticket"
# Creates: /CHANGELOG/1234.md

GREEN='\033[0;32m'

mkdir -p CHANGELOG
touch -a CHANGELOG/.gitkeep

TITLE="$1"
TICKETID=$(echo "$TITLE" | grep -o -E '[0-9]+' | head -1)

cat > CHANGELOG/${TICKETID}.md << EOF
#### [${TITLE}](https://tickets.digitalbalance.co.uk/ticket/${TICKETID})
##### Fixed
-
##### Added
-
##### Changed
-
##### Optimized
-
##### Removed
-
EOF

echo -e "${GREEN}Created scaffold for ${TICKETID}.md"