# CHANGELOG — analyse_conjecture_riemann_savard

Ce document retrace l’évolution du dépôt, les améliorations techniques, les correctifs, 
et les étapes de certification liées aux fichiers `.tex` et `.thy`.

---

## [2025-02-XX] — Initialisation du dépôt et première certification complète
### Ajouts
- Ajout des dix fichiers `.tex` et `.thy` constituant la base du projet.
- Mise en place du fichier `ROOT` pour la session Isabelle `Univers_Carre`.
- Ajout des illustrations nécessaires à la compilation LaTeX.
- Intégration du workflow GitHub Actions pour :
  - installation d’Isabelle 2024,
  - compilation certifiée de la session HOL,
  - compilation LaTeX automatisée,
  - génération des artefacts PDF.

### Correctifs
- Correction de la structure du fichier `ROOT` (syntaxe Isabelle conforme).
- Résolution du problème d’encadrés HOL manquants dans certains PDF.
- Déplacement des illustrations à la racine du dépôt pour assurer leur inclusion dans les PDF.

### Résultats
- **6 PDF générés avec succès**, incluant :
  - illustrations,
  - encadrés HOL,
  - tables des matières,
  - mise en page complète.
- Certification Isabelle réussie (`Univers_Carre` compilé en ~4 secondes).
- Pipeline CI/CD entièrement fonctionnel et stable.

---

## [2025-02-XX] — Améliorations futures (prévu)
### À venir
- Ajout d’un index automatique des PDF générés.
- Structuration des artefacts dans des sous-dossiers dédiés.
- Ajout d’un README enrichi avec liens vers les PDF certifiés.
- Optimisation du workflow (cache TeX Live / Isabelle).
- Ajout d’une documentation téléosémantique pour la session `Univers_Carre`.

---

## Format du CHANGELOG
Ce changelog suit une structure simple :
- **Ajouts** : nouvelles fonctionnalités, nouveaux fichiers.
- **Correctifs** : erreurs corrigées, améliorations techniques.
- **Résultats** : état final de la compilation et de la certification.
- **À venir** : planification des prochaines étapes.

---

*Dernière mise à jour : 2025-02-XX*

### Note importante — Début des mises à jour du dépôt

Début des mises à jour pour le dépôt **analyse_conjecture_riemann_savard**.  
Cette première mise à jour concorde avec la compilation certifiée du build GitHub Actions pour le workflow du dépôt.

La certification est un succès :  
- les **4 fichiers HOL (.thy)** encodés sous Isabelle sont certifiés et compilés,  
- les fichiers **.tex** ont été traités correctement,  
- le build a généré **6 PDF LaTeX complets**, incluant :  
  - la version originale en français de *La géométrie du spectre des nombres premiers*,  
  - la version adaptée en anglais,  
  - la version originale en français de *La téléosémantique de l’esprit de l’analogiste derrière la géométrie du spectre des nombres premiers*,  
  - les fichiers *mécanique harmonique du chaos discret* et *postulat de l’univers carré*, tous deux compilés avec succès.

Ces **six PDF** et **quatre fichiers .thy** constituent le cœur et l’âme de ce dépôt.  
D’autres fichiers HOL, .tex et .pdf seront ajoutés prochainement afin d’enrichir la structure scientifique et téléosémantique du projet.

## [2026-03-21] Mise a jour du document LaTeX

- Ajout d'une definition complete concernant l'analyse numerique metrique dans `geometrie_du_spectre_premier.tex`.
- Correction et remplacement du tableau de la deuxieme etape de la methode de Philippot.
- Harmonisation du contenu avec les sections existantes du document.

## [MAJOR] – Ajout du chapitre « espace_philippot » (2026‑03‑23)

### Ajouté
- Introduction d’un nouveau chapitre majeur : **Espace de Philippôt**.
- Ajout du fichier `espace_philippot.thy`, entièrement formalisé en HOL Isabelle.
- Ajout du fichier associé `espace_philippot.tex` pour la documentation LaTeX.

### Impact
- Ce chapitre marque le début d’une nouvelle section de la théorie unifiée  
  **« L’univers est au carré »**.
- Le fichier `.thy` est maintenant intégré à la session Isabelle via le ROOT  
  et sera compilé automatiquement par le workflow GitHub Actions.
- Une future mise à jour du `README.md` détaillera ce nouveau chapitre.
- Les autres fichiers du dépôt seront progressivement harmonisés pour refléter  
  cette nouvelle structure.

### Notes
- Ce commit sera associé à un **tag MAJOR** dans les releases GitHub.

# CHANGELOG — 24 mars 2026
## Mise à jour majeure — Guides utilisateurs et documentation HOL

###  Ajout de trois nouveaux guides utilisateurs
Les guides suivants ont été entièrement rédigés, structurés et intégrés au dépôt :

- **Guide d’utilisation — Mécanique harmonique du chaos discret**
- **Guide d’utilisation — Postulat carré**
- **Guide d’utilisation — Espace de Philippot**

Ces trois documents expliquent les méthodes formalisées dans les fichiers HOL
correspondants et permettent désormais à tout utilisateur de reproduire les
structures, invariants et constructions décrites dans les scripts Isabelle/HOL.

###  Mise à jour du README
- Le README a été mis à jour pour inclure une section dédiée à **l’Espace de Philippot**.
- Cette mise à jour fait suite au commit manuel précédent qui avait ajouté la
structure du fichier `espace_philippot.thy` au dépôt.
- Le README reflète maintenant l’ensemble des méthodes disponibles dans le projet.

###  Le dépôt contient maintenant 5 guides utilisateurs
Chaque fichier HOL du projet possède désormais son guide utilisateur associé :

