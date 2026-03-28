
[![SLSA Provenance Verified](https://img.shields.io/badge/SLSA-Provenance%20Verified-4caf50?style=for-the-badge&logo=github)](https://slsa.dev)

#  Provenance cryptographique

Chaque document PDF généré dans ce dépôt est accompagné d’une **provenance cryptographique vérifiable**, conforme au standard **SLSA (Supply-chain Levels for Software Artifacts)**.  
Cela garantit que chaque artefact publié :

- provient réellement de ce dépôt  
- a été généré par le workflow GitHub Actions indiqué  
- n’a pas été modifié après sa création  
- peut être vérifié localement par n’importe quel utilisateur  
- possède une attestation signée via **GitHub OIDC**  
- est reproductible et traçable

---

##  Chaîne de confiance

À chaque exécution du pipeline :

1. Les sources Isabelle/HOL sont compilées  
2. Les documents LaTeX sont construits  
3. Les PDF finaux sont produits  
4. Une attestation SLSA v1 est générée pour chaque PDF  
5. Les artefacts sont signés cryptographiquement  
6. Une release versionnée automatiquement est créée  
7. Les PDF signés sont attachés à la release  
8. Un résumé clair est généré dans l’onglet *Résumé* du workflow

---

##  Vérification locale des PDF

Vous pouvez vérifier l’authenticité de n’importe quel PDF publié avec :

```bash
gh attestation verify --owner 2racinede4carreunivers-dev NOM_DU_FICHIER.pdf
```

Si la provenance est valide, vous verrez :

```
✓ Verification succeeded!
```

Cela confirme que :

- le hash SHA‑256 correspond  
- l’attestation SLSA est valide  
- le workflow signataire est authentique  
- le dépôt source est correct  
- le certificat OIDC est légitime  

---

##  Versionnement automatique

Le pipeline applique un versionnement strict basé sur le message du commit :

| Préfixe du commit | Type | Effet sur la version |
|-------------------|-------|----------------------|
| `major:` | Rupture | X.0.0 |
| `feat:` | Fonctionnalité | 0.X.0 |
| `fix:` | Correction | 0.0.X |
| *(autre)* | Patch | 0.0.X |

Les versions suivent le format :

```
v-acr-MAJOR.MINOR.PATCH
```

Chaque release GitHub correspond exactement à une version générée par le pipeline.

---

##  Transparence des artefacts

Pour chaque exécution, le workflow génère automatiquement un résumé contenant :

- la liste des PDF produits  
- leur taille  
- leur hash SHA‑256  
- la version générée  
- le message du commit  
- la confirmation de la génération des attestations SLSA  
- un lien direct vers la release publiée  

Cela permet une traçabilité complète, sans devoir consulter les logs.

---

##  Pourquoi cette approche ?

Ce système garantit :

- **Intégrité** : aucun document ne peut être modifié sans invalider sa signature  
- **Reproductibilité** : toute personne peut reconstruire les artefacts à partir des sources  
- **Transparence** : chaque étape est documentée et vérifiable  
- **Confiance scientifique** : idéal pour des travaux mathématiques, formels ou théoriques  
- **Auditabilité** : chaque PDF est lié à un commit, un workflow et une attestation  
[![SLSA Provenance Verified](https://img.shields.io/badge/SLSA-Provenance%20Verified-4caf50?style=for-the-badge&logo=github)](https://slsa.dev)

# L'Univers est au Carré - Application Web

## Vue d'ensemble

Application web personnalisée développée pour **Philippe Thomas Savard** comme outil d'augmentation du raisonnement pour explorer sa théorie personnelle "L'univers est au carré".

## Architecture Technique

### Stack Technologique
- **Frontend**: React.js avec Shadcn/UI components
- **Backend**: FastAPI (Python)
- **Base de données**: MongoDB
- **IA**: Claude Sonnet 3.5 via Clé LLM Universelle Emergent
- **Déploiement**: Emergent Platform

### Structure du Projet
```
/app/
├── backend/
│   ├── server.py              # API FastAPI principale
│   ├── requirements.txt       # Dépendances Python
│   └── .env                   # Variables d'environnement
├── frontend/
│   ├── src/
│   │   ├── App.js            # Application React principale
│   │   ├── App.css           # Styles personnalisés
│   │   └── components/ui/    # Composants Shadcn/UI
│   ├── package.json          # Dépendances Node.js
│   └── .env                  # Variables d'environnement frontend
├── README.md                 # Ce fichier
└── context.md               # Contexte détaillé du développement
```

## Fonctionnalités Principales

### 1. Pages de Navigation
- **Accueil** : Présentation de la théorie avec 3 domaines distincts
- **Méthode de Philippôt** : 14 tableaux géométriques détaillés
- **Explorer** : Navigation par concepts et catégories
- **IA Expert** : Chat avec assistant spécialisé
- **Collaboration** : Éditeur de texte collaboratif avec IA

### 2. IA Spécialisée (Fonctionnalité Centrale)
- **Mode Enrichi** : Mémoire étendue et contexte personnel
- **Réponses bi-partites** : Vision auteur + contexte scientifique actuel
- **Spécialisation** : Uniquement la théorie "L'univers est au carré"
- **3 Domaines Distincts** : Traitement séparé sans liens forcés
  - Énigme de Riemann et nombres premiers
  - Théorème de Philippôt et intrication quantique
  - Mécanique harmonique du chaos discret

### 3. Gestion de Documents
- **Upload** : Support PDF, images, documents texte
- **Analyse automatique** : IA analyse les documents uploadés
- **Intégration chat** : Documents attachables aux conversations
- **Sauvegarde** : Persistance des documents par session

### 4. Collaboration Textuelle
- **Éditeur enrichi** : Formatage markdown, listes, titres
- **IA collaborative** : Boutons "Compléter" et "Améliorer"
- **Sauvegarde** : Documents collaboratifs persistants
- **Session tracking** : Continuité des sessions de travail

## URLs et Configuration

### Environnement de Production
- **URL Frontend**: https://universe-squared.preview.emergentagent.com
- **API Backend**: /api/* (routes automatiquement mappées)

### Variables d'Environnement Critiques
```bash
# Backend (.env)
MONGO_URL="mongodb://localhost:27017"
DB_NAME="univers_au_carre"
EMERGENT_LLM_KEY=sk-emergent-*****

# Frontend (.env)  
REACT_APP_BACKEND_URL=https://universe-squared.preview.emergentagent.com
```

## Commandes de Déploiement

### Redémarrage des Services
```bash
sudo supervisorctl restart all
sudo supervisorctl restart frontend
sudo supervisorctl restart backend
```

### Installation de Dépendances
```bash
# Backend
cd /app/backend && pip install -r requirements.txt

# Frontend  
cd /app/frontend && yarn install
```

### Logs de Diagnostic
```bash
tail -f /var/log/supervisor/backend.*.log
tail -f /var/log/supervisor/frontend.*.log
```

## Spécificités de la Théorie

### Structure Théorique (3 Domaines Distincts)
1. **Énigme de Riemann** : Analyse numérique métrique, technique du moulinet, fonction Zêta
2. **Intrication Quantique** : Théorème de Philippôt, "squaring", produit alternatif
3. **Chaos Discret** : Mécanique harmonique, matrice à dérive première, chaons

### Deuxième Partie de la Théorie
- Théorème "Trois carrés égale un triangle"
- Longueur de Philippôt (inspirée de Planck)
- Cercle Denis (diamètre 1, circonférence ≈ 4)
- √10 comme approximation de π

### Documents Sources Analysés
- `univers_au_carre_partie1.pdf` - Première partie complète
- `univers_au_carre_partie2.pdf` - Deuxième partie
- `algotithme_manus_methode_philippot.docx` - Méthodes algorithmiques
- `Pdf_emergent_methode_philippot.pdf` - 14 tableaux détaillés
- `deuxieme_pdf_emergent_methode_philippot.pdf` - Tableaux supplémentaires
- `geometrie_spectre_nouvelle_version.pdf` - Version corrigée
- `prompt_algorithme_emergent_methode_philippot0238.pdf` - Développements
- `2_ieme_prompt_emergent.pdf` - Derniers ajouts

## État Actuel du Projet

###  Fonctionnalités Complètes
- Interface utilisateur complète et responsive
- IA spécialisée avec mémoire étendue  
- Upload et analyse de documents
- Collaboration textuelle avancée
- Base de données avec concepts et tableaux
- Navigation fluide entre toutes les pages

###  Dernières Améliorations Apportées
- Restructuration IA en 3 domaines distincts (évite liens forcés)
- Enrichissement page d'accueil avec deuxième partie
- Amélioration système d'upload de documents
- Mode collaboration avec éditeur de texte enrichi

###  Objectif de l'Application
Outil personnel pour Philippe Thomas Savard permettant :
- Stimuler et augmenter son questionnement sur sa théorie
- Développer ses argumentations avec l'IA
- Organiser et structurer ses idées
- Explorer sa théorie sans jugements externes
- Maintenir la séparation entre les domaines d'étude

## Contact et Propriété

**Auteur de la Théorie** : Philippe Thomas Savard  
**Développement** : Assistant IA Emergent  
**Usage** : Application personnelle dédiée  

## Notes pour le Développeur (Session Future)

1. **Respecter la structure en 3 domaines distincts** - Ne jamais forcer de liens
2. **Maintenir les réponses bi-partites** - Vision auteur + contexte scientifique
3. **L'IA doit rester spécialisée** uniquement dans cette théorie
4. **Toujours privilégier le français** dans toutes les interactions
5. **Application personnelle** - optimisée pour le style de Philippe Thomas Savard

---
*Dernière mise à jour : Session du 23 septembre 2025*