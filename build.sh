#!/bin/bash
# Build script to create a single self-contained HTML file with inlined SVGs

echo "Building Fiserv_Dashboard.html..."

# Read the SVG files and prepare them for inline embedding
LOGO_SVG=$(cat logo.svg | tr -d '\n' | sed 's/"/\\"/g')
FAVICON_BASE64="data:image/svg+xml;base64,$(base64 -i favicon.svg | tr -d '\n')"

# Create the output file by processing dashboard.html
cp dashboard.html Fiserv_Dashboard.html

# Replace favicon reference with base64 data URI
sed -i '' "s|<link rel=\"icon\" type=\"image/svg+xml\" href=\"favicon.svg\">|<link rel=\"icon\" type=\"image/svg+xml\" href=\"${FAVICON_BASE64}\">|" Fiserv_Dashboard.html

# Replace img tag with inline SVG (preserving class and style)
sed -i '' 's|<img src="logo\.svg" alt="Dashboard" class="\([^"]*\)" style="\([^"]*\)">|<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48" class="\1" style="\2"><rect x="4" y="4" width="40" height="40" rx="6" fill="#3b82f6"><animate attributeName="opacity" values="0.7;1;0.7" dur="2s" repeatCount="indefinite"/></rect><rect x="10" y="10" width="10" height="10" rx="2" fill="#fff" opacity="0.9"><animate attributeName="opacity" values="0.6;0.9;0.6" dur="2s" begin="0s" repeatCount="indefinite"/></rect><rect x="24" y="10" width="10" height="10" rx="2" fill="#fff" opacity="0.9"><animate attributeName="opacity" values="0.6;0.9;0.6" dur="2s" begin="0.3s" repeatCount="indefinite"/></rect><rect x="10" y="24" width="10" height="10" rx="2" fill="#fff" opacity="0.9"><animate attributeName="opacity" values="0.6;0.9;0.6" dur="2s" begin="0.6s" repeatCount="indefinite"/></rect><rect x="24" y="24" width="10" height="10" rx="2" fill="#fff" opacity="0.6"><animate attributeName="opacity" values="0.3;0.6;0.3" dur="2s" begin="0.9s" repeatCount="indefinite"/></rect></svg>|' Fiserv_Dashboard.html

echo "✓ Created Fiserv_Dashboard.html"
echo "  - Inlined favicon as base64 data URI"
echo "  - Inlined logo SVG with animations"
echo "  - Single file ready to send!"
