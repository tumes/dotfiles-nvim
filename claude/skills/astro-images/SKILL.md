---
name: astro-images
description: Use when migrating sites to Astro or adding images to Astro components - enforces Image and Picture components over img tags, corrects misconceptions about remote image caching, and requires image() helper in content collections
---

# Astro Images

## Overview

**Always use `<Image />` or `<Picture />` from `astro:assets` instead of `<img>` tags.**

**Prefer `<Picture />` for responsive images** - it generates multiple sources for different viewport sizes and formats.

Remote images ARE cached and optimized at build time when domains are authorized. The `image()` helper in content collections enables this for collection data.

## Quick Reference

| Scenario | Correct | Wrong |
|----------|---------|-------|
| Responsive image | `<Picture src={img} formats={['avif','webp']} />` | `<img srcset="..." />` |
| Simple image | `<Image src={imported} />` | `<img src={imported.src} />` |
| Remote image | `<Image src="https://..." inferSize />` | `<img src="https://..." />` |
| Content collection image | `image()` helper | `z.string().url()` |
| Remote domain | Add to `image.domains` | Skip config |

## Component Choice

**Use `<Picture />` when:**
- Image appears at different sizes on different viewports
- You want automatic format fallbacks (AVIF → WebP → original)
- Hero images, banners, content images

**Use `<Image />` when:**
- Fixed size image (icons, logos, thumbnails)
- Single format is sufficient

```astro
---
import { Image, Picture } from 'astro:assets';
import hero from '../assets/hero.jpg';
import logo from '../assets/logo.png';
---

<!-- Responsive hero - prefer Picture -->
<Picture
  src={hero}
  formats={['avif', 'webp']}
  widths={[400, 800, 1200]}
  sizes="(max-width: 800px) 100vw, 800px"
  alt="Hero banner"
/>

<!-- Fixed logo - Image is fine -->
<Image src={logo} alt="Logo" width={120} />
```

## Critical Misconception

**WRONG:** "Remote/CDN images can't be optimized, keep as `<img>`"

**RIGHT:** When you authorize a domain in `image.domains`, Astro:
- Pulls remote images at build time
- Caches them locally
- Optimizes format (WebP/AVIF)
- Generates responsive srcsets

Remote images from authorized domains ARE processed exactly like local images.

## Dynamic/Non-Whitelisted URLs

Even for dynamic URLs from unknown domains (e.g., user avatars, external APIs):

**Still use `<Image />` with `inferSize`** - it prevents Cumulative Layout Shift (CLS) by fetching dimensions at build time, even without optimization.

```astro
<!-- Dynamic URL - still use Image, not img -->
<Image src={userAvatarUrl} alt="Avatar" inferSize />
```

You do NOT need to whitelist domains for CLS prevention - only for optimization.

## Required Patterns

### 1. Authorize Remote Domains

```javascript
// astro.config.mjs
export default defineConfig({
  image: {
    domains: ['cdn.example.com', 'images.unsplash.com'],
  },
});
```

### 2. Use Components for All Images

```astro
---
import { Image, Picture } from 'astro:assets';
import localImg from '../assets/photo.png';
---

<!-- Local image -->
<Picture src={localImg} formats={['avif', 'webp']} alt="Photo" />

<!-- Remote image (domain must be authorized) -->
<Image src="https://cdn.example.com/banner.jpg" alt="Banner" inferSize />
```

### 3. Always Use `image()` in Content Collections

```typescript
// src/content/config.ts
import { defineCollection, z } from 'astro:content';

const blog = defineCollection({
  schema: ({ image }) => z.object({
    title: z.string(),
    cover: image(),        // Local OR remote - both work
    thumbnail: image(),    // NOT z.string().url()
  }),
});
```

The `image()` helper:
- Works for local paths AND remote URLs
- Pulls remote images locally at build time
- Enables optimization for all images in collections

## Rationalization Table

| Excuse | Reality |
|--------|---------|
| "CDN images are already optimized" | Astro optimizes further (format, srcset). Use components. |
| "Remote images can't be processed at build time" | Wrong. Authorized domains ARE processed. |
| "`image.domains` is optional" | Required for remote image optimization. |
| "Just use `z.string().url()` for remote images" | Use `image()` - it handles remote URLs and caches them. |
| "`<Image />` is fine for everything" | Prefer `<Picture />` for responsive images. |
| "Dynamic URLs can't be whitelisted" | Use `<Image />` anyway - CLS prevention works without whitelisting. |
| "It's simpler to use `<img>`" | Never simpler - `<img>` causes layout shift. |

## Red Flags - STOP

If you catch yourself:
- Using `<img>` for ANY image
- Using `<Image />` where `<Picture />` with responsive sources would be better
- Using `z.string().url()` for image fields in schemas
- Skipping `image.domains` config for remote sources
- Thinking "CDN images don't need optimization"

**STOP. Use `<Picture />` or `<Image />` and `image()` helper instead.**
