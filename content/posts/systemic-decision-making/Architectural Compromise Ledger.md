---
date: 2016-04-01
title: Architectural compromise ledger
---

No real system is built without compromise.  But when compromises are undocumented, they become **landmines** for the future. A healthy architecture doesn’t avoid compromise — it **manages it transparently**.

---

## What is an architectural compromise ledger?

An **architectural compromise ledger** is a lightweight artifact that:

- Records conscious technical compromises  
- Explains their context, trade-offs, and expiry conditions  
- Enables future teams to reason about, revisit, and evolve past decisions

It’s not about assigning blame.  
It’s about preserving architectural memory.

---

## What to capture in the ledger

| Field | Purpose |
|-------|---------|
| **Decision ID** | Unique tag for reference |
| **Context** | What was happening when the decision was made |
| **Options Considered** | Alternatives that were evaluated |
| **Chosen Compromise** | What was selected and why |
| **Risks Accepted** | Known downsides acknowledged at the time |
| **Review Trigger** | Conditions under which this decision must be re-evaluated |
| **Status** | Active, Replaced, Retired |

---

## How to integrate the ledger

- **Keep it lightweight.** (A living Markdown table, not a formal document graveyard.)
- **Link to ADRs (Architecture Decision Records)** if available.
- **Update during postmortems** when compromises reveal themselves under stress.
- **Review periodically** during architecture guilds or quarterly technical reviews.

---

## Signs your ledger practice is healthy

- New team members can trace *why* certain tech choices exist.
- Incident responders find compromise context **before** they attempt emergency fixes.
- Tech debt is discussed **rationally**, not emotionally.

---

## What happens without it

| Symptom | Root Problem |
|---------|--------------|
| Surprising fragility in critical paths | Forgotten trade-offs |
| Overconfidence in system resilience | Hidden compromises |
| Architecture that "rotted" silently | No periodic compromise audits |

---

## Reasoning trail

**Origin:**  
Distilled from incident reviews, long-lived R&D projects, and late-stage rearchitecture pains (see: *Resilience Feedback Loops*, *Trustworthy Systems*).

**Trigger context:**  
- Rediscovering old "quick hacks" that turned into business-critical components
- Teams duplicating past mistakes due to forgotten constraints
- Blame cycles over technical debt that had rational origins

> **Core insight:** Architectural fragility often hides inside yesterday’s survival decisions.

**Related artifacts:**  
- `Trustworthy Systems Thinking`  
- `Systemic Decision Debt`  
- `Strategic SLA Mapping`

**Likely evolution:**  
- Ledger automation via PR templates or architecture bots  
- Expiry-driven decision debt cleanup sprints

---

You don't need perfect decisions.  
You need **traceable ones**.
