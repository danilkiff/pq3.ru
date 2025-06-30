---
title: Capability drift
summary: Long-lived systems degrade by losing critical abilities, not just through failures. Drift must be tracked and resisted.
---

## Capability drift: the hidden risk in long-lived systems

Long-lived systems rarely collapse at once. They lose relevance gradually, by eroding the capabilities that once made them effective. This decay is often masked by continued operation. The system still runs, but can no longer fulfill its purpose.

## What is capability drift

Capability drift is not performance degradation or error. It is the slow loss of fitness for purpose. It occurs when:

- the system adapts to outdated patterns and stops evolving  
- internal complexity increases, but external promises stay the same  
- team knowledge fades  
- context shifts, but system constraints do not

The interface remains. The function decays.

## How drift begins

Drift is not caused by a single mistake. It accumulates:

- Teams turn over, and context disappears  
- Temporary changes become permanent  
- Integration points are patched, not repaired  
- Stable systems lose budget, and maintenance stalls

The result is a widening gap between what the system claims and what it can deliver.

## Why drift is hard to detect

Drift hides behind normal behavior:

- APIs respond, but latency grows  
- Dashboards load, but show false signals  
- Jobs complete, but miss edge cases silently

These are not defects. They are signs the system is no longer trustworthy.

## Organizational signals of drift

Drift also appears in culture:

- Deployments slow down or stop  
- Core systems are no longer understood  
- Teams stop depending on formerly strong capabilities  
- New hires normalize the degraded state

The system decays quietly. Expectations adjust downward.

## Resisting drift

Drift can be slowed, but not avoided. It requires active countermeasures:

- **Capability inventories**: define the essential functions to protect  
- **Resilience markers**: track early signals of decay, such as  
  - time to restore lost capabilities  
  - time since last capability test  
  - ratio of maintained to abandoned interfaces  
- **Fitness functions**: automate tests for system behavior, not just uptime  
- **Stewardship mindset**: ownership must include context, not just control

## Meta-drift

Organizations degrade in the same way:

- Rigor gives way to throughput  
- Observability is replaced by reactive work  
- Leadership focuses on coordination, not excellence

By the time capabilities are needed, they may already be gone.

## Cross-links

- [Architectural integrity manifesto](../essays/architectural-integrity/Architectural%20integrity%20manifesto.md)  
- [Trustworthy evolution](../systems-under-drift/Trustworthy%20evolution.md)  
- [Organizational blind spot – no hypothesis culture](../essays/architectural-integrity/Organizational%20blind%20spot%20-%20no%20hypothesis%20culture.md)  
- [Alignment drift](../systems-under-drift/Alignment%20drift.md)
