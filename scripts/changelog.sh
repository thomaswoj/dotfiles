#!/usr/bin/env bash

# Scaffold a changelog .md file
# Usage: ./changelog.sh "#1234 My Ticket"
# or: ./changelog.sh --jira (This will get the ticket details from the current branch name)
# Creates: /CHANGELOG/SJP-1234.md

GREEN='\033[0;32m'

mkdir -p CHANGELOG
touch -a CHANGELOG/.gitkeep

if [ "$1" == "--jira" ]; then
    # Parse the current branch name
    BRANCH_NAME=$(git symbolic-ref --short HEAD)

    # Extract the ticket ID from the branch name
    TICKET_PREFIX=$(echo "$BRANCH_NAME" | cut -d'-' -f1)
    TICKET_NUMBER=$(echo "$BRANCH_NAME" | cut -d'-' -f2)
    TICKETID="${TICKET_PREFIX}-${TICKET_NUMBER}"

    # Extract the description from the branch name and convert it to title case
    DESCRIPTION=$(echo "$BRANCH_NAME" | cut -d'-' -f3- | tr '-' ' ' | awk '{ for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) tolower(substr($i,2)); }1')

    # Set the title for the changelog
    TITLE="${TICKETID} - ${DESCRIPTION}"

    # Use the Jira link format
    LINK="https://myclevergroup.atlassian.net/browse/${TICKETID}"
else
    TITLE="$1"
    TICKETID=$(echo "$TITLE" | grep -o -E '[0-9]+' | head -1)
    LINK="https://tickets.digitalbalance.co.uk/ticket/${TICKETID}"

    # Ensure ticket description in the title is in the desired title case format
    TICKET_DESC=$(echo "${TITLE}" | cut -d'-' -f2- | awk '{ for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) tolower(substr($i,2)); }1')
    TITLE="${TICKETID} - ${TICKET_DESC}"
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
