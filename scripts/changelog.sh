#!/usr/bin/env bash

# Scaffold a changelog .md file
# Usage: ./changelog.sh "#1234 My Ticket"
# or: ./changelog.sh --jira (This will get the ticket details from the current branch name)
# Creates: /CHANGELOG/1234.md

GREEN='\033[0;32m'

mkdir -p CHANGELOG
touch -a CHANGELOG/.gitkeep

if [ "$1" == "--jira" ]; then
    # Parse the current branch name
    BRANCH_NAME=$(git symbolic-ref --short HEAD)

    # Extract the ticket ID and description from the branch name
    TICKETID=$(echo "$BRANCH_NAME" | awk -F '-' '{print $1}')
    DESCRIPTION=$(echo "$BRANCH_NAME" | sed "s/$TICKETID-//g" | tr '-' ' ' | sed 's/.*/\L&/; s/[a-z]*/\u&/g')

    # Set the title for the changelog
    TITLE="${TICKETID} - ${DESCRIPTION}"

    # Use the Jira link format
    LINK="https://myclevergroup.atlassian.net/browse/${TICKETID}"
else
    TITLE="$1"
    TICKETID=$(echo "$TITLE" | grep -o -E '[0-9]+' | head -1)
    LINK="https://tickets.digitalbalance.co.uk/ticket/${TICKETID}"
fi

cat > CHANGELOG/${TICKETID}.md << EOF
#### [${TITLE}](${LINK})
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
