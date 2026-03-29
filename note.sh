#!/usr/bin/env bash
set -e

REPO_ROOT="$(git rev-parse --show-toplevel)"
NOTE_FILE="$REPO_ROOT/.git/.note"

echo "=== Création d'une note pour le CHANGELOG ==="
echo ""

read -p "1. Quels changements avez-vous apportés ? " Q1
read -p "2. Quel est l'effet immédiat sur le dépôt ? " Q2
read -p "3. Quelle mise à jour prévoyez-vous ensuite ? " Q3

# Enregistrement de la note
echo "type=\"manual\"" > "$NOTE_FILE"
echo "q1=\"$Q1\"" >> "$NOTE_FILE"
echo "q2=\"$Q2\"" >> "$NOTE_FILE"
echo "q3=\"$Q3\"" >> "$NOTE_FILE"

echo ""
echo "=== Gestion du versionnement ==="

# Récupération du tag actuel
CURRENT_TAG=$(git describe --tags --abbrev=0 2>/dev/null || echo "v-0.0.0")
echo "Tag actuel détecté : $CURRENT_TAG"

# Extraction X.Y.Z
TAG_NUM="${CURRENT_TAG#v-}"
IFS='.' read -r X Y Z <<< "$TAG_NUM"

read -p "4. Nouvelle valeur pour major (ex: 4/3major ou vide) : " MAJOR
read -p "5. Nouvelle valeur pour fix   (ex: 1/0fix   ou vide) : " FIX
read -p "6. Nouvelle valeur pour feat  (ex: 6/5feat  ou vide) : " FEAT

apply_rule() {
    local old="$1"
    local rule="$2"

    [[ -z "$rule" ]] && echo "$old" && return

    rule="${rule//major/}"
    rule="${rule//fix/}"
    rule="${rule//feat/}"

    if [[ "$rule" == */0 ]]; then
        num="${rule%/*}"
        if [[ "$num" == "10" ]]; then
            echo 0
        else
            echo "$num"
        fi
        return
    fi

    if [[ "$rule" == */* ]]; then
        num="${rule%/*}"
        den="${rule#*/}"
        result=$(echo "$old * $num / $den" | bc -l)
        echo "${result%.*}"
        return
    fi

    echo "$old"
}

NEW_X=$(apply_rule "$X" "$MAJOR")
NEW_Y=$(apply_rule "$Y" "$FIX")
NEW_Z=$(apply_rule "$Z" "$FEAT")

NEW_TAG="v-$NEW_X.$NEW_Y.$NEW_Z"
echo "Nouveau tag calculé : $NEW_TAG"

echo "$NEW_TAG" > "$REPO_ROOT/.next_tag"

echo ""
echo "Votre note et votre version ont été enregistrées."
echo "Le tag $NEW_TAG sera utilisé lors du prochain push."
