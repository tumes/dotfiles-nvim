---
name: component-decomposition
description: Use when migrating complex React/Framer Motion components to vanilla implementations, or when building new interactive components - layers static markup, styling, CSS animations, then vanilla JS only where needed
---

# Component Decomposition Pattern

## Overview

Build interactive components in layers: static first, then styling, then CSS motion, then vanilla JS only for what CSS cannot do. Each layer is independently verifiable.

## When to Use

- Migrating React/Framer Motion components to framework-agnostic code
- Building new components with animations or scroll-linked behavior
- Reducing JavaScript bundle size by replacing libraries with CSS
- Any component where you're unsure what needs JS vs CSS

**Not for:** Simple static components, or when the framework (React, etc.) is required for the use case.

## The Four Layers

### Layer 1: Static Markup + Data

Get data flowing and markup rendered. No styling, no motion.

**Verify:** Content appears, structure is correct, data bindings work.

### Layer 2: Styling

Apply layout, colors, typography. If migrating, copy original CSS exactly.

**Verify:** Visual appearance matches target (ignoring motion).

### Layer 3: CSS Motion

Add entrance animations, hover states, transitions using CSS `@keyframes` and `transition`.

```css
.hero-jar {
  animation: hero-jar-entrance 800ms ease-out 300ms both;
}

@keyframes hero-jar-entrance {
  from { transform: scale(0); }
  to { transform: scale(1); }
}
```

**Verify:** Animations play correctly, timing matches original.

### Layer 4: Vanilla JS (Only If Needed)

Add JS only for behavior CSS cannot handle:
- Scroll-linked transformations
- Intersection Observer triggers
- Dynamic calculations based on viewport

```js
function updateParallax() {
  const y = Math.min((scrollY / 2000) * 500, 500);
  element.style.transform = `translateY(${y}px)`;
}
window.addEventListener('scroll', updateParallax, { passive: true });
```

**Verify:** Scroll/interaction behavior matches original.

## Migration Rule

When migrating from a legacy app:

1. **Original is source of truth** - Read the original file before writing anything
2. **Match exactly** - Same elements, classes, structure, ordering
3. **Vanilla JS mirrors original behavior** - Don't improve, don't enhance, match it

## Common Mistakes

| Mistake | Fix |
|---------|-----|
| Starting with JS | Start with static markup, add JS last |
| Using JS for entrance animations | CSS `@keyframes` with `animation-delay` |
| Using JS for hover effects | CSS `:hover` with `transition` |
| "Improving" during migration | Match original exactly, enhance later |
| Guessing what original did | Re-read the source file |

## Quick Reference

| Behavior | Use |
|----------|-----|
| Entrance animation | CSS `@keyframes` + `animation-delay` |
| Hover/focus states | CSS `:hover`, `:focus` + `transition` |
| Scroll-linked transform | Vanilla JS scroll listener |
| Viewport-triggered animation | CSS + Intersection Observer |
| State toggling (open/close) | Vanilla JS + CSS classes |
