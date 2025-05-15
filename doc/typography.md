# Master Hotwire Typography

## Font Family
```css
font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
```
System font stack for optimal performance and native appearance.

## Type Scale
Typography follows a 1.25 (major third) scale ratio for systematic sizing relationships.

| Element | Desktop | Mobile | Weight | Letter Spacing | Color |
|---------|---------|--------|--------|---------------|-------|
| Body text | 1.125rem | 1rem | 400 | normal | #2d3748 |
| H1 | 3.5rem | 2.5rem | 800 | -0.025em | #1e3a8a |
| H2 | 2rem | 1.75rem | 700 | -0.01em | #2563eb |
| H3 | 1.5rem | 1.25rem | 600 | -0.01em | #2563eb |
| Small/Caption | 0.9em | 0.9em | normal | normal | #4b5563 |
| Navigation | 1.3rem | 1.2rem | bold | normal | inherit |

## Line Heights
- Body text: 1.75
- Extended reading: 1.8
- Headings: 1.2

## Content Specifications
- Paragraphs: 1.5rem margins, 65ch max-width
- Extended reading: 2rem margins, reduced width (60ch)
- Lists: Custom yellow bullet (#fbbf24), 0.75rem item spacing
- Blockquotes: Italic, dimmed color (#4b5563)

## Hierarchy Principles
1. **H1**: Main page titles, centered, bold with negative letter spacing
2. **H2**: Section headings, centered
3. **H3**: Subsection headings, left-aligned
4. **Body**: Primary content with generous line height
5. **Small text**: Secondary information (90% of base size)
6. **Links**: Accent color (#667eea) with hover animation

## Reading Context Guidelines
- Landing page: Standard settings as defined above
- Book reading mode: 
  - Increased line height (1.8)
  - Optional background color (#f8f9fa)
  - Increased paragraph spacing (2rem)
  - Optional font-size controls (80-120% scale)

## Accessibility
- Generous line heights improve readability
- WCAG AA contrast compliance
- Responsive sizing for all devices
- Optimal reading width (65ch max)
- Focus states: 2px solid accent outline with 2px offset

## Color Values
- Body text (ink-primary): #2d3748
- Primary headings (brand-primary): #1e3a8a
- Secondary headings (brand-secondary): #2563eb
- Accent color (accent): #667eea
- Dimmed/secondary text (ink-secondary): #4b5563
