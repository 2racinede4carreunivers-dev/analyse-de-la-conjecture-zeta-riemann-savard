# GUIDE D’UTILISATION — POSTULAT CARRÉ

Ce guide présente la méthode minimale permettant de reproduire les résultats du
script Isabelle/HOL *postulat_carre.thy*.  
Il expose les définitions essentielles, les équations normatives et les conditions
à respecter pour appliquer le postulat carré à un rectangle, un carré tronqué ou
un polygone au carré.

---

# 1. Postulat carré : structure générale

## 1.1 — Objet du postulat
Le postulat carré relie :
- un rectangle de dimensions w × h,
- un carré interne de côté s,
- un segment tronqué t,
- un nombre premier p,
- une diagonale diag,
- une aire area.

L’objectif est de vérifier si ces éléments satisfont simultanément trois équations :
1. ratio hauteur / côté,
2. ratio tronqué / côté,
3. équation du postulat.

---

# 2. Locale `postulat_carre`

## 2.1 — Conditions géométriques minimales
L’utilisateur DOIT fournir :
- w > 0  
- h > 0  
- s > 0  
- t > 0  
- s ≤ w  
- s ≤ h  
- p premier

Ces conditions garantissent que les surfaces et diagonales sont bien définies.

## 2.2 — Surfaces
Trois surfaces sont définies :
- S_S = w·h (surface totale)
- S_F = s² (surface du carré interne)
- S_C = S_S − S_F (surface complémentaire)

## 2.3 — Diagonales
Trois diagonales associées :
- d_S = √(w² + h²) (diagonale du rectangle)
- d_F = √2·s (diagonale du carré)
- d_C = √(s² + t²) (diagonale tronquée)

## 2.4 — Unité associée au premier p
L’unité abstraite est :
- unit_p = √p + 1

Elle joue le même rôle que dans la mécanique harmonique du chaos discret.

---

# 3. Ratios fondamentaux

## 3.1 — Ratio hauteur / côté
L’équation DOIT être :
- h / s = √p + 1

Ce ratio relie la hauteur du rectangle à l’unité p.

## 3.2 — Ratio tronqué / côté
L’équation DOIT être :
- t / s = √p

Ce ratio relie la partie tronquée à la racine du premier.

## 3.3 — Interprétation
Les deux ratios définissent un rectangle « compatible » avec p :
- la hauteur encode √p + 1,
- la troncature encode √p.

---

# 4. Équation du postulat carré

## 4.1 — Forme générale
L’équation centrale est :

    (diag × √unit_p)² = k·area + h²

où :
- diag est une diagonale fournie par l’utilisateur,
- area = w·h,
- k est un index associé au premier p.

## 4.2 — Définition de k
La liste :

    upto_from_2 = [2, 3, 4, …, p]

L’index k est défini comme :
- la position de p dans cette liste,
- plus 1.

Exemples :
- p = 2 → liste = [2] → k = 1  
- p = 3 → liste = [2,3] → k = 2  
- p = 5 → liste = [2,3,4,5] → k = 4  

## 4.3 — Rôle de k
k agit comme un « poids discret » associé au premier p.  
Il permet d’équilibrer l’équation du postulat.

---

# 5. Rectangle équivalent à un carré

## 5.1 — Locale `rectangle_carre`
Un rectangle w × h est équivalent à un carré s × s si :

    w·h = s²

Cette condition est indépendante du postulat carré.

---

# 6. Polygone au carré : axiomes

## 6.1 — Locale `polygone_carre_axiomes`
Pour un polygone défini par (h, s, t, diag, area), on impose :

1. h / s = √p + 1  
2. t / s = √p  
3. (diag × √(√p + 1))² = area + h²  

## 6.2 — Définition d’un polygone au carré
Un polygone est « au carré » si les trois équations sont vraies :

    polygone_defini =
       eq_ratio_height ∧ eq_ratio_trunc ∧ eq_postulat

---

# 7. Exemple numérique : p = 3

## 7.1 — Locale `exemple_p3`
L’utilisateur fournit :
- s3 > 0  
- h3 / s3 = √3 + 1  
- t3 / s3 = √3  
- √(s3² + t3²) = √6  
- area3 = s3·h3  

## 7.2 — Résultats
Les lemmes confirment :
1. le ratio hauteur est correct,
2. le ratio tronqué est correct,
3. la diagonale tronquée est exacte,
4. l’aire est cohérente.

---

# 8. Règles d’utilisation

## 8.1 — L’utilisateur DOIT :
1. choisir un premier p,
2. définir w, h, s, t, diag, area,
3. vérifier les ratios h/s et t/s,
4. calculer k,
5. tester l’équation du postulat.

## 8.2 — L’utilisateur DEVRAIT :
1. vérifier la cohérence géométrique (w > 0, h > 0, s ≤ w),
2. tester plusieurs valeurs de diag pour explorer la structure,
3. comparer les résultats pour différents p.

## 8.3 — L’utilisateur PEUT :
1. étendre la méthode à d’autres polygones,
2. utiliser le postulat comme base pour des constructions géométriques,
3. explorer la relation entre p et k.

---

# 9. Résumé final (10 lignes)

1. Le postulat carré relie un rectangle, un carré interne et un premier p.  
2. Deux ratios DOIVENT être respectés : h/s = √p + 1 et t/s = √p.  
3. L’équation centrale est : (diag·√(√p+1))² = k·area + h².  
4. k est l’index discret du premier p dans la liste [2..p].  
5. Les surfaces S_S, S_F, S_C structurent la géométrie.  
6. Les diagonales d_S, d_F, d_C complètent la structure.  
7. Un polygone est « au carré » si les trois équations sont vraies.  
8. L’exemple p = 3 illustre la méthode sans valeurs numériques.  
9. L’utilisateur doit fournir les longueurs et vérifier les équations.  
10. La méthode est simple, reproductible et exige un effort d’analyse.

---

# ✔️ Fin du guide d’utilisateur — postulat carré
