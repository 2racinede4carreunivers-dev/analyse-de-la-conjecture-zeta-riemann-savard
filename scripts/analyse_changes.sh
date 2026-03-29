#!/usr/bin/env bash

# ---------------------------------------------------------
# analyse_changes.sh
# Analyse automatique des changements (LaTeX + Isabelle/HOL)
# ---------------------------------------------------------

set -e

# Trouver le dernier tag
LAST_TAG=$(git describe --tags --abbrev=0 2>/dev/null || echo "")

if [ -z "$LAST_TAG" ]; then
    echo "Aucun tag précédent — analyse des changements impossible."
    echo "Cette release constitue la première version du projet."
    exit 0
fi

echo "Analyse des changements depuis : $LAST_TAG"
echo ""

# Liste des fichiers modifiés
CHANGED_FILES=$(git diff --name-only "$LAST_TAG"..HEAD)

if [ -z "$CHANGED_FILES" ]; then
    echo "Aucun changement détecté depuis la version précédente."
    exit 0
fi

# Catégorisation
TEX_FILES=$(echo "$CHANGED_FILES" | grep '\.tex$' || true)
THY_FILES=$(echo "$CHANGED_FILES" | grep '\.thy$' || true)
PDF_FILES=$(echo "$CHANGED_FILES" | grep '\.pdf$' || true)

echo "Fichiers modifiés :"
echo "$CHANGED_FILES"
echo ""

# ------------------------------
# Analyse des fichiers LaTeX
# ------------------------------
if [ -n "$TEX_FILES" ]; then
    echo "Modifications LaTeX détectées :"
    for f in $TEX_FILES; do
        echo "- $f"

        # Extraire les sections modifiées
        SECTIONS=$(git diff "$LAST_TAG"..HEAD -- "$f" | grep '\\section' || true)
        if [ -n "$SECTIONS" ]; then
            echo "  Sections modifiées :"
            echo "$SECTIONS" | sed 's/^/    • /'
        fi
    done
    echo ""
fi

# ------------------------------
# Analyse des fichiers Isabelle/HOL
# ------------------------------
if [ -n "$THY_FILES" ]; then
    echo "Modifications Isabelle/HOL détectées :"
    for f in $THY_FILES; do
        echo "- $f"

        # Extraire les lemmes / théorèmes modifiés
        LEMMAS=$(git diff "$LAST_TAG"..HEAD -- "$f" | grep -E 'lemma|theorem|definition' || true)
        if [ -n "$LEMMAS" ]; then
            echo
