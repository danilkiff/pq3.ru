---
date: 2017-03-01
title: "Decision record: when master system is no longer trustworthy"
summary: When a master system becomes unreliable, treat its data as semi-trusted, enforce validation, and shift to explicit contract and risk management for all integrations.
categories:
    - Architecture
tags:
    - master data
    - trust boundaries
    - validation
    - contract versioning
    - data integrity
    - risk management
---

Master systems are supposed to be the **source of truth**. But what happens when the truth shifts under your feet?
This record documents a critical organizational and architectural boundary:  

> What to do when a master system becomes an active source of systemic risk.

---

## Symptoms of master system erosion

- Breaking changes to contract without notice (e.g., primary key mutation)
- Introduction of sensitive attributes without governance
- Data anomalies requiring downstream compensations
- Trust-in-data assumption invalidated in production

---

## Why trust matters

Systems depending on master data operate under **trust axioms**:

- Identity is stable
- Keys are immutable (unless versioned)
- Data meaning is consistent across consumers

Once these axioms break, **all integrations** relying on them inherit invisible faults.

This isn’t just an operational issue — it’s a strategic one.

---

## Decision Record

### Context

- Master system changes caused cascading failures in downstream systems.
- There was no cross-team warning, versioning, or ownership acknowledgment.
- Incident investigations revealed fragile assumptions not recoverable at the integration layer.

### Decision

1. Master data is now considered a semi-trusted input.
2. Validation boundaries introduced at first point of entry.
3. Ownership of “risk of divergence” formally assigned to master system product team.
4. Downstream systems granted right to enforce defensive measures (e.g., quarantine dirty records).

### Consequences

- Extra validation logic now mandatory on all integrations
- Increased operational cost but higher resilience
- Visibility of master risk embedded into incident reporting
- Cultural signal: no blind trust, even for "official" sources

---

## Defensive Patterns Adopted

- **Contract versioning:** integrations must declare compatibility explicitly
- **Trust window compression:** minimize TTL of master-derived caches
- **Anomaly fencing:** suspect records are isolated automatically, not silently processed

---

## Reasoning Trail

**Origin:**

Developed after repeated production incidents traced to silent contract drift in master systems (see: 
*Cross-Domain Cookie Hygiene*, 
[Architectural risk drift]({{< relref "risk-drift.md" >}})
).

**Trigger context:**

- Re-identification vulnerabilities through mismanaged cookies  
- Data mutations causing unique constraint violations downstream  
- Business process assumptions invalidated mid-stream

> **Core insight:** If the trust boundary moves, the architecture must move with it.

**Related artifacts:** 

- [[Human-centric error budget charter]]
- **TBD**: Capability map: resilience surface  
- **TBD**: Strategic risk mapping in system design

**Likely evolution:**

- Part of broader **Trustworthy Systems Playbook**  
- Integration into **Dynamic SLA Frameworks** for evolving systems

---

Trust is cheap until it’s broken. Then it becomes your most expensive dependency.
