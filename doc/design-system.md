# Master Hotwire Design System

## 1. Typography
See [typography.md](typography.md) for specifications.

## 2. Spacing & Layout

| Name | Size | Use |
|------|------|-----|
| xs | 0.5rem | Small component padding |
| sm | 0.75rem | Button padding |
| md | 1rem | Standard spacing |
| lg | 1.5rem | Component padding |
| xl | 2rem | Section spacing |
| 2xl | 2.5rem | Major section spacing |
| 3xl | 3rem | Page section spacing |
| 4xl | 4rem | Major page spacing |

### Container Specifications
- Main content: 780px max-width
- Reading mode: 700px max-width
- Text blocks: 65ch max-width
- Default layout: Single column, centered
- Review grid: Auto-fit, minmax(300px, 1fr)

### Grid System
- Mobile: 8-column grid with 1rem gutters
- Desktop: 12-column grid with 1rem gutters
- Reading mode: No grid, focused single column

## 3. Components

### Containers
- **Reviews**: 1.5rem padding, 2rem gap, 8px radius, light shadow
- **CTA Box**: 1.5rem padding, 2rem bottom margin, 8px radius
- **HR**: 1px solid (#e2e8f0), 40% width, 4rem vertical margin
- **Reading container**: 2rem top/bottom padding, centered

### Buttons
- **Primary**: 0.75rem × 1.5rem padding, 0.5rem radius, accent color
- **Secondary**: Same padding, transparent background with accent border
- **Tertiary**: Text-only with underline on hover, no padding
- **States**:
  - Hover: -2px Y-offset, enhanced shadow (primary), background opacity 10% (secondary)
  - Active: Y-offset 0, no shadow
  - Focus: 2px solid accent outline with 2px offset

### Links
- Default: No underline, transparent 2px bottom border
- Hover: Visible bottom border with accent color
- Focus: 2px solid accent outline with 2px offset
- Navigation: 1.3rem size, bold weight

### Lists
- 0.75rem item spacing, 1.5rem left padding
- Custom yellow bullet (#fbbf24)

## 4. Colors

### Named Color System
| Name | Hex | Usage |
|------|-----|-------|
| ink-primary | #2d3748 | Main text |
| ink-secondary | #4b5563 | Secondary text |
| brand-primary | #1e3a8a | Primary headings |
| brand-secondary | #2563eb | Secondary headings |
| accent | #667eea | Interactive elements |
| surface | #ffffff | Page background |
| surface-alt | #f8f9fa | Component background |
| surface-reading | #f9f4e8 | Optional reading mode |
| highlight | #fbbf24 | Accent elements |
| divider | #e2e8f0 | Separators |
| shadow | rgba(0,0,0,0.1) | Shadows |

## 5. Visual Effects
- **Shadows**: Light (0 2px 4px, 10% opacity)
- **Hover shadow**: Stronger with vertical offset
- **Border radius**: 8px for containers, 0.5rem for buttons
- **Transitions**: 0.2s ease for all interactive elements

## 6. Z-index Scale
- Base content: 1
- Components: 10
- Navigation: 100
- Overlays/modals: 1000

## 7. Responsive Design
- Mobile breakpoint: <640px
- Component padding adjusts at breakpoints
- Typography scales down on mobile (see typography.md)
- Single column layout on mobile, optional grid on desktop

## 8. Reading Mode
- Container: 700px max-width
- Background: White or optional sepia (#f9f4e8)
- Increased paragraph spacing (2rem)
- Higher line height (1.8)
- Font size controls (80-120% scale)
- Minimal distractions (reduced UI elements)

## 9. Print Styles
- Serif font option for printed content
- Adjusted margins for paper media (1in)
- No background colors
- Full black text (#000000)
- Clear page breaks between sections
