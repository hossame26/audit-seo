# GUIDE SEO E-COMMERCE 2026 — Référentiel complet

Référentiel technique pour stores e-commerce (Shopify + HTML statique + Next.js / Astro). Techniques actionnables, outils gratuits prioritaires, tolérance risque modérée.

---

## CE QUI EST MORT EN 2026
- Cloaking (détection SpamBrain quasi-certaine depuis oct 2025)
- Doorway pages keyword-swap
- AI content bulk sans révision humaine (-60 à -90% trafic)
- Expired domain → 301 direct vers money site (détecté 24h)
- PBN sans contenu de qualité
- HARO (utiliser Qwoted à la place)
- Dynamic rendering (déprécié par Google 2025)
- Schema avec faux avis (pénalité manuelle rapide)

---

## 1. CORE WEB VITALS 2026

| Métrique | Bon | Mauvais |
|---|---|---|
| LCP | < 2,5s | > 4s |
| INP (remplace FID) | < 200ms | > 500ms |
| CLS | < 0,1 | > 0,25 |

**Optimisations prioritaires :**
- AVIF pour hero images (−50% vs JPEG), WebP pour le reste
- `fetchpriority="high"` sur image LCP, `loading="lazy"` partout ailleurs
- Toujours `width` + `height` sur `<img>` pour éviter CLS
- Early Hints (HTTP 103) via Cloudflare → gain 300ms LCP
- Preload fonts critiques : `<link rel="preload" as="font" type="font/woff2" crossorigin>`
- Preconnect CDN : `<link rel="preconnect" href="https://cdn.shopify.com">`
- Speculation Rules API pour prerendering intelligent

---

## 2. SCHEMA MARKUP ESSENTIEL (JSON-LD)

**Sur chaque page produit :**
- `Product` + `Offer` + `AggregateRating` + `shippingDetails` + `MerchantReturnPolicy` (requis 2025 pour Shopping Ads)
- `BreadcrumbList`
- `FAQPage` (cible les People Also Ask)

**Sur homepage :**
- `Organization` + `SameAs` (pointer vers Instagram, TikTok, YouTube, Wikidata)
- `WebSite` + `SearchAction` (sitelinks searchbox)

**Sur collections :**
- `ItemList` + `BreadcrumbList`

**Règle :** JSON-LD uniquement (plus lisible par IA), tester avec Google Rich Results Test.

---

## 3. BUGS SHOPIFY À CORRIGER TOUT DE SUITE

