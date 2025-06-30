---
title: Mental models
summary: Mental models shape how teams reason and act. Treat them as infrastructure -- versioned, monitored, and maintained.
---

## Mental models are infrastructure

Mental models define how teams perceive, interpret, and respond to systems. They shape what is seen as normal, what is considered possible, and how risks are evaluated. Like code or networks, they require deliberate design and upkeep.

## Cognitive stack

The most critical part of infrastructure is often invisible:

- models and metaphors  
- framing of defaults and constraints  
- assumptions about what “works”

Neglecting this layer leaves risks undetected and limits system improvement.

## Mental models as control plane

Team behavior is driven by shared mental frames:

- how incidents are diagnosed  
- how complexity is judged  
- how tradeoffs are evaluated  
- how success and failure are imagined

If models remain unexamined, systemic issues persist -- even after tooling or process changes.

## Why this matters

Failures often begin as model divergence:

- different meanings assigned to the same term (e.g. "latency")  
- misaligned security frames (perimeter vs. lifecycle)  
- inconsistent views on platform purpose (UX vs. enablement)

These are architectural mismatches at the cognitive level.

## The full infrastructure stack

- **Physical**: hardware, networks  
- **Logical**: protocols, services  
- **Software**: interfaces, applications  
- **Cognitive**: frames, analogies, reasoning patterns  
- **Cultural**: norms, defaults, habits

Cognitive layers require:

- **Maintenance**: retire outdated models  
- **Monitoring**: surface assumptions in reviews and retros  
- **Versioning**: evolve shared language and frames as the system matures

## Practices for managing cognitive infrastructure

- **Expose the model**: document core assumptions in design and onboarding  
- **Detect collisions**: use reviews to surface diverging frames  
- **Build shared libraries**: curate diagrams and analogies used in team reasoning  
- **Signal model shifts**: when the org changes, make the mental shift visible too

## Cross-links

- [Trustworthy evolution](../systems-under-drift/Trustworthy%20evolution.md)  
- [Decision hygiene for technical leaders](../notes/Decision%20hygiene%20for%20technical%20leaders.md)  
- [Growth dynamics](../systems-under-drift/Growth%20dynamics.md)  
- [Alignment drift](../systems-under-drift/Alignment%20drift.md)
