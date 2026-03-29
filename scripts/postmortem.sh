#!/usr/bin/env bash

# ---------------------------------------------------------
# postmortem.sh
# Génère un résumé de la version précédente (post-mortem)
# ---------------------------------------------------------

set -e

# Vérifier s'il existe un tag précédent
LAST_TAG=$(git describe --tags --abbrev=0 2>/dev/null || echo "")

if [ -z "$LAST_TAG" ]; then
    echo "Aucune version précédente n'existe encore."
    echo "Cette release constitue le point de départ officiel du projet."
    exit 0
fi

# Récupérer le message de la release précédente (si disponible)
LAST_COMMIT=$(git rev-list -n 1 "$LAST_TAG")

LAST_MESSAGE=$(git log -1 --pretty=%B "$LAST_COMMIT" | tr '\n' ' ')

# Générer un post-mortem simple et clair
echo "Version précédente : $LAST_TAG"
echo ""
echo "Résumé de l'état précédent :"
echo "- La version précédente représentait une étape importante dans l'évolution du projet."
echo "- Elle consolidait les éléments disponibles à ce moment-là."
echo "- Message associé : $LAST_MESSAGE"
echo ""
echo "Cette nouvelle release s'appuie sur cette base pour poursuivre l'évolution de la théorie."

