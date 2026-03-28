#!/usr/bin/env bash
# Met à jour CHANGELOG.md avec une entrée manuelle ou automatique
# Usage : update_changelog.sh MODE COMMIT_MSG Q1 Q2 Q3

set -e

MODE="$1"          # "manual" ou "auto"
COMMIT_MSG="$2"
Q1="$3"
Q2="$4"
Q3="$5"

REPO_ROOT="$(git rev-parse --show-toplevel)"
CHANGELOG="$REPO_ROOT/CHANGELOG.md"
TMP_FILE="$(mktemp)"

DATE_STR="$(date +"%Y-%m-%d %H:%M:%S")"

# Si le fichier n’existe pas encore, créer un squelette
if [ ! -f "$CHANGELOG" ]; then
  cat > "$CHANGELOG" <<EOF
# CHANGELOG

## Table des matières

*(Les mises à jour automatiques ne sont pas listées ici.)*

EOF
fi

# Génération du bloc de mise à jour
if [ "$MODE" = "manual" ]; then
  ENTRY_TITLE="$COMMIT_MSG"
  cat > "$TMP_FILE" <<EOF

## $ENTRY_TITLE
### Date : $DATE_STR

### 1. Changement apporté
$Q1

### 2. Effet immédiat sur le dépôt
$Q2

### 3. Mise à jour à venir
$Q3

EOF

  # Génération d’un ID d’ancre simple à partir du titre
  ANCHOR="$(echo "$ENTRY_TITLE" | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g' | sed 's/[^a-z0-9\-]//g')"

  # Insérer l’entrée en haut (après la table des matières)
  awk -v entry="$(cat "$TMP_FILE")" -v title="$ENTRY_TITLE" -v anchor="$ANCHOR" '
    BEGIN { inserted=0 }
    /^## Table des matières/ {
      print $0
      print ""
      print "- [" title " — " strftime("%Y-%m-%d %H:%M:%S") "](#" anchor ")"
      next
    }
    {
      if (!inserted && $0 !~ /^## Table des matières/) {
        print entry
        inserted=1
      }
      print $0
    }
  ' "$CHANGELOG" > "${CHANGELOG}.new"

  mv "${CHANGELOG}.new" "$CHANGELOG"

else
  # MODE = auto : entrée simple, non ajoutée à la table des matières
  cat > "$TMP_FILE" <<EOF

## Mise à jour automatique — $DATE_STR

Mise à jour effectuée au dépôt.  
Commit : \`$COMMIT_MSG\`  
Une nouvelle release a été mise à jour.

EOF

  # Insérer en haut (après la table des matières) sans modifier la TOC
  awk -v entry="$(cat "$TMP_FILE")" '
    BEGIN { inserted=0 }
    /^## Table des matières/ {
      print $0
      next
    }
    {
      if (!inserted && $0 !~ /^## Table des matières/) {
        print entry
        inserted=1
      }
      print $0
    }
  ' "$CHANGELOG" > "${CHANGELOG}.new"

  mv "${CHANGELOG}.new" "$CHANGELOG"
fi

rm -f "$TMP_FILE"
