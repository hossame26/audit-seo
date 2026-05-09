# Checklist SEO HTML statique (Vercel / GitHub Pages / CF Pages)

## Meta & headings

- [ ] Meta title unique par page (≤ 60 car)
- [ ] Meta description unique par page (140-160 car)
- [ ] Un seul `<h1>` par page, contient le mot-clé principal
- [ ] H2/H3 = questions exactes des PAA
- [ ] Open Graph + Twitter Card complets

## Structured data

- [ ] JSON-LD sur chaque page (Product / Article / Organization / BreadcrumbList / FAQPage)
- [ ] Validé via Rich Results Test
- [ ] Pas de faux avis (pénalité manuelle)

## Fichiers racine

- [ ] `robots.txt` (ne PAS bloquer GPTBot/ClaudeBot/PerplexityBot)
- [ ] `sitemap.xml` (toutes URLs canoniques, `lastmod` à jour)
- [ ] `llms.txt` pour AEO
- [ ] `humans.txt` (optionnel, signal qualité)

## Performance

- [ ] AVIF pour hero, WebP partout ailleurs
- [ ] `width` + `height` sur toutes images
- [ ] `loading="lazy"` sauf hero (`fetchpriority="high"`)
- [ ] Preload fonts critiques (woff2 + crossorigin)
- [ ] Preconnect CDN
- [ ] CSS critique inline, reste async
- [ ] `<script>` defer ou async

## Redirections

- [ ] `vercel.json` ou `_redirects` avec 301 pour anciennes URLs
- [ ] Pas de chaîne de redirections (max 1 hop)
- [ ] Slash final cohérent (toujours avec OU toujours sans)

## Indexation

- [ ] GSC vérifié
- [ ] Bing Webmaster vérifié
- [ ] Sitemap soumis aux deux
- [ ] IndexNow activé

## Internal linking

- [ ] Maillage bidirectionnel pillar ↔ clusters
- [ ] Anchor texte descriptif (pas "cliquez ici")
- [ ] Breadcrumb sur toutes pages internes
