# Audit SEO

Système d'audit et d'optimisation SEO pour sites e-commerce et vitrines (Shopify, HTML statique, Next.js, Astro).

## Contenu

- **[PLAYBOOK.md](PLAYBOOK.md)** — Playbook step-by-step en 12 phases (du diagnostic au monitoring).
- **[GUIDE-2026.md](GUIDE-2026.md)** — Référentiel technique complet : Core Web Vitals, schema, AEO/GEO, link building, programmatic SEO.
- **[checklists/](checklists/)** — Checklists actionnables par stack et par phase.
- **[templates/](templates/)** — Templates de rapports d'audit, sitemap, robots.txt, JSON-LD.
- **[scripts/](scripts/)** — Scripts d'audit automatisés (PageSpeed, headers, schema, sitemap).

## Démarrage rapide

```bash
# 1. Cloner
git clone https://github.com/hossame26/audit-seo.git
cd audit-seo

# 2. Lancer un audit rapide
bash scripts/quick-audit.sh https://exemple.com

# 3. Suivre le playbook
open PLAYBOOK.md
```

## Périmètre couvert

| Domaine | Couverture |
|---|---|
| Technique on-page | Meta, headings, canonical, hreflang, robots, sitemap |
| Performance | Core Web Vitals 2026 (LCP/INP/CLS), images, fonts, preload |
| Structured data | Product, Organization, BreadcrumbList, FAQPage, Article, ItemList |
| Indexation | GSC, Bing WMT, IndexNow, Google Merchant Center |
| Content | Pillar + clusters, pages comparatives, refresh strategy |
| AEO / GEO | LLMs.txt, Wikidata, Entity Stacking, schema SameAs |
| Link building | Gratuit (broken links, resource pages, Qwoted, Pinterest) |
| Programmatic SEO | Templates `[entity] × [modifier]` scalables |
| Monitoring | Alertes trafic, CWV mensuels, content refresh 6 mois |

## Stack supportée

- Shopify (themes Dawn, Horizon, custom)
- HTML statique (Vercel, GitHub Pages, Cloudflare Pages)
- Next.js / Astro / Eleventy
- WordPress / WooCommerce

## Outils utilisés (gratuits)

- Google Search Console + Bing Webmaster Tools
- PageSpeed Insights API
- Rich Results Test
- Screaming Frog (free, < 500 URLs)
- Bing Backlinks (illimité gratuit)
- Keyword Surfer + Ubersuggest

## Licence

MIT — usage libre, attribution appréciée.
