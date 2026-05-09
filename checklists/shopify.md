# Checklist SEO Shopify

## Theme & Liquid

- [ ] H1 unique par template (homepage = `<div>` pour le logo, pas `<h1>`)
- [ ] Retirer `| within: collection` dans `main-collection-product-grid.liquid` (canonical sain)
- [ ] Désactiver les apps inutiles (chaque app = JS bloquant)
- [ ] Customiser `robots.txt.liquid` : bloquer `?sort=`, `?filter.`, `?utm_*`
- [ ] Canonical explicite sur produits multi-collections
- [ ] Meta title ≤ 60 car, meta description 140-160 car, uniques par produit/collection

## Structured data (JSON-LD)

- [ ] `Product` + `Offer` + `AggregateRating` + `shippingDetails` + `MerchantReturnPolicy`
- [ ] `BreadcrumbList` sur tous les types
- [ ] `FAQPage` sur produits (5 Q minimum)
- [ ] `Organization` + `SameAs` homepage
- [ ] `WebSite` + `SearchAction` homepage

## Avis & enrichissement

- [ ] Judge.me (free) installé pour avis + schema Review
- [ ] Metafields produit : `material`, `care_instructions`, `country_of_origin`

## Performance

- [ ] PageSpeed mobile > 85
- [ ] LCP < 2.5s, INP < 200ms, CLS < 0.1
- [ ] Hero en AVIF, autres images WebP
- [ ] `fetchpriority="high"` sur image LCP
- [ ] `width` + `height` sur toutes les `<img>`

## Indexation

- [ ] GSC vérifié (DNS preferred)
- [ ] Bing Webmaster Tools vérifié
- [ ] Sitemap soumis aux deux
- [ ] IndexNow activé sur Bing
- [ ] Google Merchant Center + Free Listings activés

## AEO / LLMs

- [ ] `llms.txt` à la racine
- [ ] Pas de blocage `GPTBot` / `ClaudeBot` / `PerplexityBot` dans `robots.txt`
- [ ] Schema `SameAs` pointant vers Wikidata + socials
