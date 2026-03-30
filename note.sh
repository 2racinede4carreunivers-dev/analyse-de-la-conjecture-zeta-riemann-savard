#!/usr/bin/env bash
set -e

REPO_ROOT="$(git rev-parse --show-toplevel)"
NOTE_FILE="$REPO_ROOT/.git/.note"

echo "=== Création d'une note pour le CHANGELOG ==="
echo ""

# Questions téléosémantiques humaines
read -p "1. Quels changements avez-vous apportés ? " Q1
read -p "2. Quel est l'effet immédiat sur le dépôt ? " Q2
read -p "3. Quelle mise à jour prévoyez-vous ensuite ? " Q3

# Enregistrement de la note
echo "type=\"manual\"" > "$NOTE_FILE"
echo "q1=\"$Q1\"" >> "$NOTE_FILE"
echo "q2=\"$Q2\"" >> "$NOTE_FILE"
echo "q3=\"$Q3\"" >> "$NOTE_FILE"

echo ""
echo "=== Gestion du versionnement du TAG ==="

# Récupération du tag actuel
CURRENT_TAG=$(git describe --tags --abbrev=0 2>/dev/null || echo "v-0.0.0")
echo "Tag actuel détecté : $CURRENT_TAG"

# Extraction X.Y.Z
TAG_NUM="${CURRENT_TAG#v-}"
IFS='.' read -r X Y Z <<< "$TAG_NUM"

# Fonction de normalisation : 0 = 1 pour les calculs
normalize_zero() {
    [[ "$1" -eq 0 ]] && echo 1 || echo "$1"
}

# Fonction de finalisation : 10 = 0 dans le résultat final
finalize_value() {
    [[ "$1" -eq 10 ]] && echo 0 || echo "$1"
}

# Fonction d'application des règles
apply_rule() {
    local old="$1"
    local rule="$2"

    # Si règle vide → conserver l'ancienne valeur
    [[ -z "$rule" ]] && echo "$old" && return

    # Nettoyage du suffixe major/fix/feat
    rule="${rule//major/}"
    rule="${rule//fix/}"
    rule="${rule//feat/}"

    # Extraction a/b
    if [[ "$rule" == */* ]]; then
        a="${rule%/*}"
        b="${rule#*/}"

        # b=0 → b=1
        [[ "$b" -eq 0 ]] && b=1

        # a=10 → résultat final = 0
        if [[ "$a" -eq 10 ]]; then
            echo 0
            return
        fi

        # Normalisation de l'ancienne valeur (0=1)
        old_norm=$(normalize_zero "$old")

        # Calcul
        result=$(echo "$old_norm * $a / $b" | bc -l)
        result_int="${result%.*}"

        # Finalisation (10=0)
        finalize_value "$result_int"
        return
    fi

    # Si la règle n'est pas valide → conserver l'ancienne valeur
    echo "$old"
}

# Calcul des nouvelles valeurs
NEW_X=$(apply_rule "$X" "$MAJOR")
NEW_Y=$(apply_rule "$Y" "$FIX")
NEW_Z=$(apply_rule "$Z" "$FEAT")

NEW_TAG="v-$NEW_X.$NEW_Y.$NEW_Z"
echo "Nouveau tag calculé : $NEW_TAG"

# Le workflow GitHub Actions lit ce fichier
echo "$NEW_TAG" > "$REPO_ROOT/.next_tag"

echo ""
echo "Votre note et votre version ont été enregistrées."
echo "Le tag $NEW_TAG sera utilisé lors du prochain push."
