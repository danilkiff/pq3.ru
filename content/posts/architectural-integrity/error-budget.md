---
date: '2017-05-01'
title: 'Human-centric error budget charter'
---

Systems fail. People make mistakes. Organizations burn out trying to prevent both.

The goal of a human-centric error budget is simple: treat system reliability and human resilience as **coupled constraints**.

You don’t just budget failure for machines.
You budget recovery — and dignity — for people.

---

## Traditional error budgets (short version)

Classic SRE error budgets define:

- Acceptable downtime per quarter/year
- Breach = slowing or halting feature launches

Good for:  

- Technical risk management  
- Balancing velocity vs reliability

Bad for:  

- Understanding cognitive load  
- Supporting healthy team dynamics

---

## Why human-centric?

Because technical failures almost always intersect with human factors:

- Alert fatigue
- Context switching
- Incomplete handoffs
- Psychological safety erosion

Ignoring the human surface area of system reliability guarantees builds invisible debt — until you pay it all at once.

---

## Charter principles

**Failure tolerance extends to people.**

If your system can tolerate N failures per month, your people should be allowed N mistakes without punitive consequences.

**Error budgets allocate recovery time.**

Not just for services — for humans, too.

- Learning cycles
- Retrospective deep-dives
- Psychological decompression after major incidents

**Feedback loops are rights, not just obligations.**

Anyone involved in an incident has the right to:

- Challenge unclear responsibility boundaries
- Ask for post-incident coaching
- Trigger protocol improvements

**Error signals trigger team support, not just system escalation.**

If error rates spike, look at human workload, cognitive pressure, and safety cues — not just logs and traces.

---

## Human-centric metrics to track

- Post-incident cognitive load reports
- Recovery time per role (not just system MTTR)
- Psychological safety pulses after major incidents
- Rotation fatigue indexes for on-call schedules

---

## Tactical moves

- Introduce **soft landings** for critical failures (e.g., relay engineers, post-mortem buddies)
- Schedule **resilience calibration weeks** — slow features, sharpen fundamentals
- Embed **human failure modes** into incident simulations and tabletop exercises

---

## Reasoning trail

**Origin:**

Born from convergence of SRE operational debt, incident analysis, and team burnout signals (see: *Shift Handover Protocols*, *Resilience Engineering Threads*).

**Trigger context:**

- Incident resolution degrading after prolonged shift rotations
- Teams reluctant to own on-call because of cultural blame patterns
- Post-incident fatigue unacknowledged as reliability erosion factor

> **Core insight:** If you only budget for system failure, you eventually lose both system and team.

**Related artifacts:**

- `Resilience Engineering Playbook`  
- `Organizational Trust Maintenance Protocols`  
- [Architectural risk drift]({{< relref "risk-drift.md" >}})

**Likely evolution:**

- Tight integration with leadership retrospectives and talent management  
- Future design of **Team-Level SLA Frameworks**

---

Systems don't just need to heal. Teams do too.
