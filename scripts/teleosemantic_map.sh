#!/usr/bin/env bash

# ---------------------------------------------------------
# teleosemantic_map.sh
# Génère une "carte téléosémantique" de la release
# ---------------------------------------------------------

set -e

# Trouver le dernier tag
LAST_TAG=$(git describe --tags --abbrev=0 2>/dev/null || echo "")

# Si aucune version précédente
if [ -z "$LAST_TAG" ]; then
    echo "La théorie entre en existence. Son état téléosémantique est celui d'une émergence initiale : une intention pure, sans tension, orientée vers la construction de sa propre grammaire."
    exit 0
fi

# Fichiers modifiés
CHANGED_FILES=$(git diff --name-only "$LAST_TAG"..HEAD)

TEX_COUNT=$(echo "$CHANGED_FILES" | grep '\.tex$' | wc -l)
THY_COUNT=$(echo "$CHANGED_FILES" | grep '\.thy$' | wc -l)
PDF_COUNT=$(echo "$CHANGED_FILES" | grep '\.pdf$' | wc -l)

# Déterminer l'état téléosémantique
if [ "$THY_COUNT" -gt 0 ] && [ "$TEX_COUNT" -gt 0 ]; then
    # Forme + fond
    echo "La théorie synchronise forme et fond. Une phase d’unification active est en cours : la structure formelle évolue en parallèle de son expression narrative. L’esprit du projet est en tension créative, orienté vers la cohérence globale."
    exit 0
fi

if [ "$THY_COUNT" -gt 0 ]; then
    # Mathématique seulement
    echo "La théorie renforce sa charpente interne. Les transformations formelles indiquent une consolidation logique : l’esprit du projet est en mode rigueur ascendante, recentré sur ses invariances fondamentales."
    exit 0
fi

if [ "$TEX_COUNT" -gt 0 ]; then
    # Documentaire seulement
    echo "La théorie clarifie son langage. Les changements documentaires révèlent une volonté de rendre la structure plus lisible, plus transmissible. L’esprit du projet est en mode explicitation et mise en forme."
    exit 0
fi

if [ "$PDF_COUNT" -gt 0 ]; then
    # Recompilation sans changements majeurs
    echo "La théorie respire. Les documents ont été recompilés sans transformation profonde : l’état téléosémantique est celui d’une stabilité méditative."
    exit 0
fi

# Aucun changement significatif
echo "La théorie demeure stable. Aucun mouvement interne notable n’a été détecté : l’état téléosémantique est celui d’un équilibre silencieux."

