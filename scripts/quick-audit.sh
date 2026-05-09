#!/usr/bin/env bash
# quick-audit.sh — Audit SEO express d'une URL
# Usage: bash scripts/quick-audit.sh https://exemple.com

set -euo pipefail

URL="${1:-}"
if [[ -z "$URL" ]]; then
  echo "Usage: $0 <https://domaine.com>"
  exit 1
fi

DOMAIN=$(echo "$URL" | awk -F[/:] '{print $4}')
OUT_DIR="audits/${DOMAIN}-$(date +%Y%m%d-%H%M)"
mkdir -p "$OUT_DIR"

echo "[1/7] HTTP headers + status"
curl -sIL "$URL" -A "Mozilla/5.0 (compatible; Audit-SEO/1.0)" -o "$OUT_DIR/headers.txt"

echo "[2/7] HTML homepage"
curl -sL "$URL" -A "Mozilla/5.0 (compatible; Audit-SEO/1.0)" -o "$OUT_DIR/homepage.html"

echo "[3/7] robots.txt"
curl -sL "$URL/robots.txt" -o "$OUT_DIR/robots.txt" || echo "no robots.txt" > "$OUT_DIR/robots.txt"

echo "[4/7] sitemap.xml"
curl -sL "$URL/sitemap.xml" -o "$OUT_DIR/sitemap.xml" || echo "no sitemap" > "$OUT_DIR/sitemap.xml"

echo "[5/7] Extraction meta + headings"
{
  echo "## TITLE"
  grep -oE '<title>[^<]+</title>' "$OUT_DIR/homepage.html" | head -1
  echo ""
  echo "## META DESCRIPTION"
  grep -oE '<meta name="description" content="[^"]+"' "$OUT_DIR/homepage.html" | head -1
  echo ""
  echo "## CANONICAL"
  grep -oE '<link rel="canonical" href="[^"]+"' "$OUT_DIR/homepage.html" | head -1
  echo ""
  echo "## H1"
  grep -oE '<h1[^>]*>[^<]+</h1>' "$OUT_DIR/homepage.html"
  echo ""
  echo "## H2 (count)"
  grep -coE '<h2' "$OUT_DIR/homepage.html"
  echo ""
  echo "## JSON-LD blocks (count)"
  grep -c 'application/ld+json' "$OUT_DIR/homepage.html"
} > "$OUT_DIR/extract.md"

echo "[6/7] Open Graph + Twitter"
grep -oE '<meta property="og:[^"]+" content="[^"]+"' "$OUT_DIR/homepage.html" >> "$OUT_DIR/extract.md" || true
grep -oE '<meta name="twitter:[^"]+" content="[^"]+"' "$OUT_DIR/homepage.html" >> "$OUT_DIR/extract.md" || true

echo "[7/7] Rapport"
{
  echo "# Audit SEO — $DOMAIN"
  echo "**Date :** $(date)"
  echo "**URL :** $URL"
  echo ""
  echo "## Fichiers générés"
  echo "- headers.txt"
  echo "- homepage.html"
  echo "- robots.txt"
  echo "- sitemap.xml"
  echo "- extract.md"
  echo ""
  echo "## Status HTTP"
  head -1 "$OUT_DIR/headers.txt"
  echo ""
  echo "## Vérifications manuelles à faire"
  echo "- [ ] PageSpeed Insights : https://pagespeed.web.dev/?url=$URL"
  echo "- [ ] Rich Results Test : https://search.google.com/test/rich-results?url=$URL"
  echo "- [ ] Mobile-Friendly : https://search.google.com/test/mobile-friendly?url=$URL"
  echo "- [ ] Schema validator : https://validator.schema.org/#url=$URL"
} > "$OUT_DIR/REPORT.md"

echo ""
echo "OK — rapport dans : $OUT_DIR/REPORT.md"