1. `mecanique_discret.thy`
2. `postulat_carre.thy`
3. `espace_philippot.thy`
4. (et les deux premiers guides déjà présents dans le dépôt)

Ces guides ont pour objectif d’aider l’utilisateur à **reproduire les méthodes**
et **comprendre les structures géométriques, matricielles et hypercomplexes**
définies dans les scripts Isabelle/HOL.

###  Workflows GitHub Actions
- Les trois nouveaux guides sont actuellement en cours de build via le workflow.
- Le README mis à jour est également en cours de build.
- Aucun conflit détecté, pipeline stable.

---

# Carnet de mise à jour — 24 mars 2026

###  Objectif de la journée
Structurer, rédiger et intégrer l’ensemble des guides utilisateurs manquants pour
compléter la documentation du dépôt.

###  Réalisations
- Rédaction complète de **3 guides utilisateurs** (A, B, C).
- Rédaction du **guide Postulat carré** (≈150 lignes).
- Rédaction du **guide Espace de Philippot** (≈150 lignes).
- Mise à jour du README pour refléter les nouvelles sections.
- Vérification de la cohérence entre les guides et les scripts HOL.
- Lancement des workflows de build pour les nouveaux documents.

###  État du dépôt
- Le dépôt contient maintenant **5 guides utilisateurs complets**.
- Tous les fichiers HOL sont documentés.
- La structure documentaire est désormais cohérente, stable et professionnelle.

###  Conclusion de la journée
Ce commit conclut officiellement la journée du **24 mars 2026**.  
Les guides, le README et les workflows sont en place.  
La documentation du projet atteint un niveau de maturité remarquable.

---

#  Fin du bloc Markdown

## Mise à jour du workflow — Release automatique avec attestation cryptographique
**Date : 2026-03-26**  
**Type : infra / fix**

###  Mise à niveau du workflow `build-and-attest.yml`
Le workflow principal situé dans `.github/workflows/build-and-attest.yml` a été entièrement mis à jour afin d’intégrer :

- la génération automatique d’une **Release GitHub** à chaque commit manuel sur la branche `main`,
- la création d’une **attestation cryptographique (build provenance)** pour tous les PDF générés,
- l’ajout des permissions nécessaires (`id-token`, `attestations`, `contents`),
- l’intégration du **version bump automatique** basé sur le message de commit (`major:`, `feat:`, `fix:`),
- la publication automatique des PDF compilés dans chaque Release.

Cette mise à niveau harmonise le dépôt *analyse_conjecture_riemann_savard* avec la procédure déjà en place dans *formation_evolutive_savard*.

---

###  Ajout du rapport cryptographique (Build Provenance)
Un nouveau mécanisme d’attestation cryptographique a été ajouté.  
Chaque PDF produit par le workflow est maintenant accompagné d’un rapport officiel signé par GitHub Actions, garantissant :

- l’intégrité du fichier,
- la provenance exacte (commit, workflow, runner),
- la non‑altération après compilation.

Ce mécanisme constitue désormais **la procédure standard et définitive** pour toutes les futures releases du dépôt.

---

###  Notes complémentaires
- Aucun changement n’a été apporté au contenu des fichiers `.thy` ou `.tex`.
- La compilation Isabelle et LaTeX reste inchangée.
- Les artefacts PDF continuent d’être générés comme
## [v-acr-X.Y.Z] — Correction du pipeline de release (fix)

### Type de changement
**fix** — Correction d’un comportement inattendu dans le workflow GitHub Actions.

### Détails
- Ajout des `outputs` manquants dans le job `build` afin de permettre au job `release` d’accéder correctement à :
  - `new` (nouvelle version calculée)
  - `message` (message du commit)
- Correction de l’erreur : *“GitHub Releases requires a tag”*
- Stabilisation du système de versionnement automatique basé sur les préfixes de commit :
  - `major:` → X.0.0
  - `feat:` → 0.X.0
  - `fix:` → 0.0.X
  - autres → patch par défaut
- Le workflow génère désormais un tag valide à chaque exécution et publie correctement la release associée.
- Aucun changement dans la logique de compilation Isabelle/LaTeX ni dans la génération des attestations SLSA.

### Impact
- Le pipeline CI/CD est maintenant entièrement fonctionnel.
- Les releases GitHub sont créées automatiquement et sans erreur.
- Le versionnement est cohérent, reproductible et conforme aux conventions établies.

## [v-acr-X.Y.Z] — Mise à niveau majeure du workflow de release

### 🚀 Améliorations principales
- Refonte complète du workflow `build-and-attest.yml` pour une génération de release entièrement automatisée et stable.
- Ajout d’un **modèle fixe de release**, incluant :
  - résumé du dépôt,
  - informations d’auteur,
  - bibliographie mathlib,
  - sections permanentes et structurées.
- Intégration d’une **arborescence automatique filtrée** du dépôt (fichiers `.tex`, `.thy`, `.pdf`, guides, README, etc.).
- Inclusion automatique dans chaque release de **tous les fichiers `.pdf`, `.tex` et `.thy`** générés ou présents dans le dépôt.
- Amélioration de la transparence scientifique grâce à l’ajout d’une section bibliographique (Lean / mathlib).
- Stabilisation du versionnement automatique (`major`, `minor`, `patch`) basé sur les messages de commit.
- Maintien de la certification SLSA et des artefacts cryptographiquement attestés.

### 🛠️ Objectif de cette mise à niveau
Cette mise à jour majeure établit une structure professionnelle, reproductible et durable pour toutes les releases futures du projet *Analyse de la conjecture de Bernhard Riemann — L’univers est au carré*.  
Elle garantit une documentation cohérente, une traçabilité complète et une transparence accrue pour les utilisateurs, contributeurs et chercheurs.

