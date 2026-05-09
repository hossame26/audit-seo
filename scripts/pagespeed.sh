#!/usr/bin/env bash
# pagespeed.sh — Audit Core Web Vitals via PageSpeed Insights API (gratuit, sans key requise pour usage léger)
# Usage: bash scripts/pagespeed.sh https://exemple.com [mobile|desktop]

set -euo pipefail

URL="${1:-}"
STRATEGY="${2:-mobile}"

if [[ -z "$URL" ]]; then
  echo "Usage: $0 <https://domaine.com> [mobile|desktop]"
  exit 1
fi

API="https://www.googleapis.com/pagespeedonline/v5/runPagespeed"
RESP=$(curl -sG "$API" \
  --data-urlencode "url=$URL" \
  --data-urlencode "strategy=$STRATEGY" \
  --data-urlencode "category=performance" \
  --data-urlencode "category=seo" \
  --data-urlencode "category=accessibility" \
  --data-urlencode "category=best-practices")

echo "## PageSpeed — $URL ($STRATEGY)"
echo ""

if command -v jq >/dev/null 2>&1; then
  echo "**Scores (sur 100) :**"
  echo "- Performance     : $(echo "$RESP" | jq -r '.lighthouseResult.categories.performance.score * 100')"
  echo "- SEO             : $(echo "$RESP" | jq -r '.lighthouseResult.categories.seo.score * 100')"
  echo "- Accessibility   : $(echo "$RESP" | jq -r '.lighthouseResult.categories.accessibility.score * 100')"
  echo "- Best Practices  : $(echo "$RESP" | jq -r '.lighthouseResult.categories["best-practices"].score * 100')"
  echo ""
  echo "**Core Web Vitals (Lab) :**"
  echo "- LCP : $(echo "$RESP" | jq -r '.lighthouseResult.audits["largest-contentful-paint"].displayValue')"
  echo "- INP : $(echo "$RESP" | jq -r '.lighthouseResult.audits["interaction-to-next-paint"].displayValue // "N/A"')"
  echo "- CLS : $(echo "$RESP" | jq -r '.lighthouseResult.audits["cumulative-layout-shift"].displayValue')"
  echo "- TBT : $(echo "$RESP" | jq -r '.lighthouseResult.audits["total-blocking-time"].displayValue')"
  echo "- FCP : $(echo "$RESP" | jq -r '.lighthouseResult.audits["first-contentful-paint"].displayValue')"
else
  echo "jq non installé — sortie brute :"
  echo "$RESP"
fi
