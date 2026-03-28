#!/usr/bin/env bash

MODE="$1"
COMMIT_MSG="$2"
Q1="$3"
Q2="$4"
Q3="$5"

REPO_ROOT="$(git rev-parse --show-toplevel)"
CHANGELOG="$REPO_ROOT/CHANGELOG.md"

DATE="$(date +'%Y-%m-%d %H:%M')"

if [ "$MODE" = "auto" ]; then
  ENTRY="### $COMMIT_MSG — $DATE

- Mise à jour automatique générée par le hook commit-msg.
"
else
  ENTRY="### $COMMIT_MSG — $DATE

**Changements apportés :**
$Q1

**Effet immédiat :**
$Q2

**Travail à venir :**
$Q3
"
fi

echo "$ENTRY" >> "$CHANGELOG"

exit 0
