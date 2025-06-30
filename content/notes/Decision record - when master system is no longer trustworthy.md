---
title: Master system trust loss
summary: When a master system becomes unreliable, downstream systems must enforce validation and shift from trust to control.
---

## Decision record: when master system is no longer trustworthy

Master systems are expected to act as sources of truth. When their behavior becomes inconsistent or ungoverned, the risk is not only local -- it propagates through every integration point.

## Symptoms of erosion

- Data contracts break without warning, e.g. mutated primary keys  
- Sensitive fields appear without governance or notice  
- Downstream systems apply compensations for upstream anomalies  
- Production exposes invalid assumptions about identity or consistency

## Why trust matters

Trust in master systems depends on a few core invariants:

- Identities remain stable  
- Keys are immutable unless versioned  
- Data semantics are consistent across consumers

When these break, silent faults spread across systems. The damage is architectural, not just operational.

## Decision summary

- Master system is now treated as a **semi-trusted input**  
- Validation boundaries are introduced at first point of integration  
- Responsibility for divergence risk is formally assigned to the master system team  
- Downstream systems are authorized to enforce safeguards, including record quarantine

## Consequences

- All integrations must apply validation explicitly  
- Operational cost rises, but resilience improves  
- Divergence risk becomes visible in incident reporting  
- Shift in team posture: trust must be earned, even by official systems

## Defensive patterns

- **Contract versioning**: integrations declare and enforce the version they support  
- **Trust window compression**: reduce cache time from master systems  
- **Anomaly fencing**: isolate records that fail validation instead of passing them silently

## Cross-links

- [Architectural risk drift](../essays/architectural-integrity/Architectural%20risk%20drift%20&%20role%20safety%20protocol.md)  
- [Human-centric error budget charter](../essays/architectural-integrity/Human-centric%20error%20budget%20charter.md)  
- [Capability mapping for trustworthy systems](../notes/Capability%20Mapping%20for%20Trustworthy%20Systems.md)  
- [Trustworthy evolution](../systems-under-drift/Trustworthy%20evolution.md)
