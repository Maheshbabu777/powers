---
name: performance
description: Use when the user asks for performance work, optimization, or profiling.
---

# Performance

This skill is **on-demand**. Do not load it by default. Load it when:
- The user explicitly asks to improve performance
- The user reports slowness, high memory usage, or performance regression
- The user says "optimize", "speed up", "profile", or similar

## Core principle

**Measure first.** Do not guess at bottlenecks. Profile, identify the real problem, then fix it.

## Process

1. **Define the performance goal** — what should be faster, by how much, under what conditions?
2. **Measure the baseline** — capture current performance with numbers, not feelings
3. **Identify the bottleneck** — use profiling tools, not intuition
4. **Fix the bottleneck** — change one thing at a time
5. **Measure again** — confirm improvement with the same method
6. **Document** — what changed, before/after numbers, conditions

## Frontend Bottlenecks

| Area | What to check | Tools |
|---|---|---|
| Bundle size | Unused dependencies, tree-shaking, code splitting | webpack-bundle-analyzer, source-map-explorer |
| Rendering | Unnecessary re-renders, large DOM, layout thrashing | React DevTools Profiler, Chrome Performance tab |
| Network | Waterfall, uncompressed assets, missing caching | Chrome Network tab, Lighthouse |
| Images | Unoptimized, wrong format, missing lazy loading | Lighthouse, manual inspection |
| Fonts | Render-blocking, too many weights, no preload | Chrome Network tab |
| JavaScript | Long tasks blocking main thread, heavy computation | Chrome Performance tab |

## Backend Bottlenecks

| Area | What to check | Tools |
|---|---|---|
| Database | N+1 queries, missing indexes, large result sets | Query logs, EXPLAIN, ORM debug |
| API | Slow endpoints, unnecessary data fetching, no pagination | Request timing, profiler |
| Memory | Leaks, large allocations, unbounded caches | Memory profiler, heap snapshots |
| I/O | Synchronous file/network operations, missing connection pooling | Profiler, async analysis |
| Computation | Hot loops, redundant processing, missing caching | CPU profiler |

## Evidence to collect

- [ ] Baseline measurement (before) with conditions noted
- [ ] After measurement with same conditions
- [ ] What tool/method was used to measure
- [ ] What specific change was made
- [ ] Whether the improvement is statistically meaningful or just noise
- [ ] Any tradeoffs introduced (memory vs speed, complexity vs performance)

## Do

- Profile before optimizing
- Change one thing at a time and re-measure
- Consider whether the performance issue actually matters to users
- Look for the biggest wins first (80/20 rule)

## Don't

- Optimize without measuring
- Micro-optimize code that isn't the bottleneck
- Introduce complexity for marginal gains
- Assume "faster" without numbers to prove it
- Break correctness for performance without explicit agreement
