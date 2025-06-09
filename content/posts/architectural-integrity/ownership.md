---
date: '2017-08-01'
title: 'Capability-based ownership model: avoiding responsibility fog'
---

In complex systems, technical ownership cannot be defined purely by components.  
It must be aligned with **capabilities** — the fundamental promises the system makes.

Otherwise, you don't just lose technical clarity.  
You generate **responsibility fog** — the silent killer of scale.

---

## What is responsibility fog?

Responsibility fog emerges when:

- It's unclear who owns a critical system behavior (e.g., user authentication, payment resilience)
- Ownership maps to services or modules, but not to business capabilities
- Accountability collapses during incidents: everyone owns it, therefore no one owns it

---

## The shift: from component to capability

| Old Paradigm | New Paradigm |
|--------------|--------------|
| Ownership by service boundaries | Ownership by capability boundaries |
| Focus on artifacts (APIs, codebases) | Focus on promises to users and systems |
| Technical debt is isolated | Technical debt is systemic and acknowledged |

---

## Core design principles

**Capabilities first, services second**

Define what the system must reliably do, regardless of how many services or teams are involved.

Example:

- Capability: *Ensure consistent user authentication under load*  
- Service split: Identity provider, session store, client SDKs

Ownership of the *capability* must be clear, even if services are distributed.

**Resilience ownership**

Capabilities must own their:

- Error budgets
- Degradation strategies
- Recovery playbooks

Not just their "happy path" behaviors.

**Clear upstream/downstream contracts**

Define clear expectations:

- What capabilities expect from upstream systems
- What they promise to downstream consumers

Formalize it in capability contracts, not just API docs.

## Capability map elements

| Capability | Owner | SLA/Resilience Guarantees | Degradation Behavior | Alarms & Telemetry |
|------------|-------|----------------------------|-----------------------|--------------------|

- Should be living documents
- Reviewed after major incidents
- Updated proactively during system evolution

---

## How it prevents responsibility fog

- Clarifies escalation paths during incidents
- Aligns incentives: teams own outcomes, not just outputs
- Enables graceful degradation instead of catastrophic cascades
- Makes architectural tradeoffs visible at capability (not service) level

---

## Reasoning trail

**Origin:**  

Synthesized from large-scale system resilience failures and fragmented incident ownership patterns (see: 
[Architectural risk drift]({{< relref "risk-drift.md" >}}), 
[Human-centric error budget charter]({{< relref "error-budget.md" >}})
).

**Trigger context:**  

- Multi-team firefighting with no clear accountability
- Major outages where no single team "felt" responsible for composite behaviors
- Overemphasis on "service ownership" without capability reflection

> **Core insight:** Capabilities are the real system boundaries. Services are just implementation details.

**Related artifacts:**  

- `Trustworthy Systems Thinking`  
- `Resilience Engineering Playbook`  
- `Strategic SLA and Capability Mapping`

**Likely evolution:** 

- Capability-driven organization design  
- Cross-functional capability health reviews

---

When systems scale, responsibilities must scale more intelligently. Capabilities show the way.
