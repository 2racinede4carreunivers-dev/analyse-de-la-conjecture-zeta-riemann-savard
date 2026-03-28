# GUIDE D’UTILISATION — ESPACE DE PHILIPPOT

Ce guide présente la méthode minimale permettant de reproduire les résultats du
script Isabelle/HOL *espace_philippot.thy*.  
Il expose les définitions essentielles, les lois de croissance, les relations
géométriques et les axiomes hypercomplexes qui caractérisent l’Espace de
Philippot.

---

# 1. Longueurs selon la spirale de Théodore de Cyrène.

## 1.1 — Principe général
Les longueurs des côtés de la pyramide suivent la progression :

    L(n) = √(n · Lref²)

Cette loi correspond à la spirale de Théodore de Cyrène.

## 1.2 — Longueurs de référence des quatre côtés de la pyramide.
Quatre longueurs de base sont fournies :
- L1_ref = 1.65301407  
- L2_ref = 1.72784193  
- L3_ref = 1.65301407  
- L4_ref = 0.93780239  

## 1.3 — Définition générale d’un côté
Pour tout Lref et tout n :

    cote(Lref, n) = √(n · Lref²)

Quatre variantes sont définies :
- cote1(n), cote2(n), cote3(n), cote4(n)

## 1.4 — Propriété
Le lemme confirme que la définition est exacte :

    cote Lref n = √(n · Lref²)

---

# 2. Hauteurs, rayons et spirale de Théodore

## 2.1 — Hauteur
La hauteur suit directement la spirale :

    hauteur(n) = √n

## 2.2 — Rayon associé
À chaque hauteur correspond un disque dont le rayon suit :

    rayon(n) = √(hauteur(n) / 10)

soit :

    rayon(n) = √(√n / 10)

## 2.3 — Interprétation
1. La hauteur encode la progression √n.  
2. Le rayon encode une progression plus lente : √(√n / 10).  
3. Ensemble, ils définissent les niveaux de la pyramide.

---

# 3. Relation diagonale–hauteur–rayon

## 3.1 — Axiome fondamental
Une relation caractéristique de la pyramide est imposée :

    (diag_base · hauteur(n) + rayon(n)) / 2
        = hauteur(n)² + aire_disque

## 3.2 — Rôle
1. Cette équation relie diagonale, hauteur, rayon et aire.  
2. Elle sert de condition d’équilibre géométrique.  
3. Elle définit implicitement la structure interne de la pyramide.

---

# 4. Nombres hypercomplexes géométriques

## 4.1 — Objectif
Trois formes hypercomplexes sont définies pour représenter des valeurs
géométriques liées aux disques (aire A, rayon r).

## 4.2 — Hypercomplexe de type 1
Forme associée à plusieurs familles (P.2, R.2, P.5, P.7…) :

    hyper1(A, r) =
        √(2A + 2A√10 + r²)

## 4.3 — Hypercomplexe de type 2
Forme associée à P.2, P.19 et parallèles :

    hyper2(A, r) =
        √(2.8A + 2A√10 + √r)

## 4.4 — Hypercomplexe de type 3
Forme avec correction non linéaire :

    hyper3(A, r) =
        √( (2A)/10 + √(1 + (A − A²)) + 2r² )

## 4.5 — Interprétation
1. Ces trois formes représentent des « nombres hypercomplexes géométriques ».  
2. Elles combinent aire, rayon et termes non linéaires.  
3. Elles préfigurent une structure analogue aux quaternions.
« Affirmation  axiomatique uniquement de la validation»
---

# 5. Axiomatisation hypercomplexe et spirale

## 5.1 — Types abstraits
Deux types abstraits sont introduits :
- `event` : événements géométriques  
- `index` : niveaux de la pyramide  

## 5.2 — Fonctions associées
Pour chaque niveau n :
- r(n) : rayon  
- a(n), b(n), c(n), d(n) : composantes hypercomplexes  
- V_pyr(n) : volume de la pyramide  
- V_ell(n) : volume de l’ellipsoïde associé  
- val_geom(n) : valeur géométrique  
- spiral_pos(n, e) : position d’un événement sur la spirale  

---

# 6. Axiomes globaux

## 6.1 — Spirale de Théodore
Il existe une fonction f telle que :

    r(f(n)) = √n

Cet axiome garantit que les rayons suivent la spirale.

## 6.2 — Forme des valeurs géométriques
Il existe u(n), v(n) tels que :

    val_geom(n) = √(u(n)) + v(n)

## 6.3 — Norme hypercomplexe
Il existe une norme N telle que :

    N(a(n), b(n), c(n), d(n))
        = √(a² + b² + c² + d²)

## 6.4 — Rapport des volumes
Pour tout n :

    V_ell(n) = 10 · V_pyr(n)

## 6.5 — Position des événements
Il existe une fonction F telle que :

    spiral_pos(n, e) = F(a(n), b(n), c(n), d(n), e)

---

# 7. Règles d’utilisation

## 7.1 — L’utilisateur DOIT :
1. choisir un Lref parmi les quatre proposés,  
2. définir les niveaux n,  
3. calculer cote(n), hauteur(n), rayon(n),  
4. vérifier la relation diagonale–hauteur–rayon,  
5. utiliser les hypercomplexes selon le type voulu,  
6. respecter les axiomes globaux.

## 7.2 — L’utilisateur DEVRAIT :
1. comparer les trois hypercomplexes pour un même disque,  
2. analyser la progression des rayons √n,  
3. étudier le rapport V_ell / V_pyr = 10.

## 7.3 — L’utilisateur PEUT :
1. étendre la pyramide à d’autres Lref,  
2. explorer des analogies avec les quaternions,  
3. utiliser spiral_pos pour modéliser des événements.

---

# 8. Résumé final (10 lignes)

1. Les longueurs suivent la spirale de Théodore : √(n·Lref²).  
2. Les hauteurs suivent √n, les rayons suivent √(√n/10).  
3. Une relation fondamentale relie diagonale, hauteur, rayon et aire.  
4. Trois formes hypercomplexes modélisent les valeurs géométriques.  
5. Les volumes satisfont V_ell = 10·V_pyr.  
6. Les événements se placent sur une spirale abstraite.  
7. Les axiomes garantissent cohérence et structure.  
8. L’utilisateur doit fournir les longueurs et vérifier les équations.  
9. La méthode est simple, mais exige une interprétation personnelle.  
10. L’Espace de Philippot est un cadre géométrique hypercomplexe.
11. La présente validation n'est qu'affirmé a partir d'observations qui reste a priori et intuitive a l'heure actuelle.
---

# Fin du guide d’utilisateur — Espace de Philippot
