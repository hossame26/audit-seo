# PLAYBOOK SEO E-COMMERCE — Exécution step-by-step

Playbook complet à dérouler quand on lance le SEO d'un site e-commerce ou vitrine (Shopify, HTML statique, Next.js, Astro). 12 phases du diagnostic au monitoring continu.

**Référentiel technique associé :** voir [GUIDE-2026.md](GUIDE-2026.md)

---

## PHASE 0 — DIAGNOSTIC INITIAL (avant de commencer)

Questions préalables :
1. Quel site / quel path local ?
2. Stack : Shopify ou HTML statique ?
3. Niche + 3 mots-clés principaux ciblés
4. Pays cible (France seulement ou multi) ?
5. Budget link building : 0€ (gratuit only) ou budget dispo ?
6. URL de 2-3 concurrents directs

**Actions auto :**
- Lire la structure du projet (Read, Glob)
- Screaming Frog equivalent via curl/wget sur homepage + 3 pages
- PageSpeed Insights API sur homepage
- Vérifier `robots.txt` + `sitemap.xml` existants
- Lister les problèmes détectés

**Livrable :** Rapport diagnostic en 1 page avec score /100 + 5 bugs critiques trouvés.

---

## PHASE 1 — FIX TECHNIQUE (impact immédiat)

### Si Shopify :
1. [ ] Retirer `| within: collection` dans la grille produit (main-collection-product-grid.liquid)
2. [ ] Fix H1 homepage (remplacer `<h1>` logo par `<div>`)
3. [ ] Auditer les apps installées → désactiver celles inutiles
4. [ ] Customiser `robots.txt.liquid` (bloquer filtres, UTM, sort)
5. [ ] Vérifier canonical sur pages produit
6. [ ] Judge.me gratuit installé pour avis + schema Review
7. [ ] Metafields pour enrichir schema (material, care)

### Si HTML statique :
1. [ ] Meta title/description uniques par page (< 60 / 140-160 car)
2. [ ] Schema JSON-LD sur chaque page (Product/Organization/Breadcrumb/FAQ)
3. [ ] robots.txt + sitemap.xml à la racine
4. [ ] Images WebP/AVIF avec width/height + lazy loading + fetchpriority
5. [ ] Preload fonts + preconnect CDN
6. [ ] Redirections 301 pour anciennes URLs (vercel.json)
7. [ ] H1 unique par page avec mot-clé principal

**Validation :** PageSpeed > 85 mobile, Rich Results Test OK, Screaming Frog 0 erreur critique.

---

## PHASE 2 — SCHEMA MARKUP COMPLET

Injecter sur toutes les pages :

**Homepage :**
- Organization + SameAs (socials + Wikidata si créé)
- WebSite + SearchAction

**Page produit :**
- Product + Offer + AggregateRating
- shippingDetails + MerchantReturnPolicy
- BreadcrumbList
- FAQPage (5 questions FAQ minimum)

**Page collection :**
- ItemList
- BreadcrumbList

**Articles blog :**
- Article + Author + datePublished
- BreadcrumbList

**Validation :** Google Rich Results Test passe sur 100% des templates.

---

## PHASE 3 — SOUMISSION MOTEURS

1. [ ] Google Search Console (vérif DNS ou meta tag)
2. [ ] Bing Webmaster Tools (critique pour ChatGPT)
3. [ ] Soumettre sitemap.xml aux deux
4. [ ] Activer IndexNow sur Bing
5. [ ] Google Merchant Center + activer Free Listings (si catalogue)
6. [ ] Ne PAS bloquer GPTBot / ClaudeBot / PerplexityBot dans robots.txt

**Validation :** Sitemap "Success" dans GSC + Bing, 0 erreur indexation.

---

## PHASE 4 — KEYWORD RESEARCH

1. [ ] Lister 3 head terms (gros volume)
2. [ ] 20 mid-tail (volume moyen, intent commercial)
3. [ ] 50+ long-tail (intent précis, peu concurrentiel)
4. [ ] Mapper chaque keyword à une page existante OU à créer
5. [ ] Identifier gaps via AnswerThePublic + AlsoAsked + Google Autocomplete
6. [ ] Analyser PAA des 3 concurrents sur les head terms

**Outils :** Keyword Surfer (extension), Ubersuggest (3/j gratuits), GSC "Performance" si déjà trafic.

**Livrable :** Fichier markdown `seo-keywords.md` avec mapping keyword → URL.

---

## PHASE 5 — CONTENT PILLAR + CLUSTERS

1. [ ] Définir 1 pillar page (sujet principal niche, 3000+ mots)
2. [ ] Identifier 8-15 cluster articles (sous-sujets, 800-1500 mots)
3. [ ] Créer structure URL : `/blog/[pillar]` + `/blog/[cluster-1]`...
4. [ ] Maillage interne bidirectionnel (pillar ↔ clusters)
5. [ ] Chaque article : H2/H3 = questions exactes, réponse 40-60 mots après chaque H2
6. [ ] Data sourcée + chiffres (format IA-citable)
7. [ ] Schema Article + Author + FAQPage sur chaque

**Priorité :** Commencer par pillar + 3 clusters, publier, puis étendre.

---

## PHASE 6 — PAGES "MEILLEUR X POUR Y" + COMPARATIVES

1. [ ] Lister 5 angles "meilleur X pour Y" basés sur la niche
2. [ ] 2-3 pages "X vs Y" (ton produit vs concurrents ou alternatives)
3. [ ] Structure : verdict rapide (featured snippet) → tableau comparatif → reviews individuelles → FAQ → CTA
4. [ ] Schema HowTo ou ItemList si applicable

