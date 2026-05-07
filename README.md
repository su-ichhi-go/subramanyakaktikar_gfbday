# Happy Birthday Website — Production Edition

A beautiful, interactive birthday celebration with full cross-platform button support, pointer-event-based interactions, ripple effects, and optimised performance.

## 🚀 How to Run

### Windows
1. Double-click `start_server.bat`
2. Open your browser: `http://localhost:8000/index.html`

### macOS / Linux
```bash
cd /path/to/birthday-website
python -m http.server 8000
# Open: http://localhost:8000/index.html
```

### iOS / Android
- Upload to a web host (Netlify, GitHub Pages, etc.) or use a local server app.
- Images require HTTP — opening the HTML file directly won't load them.

## 📂 File Structure

```
/
├── index.html          ← Main experience (all scenes)
├── poker-cards.html    ← Poker card photo gallery
├── newbday.html        ← Birthday cake (mic blow detection)
├── style.css           ← Pixel-art cake animation keyframes
├── start_server.bat    ← Windows quick-start
└── images/
    ├── image1.jpeg … image12.jpeg   (slideshow)
    └── image13.jpeg … image20.jpeg  (poker cards)
```

## ✅ What Was Fixed

### Button Interactivity (All Platforms)
- **Replaced** all `onclick=""` inline handlers and fragmented click/touch listeners with a unified pointer-event architecture (`pointerdown`, `pointerup`)
- **Added** `.btn-interactive` — a reusable button class with:
  - Ripple effect on every press
  - `data-pressed` active state (works on iOS Safari, Android Chrome, Windows)
  - Minimum 48px touch target (WCAG AA)
  - `focus-visible` keyboard ring
  - `Space` / `Enter` keyboard activation
  - Disabled state styling
- **Removed** hover-only transforms on touch devices via `@media (hover: hover)`
- **Fixed** event listener loss after DOM updates — all buttons wired by ID after render, ripples re-attached on scene transitions
- **Fixed** z-index blocking — popup close button always sits above image
- **Fixed** iOS tap delay — `touch-action: manipulation` and `-webkit-tap-highlight-color: transparent` on all interactive elements
- **Added** `stopPropagation` where needed to prevent event bubbling through overlays

### Image Loading
- Graceful fallback placeholder when images fail (file:// protocol)
- `onerror` handler swaps to a styled placeholder, not a broken icon

### Poker Cards
- Drag vs. tap correctly distinguished by `DRAG_THRESHOLD`
- Pointer capture prevents ghost events on fast swipes
- Snap-back animation restores transition after drag release
- Hover lift only fires on non-drag, desktop devices

### Birthday Cake (newbday.html)
- Mic permission now shows a retry button if denied
- Candle flame uses CSS `::before` pseudo-element (no extra DOM nodes)
- Blow detection threshold preserved from original

### Performance
- Canvas animations disabled on touch/mobile (stars, aurora, particles)
- `prefersReducedMotion` check gates non-essential animations
- `passive: true` on all scroll/touch/pointer listeners
- `will-change: transform` only on animated elements

### Accessibility
- `aria-label` on all buttons and interactive elements
- `aria-modal`, `aria-hidden`, `role="dialog"` on popup
- `role="timer"` on countdown, `role="tablist"` on slide dots
- Keyboard navigation through all scenes
- `focus()` moved to close button when popup opens