1. **`| within: collection`** dans grille produit = duplicate content massif (fix prio #1)
2. **H1 = logo** sur homepage → remplacer par `<div>`, ajouter H1 textuel
3. **Double schema Product** (thème + app) → désactiver un des deux
4. **Filtres `?filter.v.option.*`** indexés → bloquer dans robots.txt
5. **`/collections/all`** indexée → noindex
6. **Produits orphelins** (hors collection) → assigner à au moins 1 collection
7. **Paramètres UTM** indexés → bloquer `/?utm_*`

**robots.txt.liquid optimisé :**
```
Disallow: /collections/*?filter*
Disallow: /collections/*+*
Disallow: /search?
Disallow: /cart
Disallow: /checkout
Disallow: /account
Disallow: /*?*sort_by=
```

---

## 4. CONTENT SEO POST-HCU

**52% des sites e-com ont chuté au HCU décembre 2025.** Ce qui résiste :
- **Clusters de 10-15 articles** de support bien liés = +23% visibilité
- **E-E-A-T** : Experience est LE signal (photos clients réelles, vidéos unboxing)
- **Contenu hyper-spécifique** > généraliste
- **Pages catégories : 300 mots suffisent** (étude Digitaloft)
- **Pages produit : 300-500 mots originaux** (jamais copier fournisseur)
- AI OK si supervision humaine (86,5% des top pages utilisent AI assisté)

**Formats qui rankent en e-com :**
- "Meilleur X pour Y" (intent commercial)
- "X vs Y" (décision)
- Guides d'achat
- FAQ avec schema

**Structure pillar/cluster :**
- 1 pillar page (3000-5000 mots)
- 8-15 cluster articles (800-1500 mots)
- Maillage bidirectionnel

---

## 5. AEO / GEO (Visibilité IA)

**Google AI Overviews :** +58% sur 9 industries entre 2025-2026, citation = +80% CTR.
**ChatGPT Search :** 87% des citations = top 10 Bing → **soumettre à Bing Webmaster Tools + IndexNow**.
**Perplexity :** extrait réponse dans **150 premiers mots** → supprimer intros storytelling. DA 40+ = cité 6x plus.
**Claude :** ne pas bloquer ClaudeBot dans robots.txt.

**Format qui domine les citations IA :**
- Listicles (21,9%)
- Articles factuels (16,7%)
- Pages produit (13,7%)

**Stack AEO :**
- Schema Organization + SameAs (Wikipedia, Wikidata, socials)
- Entité **Wikidata** créée (gratuit, lu par tous les LLMs)
- `llms.txt` à la racine (standard émergent)
- H2/H3 = questions exactes utilisateur
- Réponse directe en 40-60 mots après chaque H2
- Données chiffrées sourcées (62%+ de facts vs concurrents)

---

## 6. LINK BUILDING 2026

**Anchor text ratio safe :**
- Branded : 40-60%
- URL nue : 10-20%
- Generic : 10-15%
- Partial match : 10-20%
- Exact match : 2-5% MAX (> 5% = risque Penguin)

### Parasite SEO (risque faible, délai 2-8 sem)
| Plateforme | DA | Type |
|---|---|---|
| Google Sites | 100 (dofollow) | Entity stacking |
| LinkedIn Pulse | 99 | Articles pro |
| Medium | 95 | Long-form |
| GitHub Pages | 95 (dofollow) | Technique |
| Quora | 93 | Q&A |
| Substack | 92 | Newsletter |
| Reddit | 91 | Community |
| Notion public | 88 (dofollow) | Ressources |

### Entity Stacking Google (gratuit, 100% anonyme)
1 Gmail burner → Google Site hub + Google Doc + Sheets + Slides + Forms + MyMaps + YouTube + Drive folder → tous publics, interconnectés, pointent vers store.

### Niche edits (grey hat, tarifs 2026)
- DR 20-40 : 130-220€
- DR 40-60 : 220-400€
- DR 60-80 : 400-700€
- DR 80+ : 700-1200€+
- Plateformes : FatJoe, RhinoRank, Serpzilla, Authority Builders

### Alternatives HARO (gratuit)
- **Qwoted** (2 pitches/mois gratuits)
- **Featured** (ex-HARO)
- **SourceBottle**
- **Help a B2B Writer**

### Autres tactiques
- **Wikipedia backlinks** via WikiGrabber (dead links)
- **Podcasts** = backlinks permanents via show notes
- **Broken link building** via Screaming Frog (500 URLs gratuit)
- **Reverse engineering concurrents** via Bing Webmaster Tools (gratuit illimité)
- **Resource pages** : `[niche] + "liens utiles"` sur Google

---

## 7. PROGRAMMATIC SEO POST-UPDATE

Framework : **[Head term] × [Modifier] × [Entity]**

**Condition absolue :** données uniques par page (stock, prix, reviews). Le "thin content" est pénalisé par Scaled Content Abuse policy (mars 2024 + août 2025).

**Exemples qui cartonnent :**
- Zapier : 590K pages → 610K visites/mois
- Wise : 8,5M pages currency converter
- Tripadvisor : dizaines de millions

**Stack optimal :**
- **Astro** (meilleur CWV, Content Collections natives)
- **Next.js** (getStaticPaths + getStaticProps)
- Data sources gratuites : Wikidata, Wikipedia API, OpenStreetMap, data.gouv.fr, Google Trends

---

## 8. TECHNIQUES GREY HAT QUI MARCHENT ENCORE

### PBN 2026 (exécution stricte)
Métriques par domaine : DR > 20 réel, RD > 15, trafic historique, niche cohérente.
Footprints à éviter : même IP, même registrar, même thème WP, patterns d'interlinking.
Hosting : MXroute, Frantech, Shinjiru, PIA VPS, payer en crypto.

### Expired Domains
Sources : ExpiredDomains.net (gratuit), GoDaddy Auctions, DomCop (49-99€/mois).
Métriques : TF > 15, DA > 20, ratio TF/CF > 0.5, Wayback historique clean.
**301 stacking** : expired → Tier 1 site → money site (jamais direct).

### CTR Manipulation (court terme)
Outils : CTRMaster, SerpClix, Kraken (GMB).
Efficace 2-4 semaines sur page déjà en top 20. Dangereux long terme.

### Branded Searches Manipulation (sous-exploité, safe)
Micro-workers + vidéos YouTube CTA "cherchez [brand]" → renforce NavBoost.

---

## 9. OUTILS GRATUITS 100%

| Outil | Usage |
|---|---|
| Google Search Console | Indexation, erreurs, CWV, positions |
| Bing Webmaster Tools | Backlinks illimités + IndexNow + ChatGPT visibility |
| Google Merchant Center | Shopping feed + Free Listings |
| Screaming Frog (500 URLs) | Audit technique, redirections, canonicals |
| Google Rich Results Test | Validation schemas |
| PageSpeed Insights | CWV lab + terrain |
| Schema.org Validator | Validation JSON-LD |
| Ahrefs Webmaster Tools | Backlinks gratuit (propre site) |
| Judge.me plan gratuit | Avis + schema Review |
| WikiGrabber | Wikipedia dead links |
| Wayback Machine | Historique domaines |
| ExpiredDomains.net | Recherche domaines expirés |
| AnswerThePublic (3/jour) | Questions cibles |
| AlsoAsked (3/jour) | People Also Ask |
| Keyword Surfer (extension) | Volume sur SERP |
| Ubersuggest (3/jour) | Mots-clés |
| Merkle Schema Generator | Génération JSON-LD |
| Check My Links (extension) | Broken link building |

---

## 10. SERP FEATURES À CIBLER

- **People Also Ask** : présent sur 64,9% des recherches → sous-sections H2/H3 + réponse 40-60 mots
- **Featured Snippet** : 0,24% des requêtes (très compétitif)
- **Shopping (PLA + Organic)** : 30% des recherches → Product Schema parfait
- **AI Overviews** : 14% des requêtes shopping → format listicle + données sourcées
- **Zero-click** : 58,5% US en 2025 → branded search = KPI principal

---

## PRIORITÉS D'IMPACT (ordre)

1. Fix bugs Shopify (`| within:`, H1, apps)
2. Schema JSON-LD complet + Judge.me
3. Bing Webmaster Tools + IndexNow
4. Entity Stacking Google (8 propriétés)
5. Entité Wikidata
6. Core Web Vitals (AVIF, Early Hints)
7. Pillar + 8-15 clusters content
8. Pages "meilleur X pour Y" + comparatives
9. Parasite SEO (Medium, LinkedIn, Substack)
10. Programmatic SEO longue traîne
11. Link building (niche edits, broken links, podcasts)
12. CTR manipulation (ponctuel sur pages cibles)