**Impact :** Captent intent commercial élevé, conversion 2-3x vs pages produit.

---

## PHASE 7 — ENTITY STACKING + AEO

1. [ ] Gmail burner dédié (nommé comme la marque)
2. [ ] Créer entité **Wikidata** (gratuit, lu par tous les LLMs)
3. [ ] **Google Site** hub : 3-5 pages + lien vers store
4. [ ] **Google Doc** public optimisé (800-1200 mots, mots-clés, liens)
5. [ ] **Google Sheets** comparatif public
6. [ ] **Google Slides** guide produit
7. [ ] **Google MyMaps** si local applicable
8. [ ] **YouTube** chaîne au nom marque + 1 vidéo minimum
9. [ ] **Google Forms** sondage/quiz public
10. [ ] Tout interconnecté, tout pointe vers store
11. [ ] `llms.txt` à la racine du store
12. [ ] Schema Organization + SameAs vers Wikidata + socials

**Validation :** Knowledge Panel commence à apparaître en 2-8 semaines.

---

## PHASE 8 — PARASITE SEO

1. [ ] 1 article Medium (1500+ mots, cible mot-clé mid-tail)
2. [ ] 1 article LinkedIn Pulse (angle pro/expert)
3. [ ] 1 newsletter Substack (optionnel selon niche)
4. [ ] 1 page Notion publique (guide/ressource)
5. [ ] 1 page GitHub Pages si niche tech
6. [ ] Profil Reddit (compte 3-6 mois avant promo)
7. [ ] 5 réponses Quora expertes/mois avec lien contextuel

**Règle :** jamais pointer directement sur page produit, toujours via page ressource/blog.

---

## PHASE 9 — LINK BUILDING GRATUIT

1. [ ] Analyse backlinks concurrents via **Bing Webmaster Tools** (gratuit illimité)
2. [ ] Lister 20 domaines qui linkent concurrents mais pas toi
3. [ ] **Broken link building** : Screaming Frog free sur resource pages niche
4. [ ] **WikiGrabber** → remplacer dead links Wikipedia par ton contenu
5. [ ] **Qwoted** : répondre 2 pitches/mois (gratuit)
6. [ ] **Featured** (ex-HARO) : réponses journalistes
7. [ ] **Resource pages** : emails outreach sur `[niche] + "liens utiles"`
8. [ ] **Podcasts niche** : pitch en tant qu'expert, demander lien dans show notes
9. [ ] **Pinterest Rich Pins** activés (dofollow, 6 mois-2 ans durée de vie)
10. [ ] Profiles hauts DA : Crunchbase, AngelList, ProductHunt, About.me, G2

---

## PHASE 10 — PROGRAMMATIC SEO (scalable)

Si niche le permet :
1. [ ] Framework : [Head term] × [Modifier] × [Entity]
2. [ ] Data source unique par page (prix, stock, reviews, specs)
3. [ ] Template Astro ou Next.js (getStaticPaths)
4. [ ] Min 60% contenu unique par page (sinon Scaled Content Abuse)
5. [ ] Indexation progressive (pas 10K pages d'un coup)
6. [ ] Monitoring dans GSC pour détecter pénalisation

**Exemples pour stores :**
- `/[produit]-pour-[usage]` (50 × 10 = 500 pages)
- `/[produit]-[ville]` si livraison locale
- `/avis-[produit]-[année]`

---

## PHASE 11 — MONITORING CONTINU

1. [ ] GSC : positions, clics, impressions hebdo
2. [ ] Bing Webmaster : visibilité ChatGPT indirecte
3. [ ] PageSpeed : CWV mensuels
4. [ ] Ahrefs Webmaster Tools : nouveaux backlinks
5. [ ] Content refresh : audit tous les 6 mois sur pages top 20 trafic
6. [ ] Ajouter "Mis à jour en [mois] [année]" sur articles

**Alertes rouges :**
- Chute > 20% trafic sur 7 jours = investigation immédiate
- Nouveau pic backlinks suspects = disavow proactif
- CWV dégradés = audit apps/thème

---

## PHASE 12 (OPTIONNEL, SI BUDGET)

- [ ] Niche edits achetés (FatJoe, RhinoRank) sur pages prioritaires
- [ ] Expired domain reconstruction → Tier 1 vers money site
- [ ] CTR manipulation ponctuelle (2-4 semaines sur page top 20)
- [ ] Branded search via micro-workers (renforce NavBoost)

---

## CHECKLIST FINALE PAR STORE

Avant de considérer le SEO "setup complet" :
- [ ] Phases 0-5 complétées minimum
- [ ] Schema validé Rich Results Test
- [ ] CWV > 85 mobile
- [ ] GSC + Bing WMT configurés
- [ ] 1 pillar + 3 clusters publiés
- [ ] Entity Stacking Google fait
- [ ] llms.txt + Wikidata
- [ ] Monitoring hebdomadaire en place

---

## RÈGLES D'EXÉCUTION

1. **Valider chaque phase** avant de passer à la suivante
2. **Livrer incrémentalement** (pas tout d'un coup)
3. **Exécuter dans le dossier du projet** (lire `CLAUDE.md` / `README.md` local si existe)
4. **Commit git** après chaque phase majeure (si repo existe)
5. **Utiliser outils gratuits** par défaut, proposer payants seulement si demandé
6. **Tracker l'avancement** via tâches ou checklist
7. **Ne jamais appliquer** les techniques grey hat (PBN, cloaking, CTR manip) sans validation explicite
