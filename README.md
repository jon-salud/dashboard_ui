# On The Same Page - Dashboard

> Real-time visibility. Shared accountability. One source of truth.

A responsive, single-file HTML dashboard for tracking test progress with editable KPIs, charts, milestones, and blockers. All data persists in your browser's localStorage.

## Features

### 📊 **Interactive Dashboard**

- **KPI Cards**: Test execution, pass rates, defects, and delays
- **Progress vs Plan**: Bar chart comparing planned vs actual progress
- **Burndown Chart**: Track remaining work over time with risk indicators
- **Milestone Heatmap**: Visual status tracking with completion percentages
- **Blockers**: Categorized blocker tracking with status indicators
- **Quick Facts**: Key metrics at a glance

### ✏️ **In-Browser Editing**

- Click the ✎ pencil icon on any card to edit
- Changes persist automatically to localStorage
- No server or database required

### 📥 **Import/Export**

- **CSV Import/Export**: Progress, Burndown, and Milestone data
- **Snapshot Export**: Generate a standalone HTML file with current data
- **Single-File Distribution**: Use `build.sh` to create `Fiserv_Dashboard.html`

### 🎨 **Design**

- Responsive grid layout
- Animated logo on page load
- Modal overlays with smooth animations
- Click outside or press Escape to close modals

## Quick Start

### View the Dashboard

```bash
open dashboard.html
```

### Edit Data

1. Click any ✎ pencil icon to edit that section
2. Make your changes
3. Click **Save** (data persists automatically)

### Build Single-File Version

```bash
./build.sh
```

This creates `Fiserv_Dashboard.html` - a completely self-contained file you can send anywhere.

## File Structure

```txt
dashboard-demo/
├── dashboard.html       # Main dashboard (editable source)
├── logo.svg            # Animated dashboard logo
├── favicon.svg         # Browser tab icon
├── build.sh            # Build script for single-file output
├── Fiserv_Dashboard.html  # Generated single-file (after build)
└── README.md           # This file
```

## Data Persistence

All data is stored in browser localStorage under the key `dashboard_demo_state_v1`:

- KPI values and counts
- Progress planned/actual percentages
- Burndown time series with risk metadata
- Milestone status, completion %, and risk levels
- Blockers and quick facts

**To reset:** Clear your browser data or open DevTools → Application → Local Storage → delete the key.

## CSV Format Reference

### Progress CSV

```csv
Phase,Planned,Actual
Test Design,95,92
Test Execution,85,68
UAT,80,40
```

### Burndown CSV

```csv
Date,Planned,Actual,Risk
2025-11-01,1000,1000,
2025-11-04,800,920,Medium
2025-11-07,600,780,High
```

### Milestone CSV

```csv
Milestone,Status,%Complete,Risk
Test Design,On Track,92,Low
Test Execution,Delayed,68,Medium
UAT,Critical,40,High
```

## Customization

### Change Colors

Edit CSS variables in the `<style>` section:

```css
:root{
  --bg:#f6f8fb;        /* Background */
  --card:#ffffff;      /* Card background */
  --accent:#3b82f6;    /* Primary blue */
  --success:#16a34a;   /* Green */
  --warning:#f97316;   /* Orange */
  --danger:#ef4444;    /* Red */
  --muted:#708096;     /* Muted text */
}
```

### Update Tagline

Find the header section and edit:

```html
<p style="...">Real-time visibility. Shared accountability. One source of truth.</p>
```

## Browser Compatibility

- Modern browsers (Chrome, Firefox, Safari, Edge)
- Requires JavaScript enabled
- LocalStorage support required for persistence

## License

Created for internal use. All rights reserved.

---

**Built with:** HTML, CSS Grid, Chart.js  
**Last Updated:** 25 Nov 2025
