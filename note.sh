#!/usr/bin/env bash

# Script interactif pour préparer une note de changelog
# Compatible Windows + Git Bash

set -e

REPO_ROOT="$(git rev-parse --show-toplevel)"
NOTE_FILE="$REPO_ROOT/.git/.note"

echo "=== Création d'une note pour le CHANGELOG ==="
echo ""

read -p "1. Quels changements avez-vous apportés ? " Q1
read -p "2. Quel est l'effet immédiat sur le dépôt ? " Q2
read -p "3. Quelle mise à jour prévoyez-vous ensuite ? " Q3

# IMPORTANT : toutes les valeurs sont entre guillemets
echo "type=\"manual\"" > "$NOTE_FILE"
echo "q1=\"$Q1\"" >> "$NOTE_FILE"
echo "q2=\"$Q2\"" >> "$NOTE_FILE"
echo "q3=\"$Q3\"" >> "$NOTE_FILE"

echo ""
echo "Votre note a été enregistrée."
echo "Elle sera automatiquement intégrée au CHANGELOG lors du prochain commit."
