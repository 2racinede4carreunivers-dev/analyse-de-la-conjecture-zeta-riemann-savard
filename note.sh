#!/usr/bin/env bash
set -e

REPO_ROOT="$(git rev-parse --show-toplevel)"
NOTE_FILE="$REPO_ROOT/.git/.note"
PDF_VERSION_FILE="$REPO_ROOT/.pdf_versions"

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
echo "=== Gestion du versionnement du TAG ==="

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
    rule="${rule//alpha/}"
    rule="${rule//beta/}"
    rule="${rule//zeta/}"

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
echo "=== Versionnement des PDF (alpha / beta / zeta) ==="

# Initialisation du fichier des versions PDF si absent
if [[ ! -f "$PDF_VERSION_FILE" ]]; then
    cat > "$PDF_VERSION_FILE" <<EOF
univers_est_au_carre=0.0.0
teleosemantique_esprit_analogiste=0.0.0
prime_number_philosophy_and_geometry=0.0.0
la_mecanique_du_chaos_discret=0.0.0
geometry_prime_spectrum=0.0.0
analyse_geometrie_nombre_premier=0.0.0
EOF
fi

declare -A PDFS=(
    ["univers_est_au_carre"]="7"
    ["teleosemantique_esprit_analogiste"]="8"
    ["prime_number_philosophy_and_geometry"]="9"
    ["la_mecanique_du_chaos_discret"]="10"
    ["geometry_prime_spectrum"]="11"
    ["analyse_geometrie_nombre_premier"]="12"
)

update_pdf_version() {
    local name="$1"
    local question="$2"

    local current=$(grep "^$name=" "$PDF_VERSION_FILE" | cut -d= -f2)
    IFS='.' read -r A B C <<< "$current"

    read -p "$question. Règles alpha/beta/zeta (ex: 3/4alpha, 4/5beta, 6/10zeta) : " RULES

    alpha_rule=$(echo "$RULES" | sed 's/, /\n/g' | grep alpha || true)
    beta_rule=$(echo "$RULES" | sed 's/, /\n/g' | grep beta || true)
    zeta_rule=$(echo "$RULES" | sed 's/, /\n/g' | grep zeta || true)

    newA=$(apply_rule "$A" "$alpha_rule")
    newB=$(apply_rule "$B" "$beta_rule")
    newC=$(apply_rule "$C" "$zeta_rule")

    echo "$name=$newA.$newB.$newC" >> "$PDF_VERSION_FILE.tmp"

    echo "→ Nouvelle version pour $name : $newA.$newB.$newC"
}

rm -f "$PDF_VERSION_FILE.tmp"

for pdf in "${!PDFS[@]}"; do
    update_pdf_version "$pdf" "${PDFS[$pdf]}"
done

mv "$PDF_VERSION_FILE.tmp" "$PDF_VERSION_FILE"

echo ""
echo "Toutes les versions PDF ont été mises à jour."
echo "Votre note et votre version ont été enregistrées."
echo "Le tag $NEW_TAG sera utilisé lors du prochain push."
