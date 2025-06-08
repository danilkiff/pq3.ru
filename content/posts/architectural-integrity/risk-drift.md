---
date: '2016-12-01'
title: 'Architectural risk drift & role safety protocol'
---

In theory, everyone respects system boundaries.  

In practice, decisions made under pressure gradually reshape the architecture — without updating the risk model or the responsibility map.

This is architectural risk drift. It happens invisibly — until it doesn’t.

---

## What is architectural risk drift?

Architectural risk drift occurs when:

- System design changes are introduced implicitly (not recorded as ADRs)
- Risk boundaries shift without revisiting security, performance, or compliance concerns
- Ownership over constraints and guarantees becomes unclear
- Roles expected to "ensure safety" are not included in the critical path

---

## Typical failure mode

1. Product pushes a quick fix or extension
2. Analyst logs a change request but omits architectural implications
3. Engineer implements as scoped — perhaps even cleanly
4. Architect is asked to "fix the risk” post-hoc

This leads to a breakdown of role safety:  

> People are held responsible for systems they didn’t help shape.

---

## Symptoms of role drift

- Architects reviewing tickets after code is merged  
- No formal mapping of decisions to risk owners  
- Security/compliance handled as checklists, not design constraints  
- Engineers tasked with enforcing policies that were never clarified

---

## Role safety protocol

A system-level safeguard for preserving clarity and agency.

### 1. No silent extension of architectural surface

   - Any new dataflow, endpoint, or service domain must be recorded
   - If not recorded, it's not owned

### 2. Architecture review != code review

   - Reviews must happen before final design or task decomposition

### 3. All responsibilities must be traceable

   - "Who owns the downside?” should never be ambiguous  
   - Risks without owners are risks with guaranteed latency

### 4. Soft veto protocol

   - Architect has right to flag a feature as violating system boundaries
   - If override is needed, a risk assumption log must be updated

---

## Governance vs flexibility

This protocol isn’t bureaucracy. It’s a safety harness for autonomous teams. If your system is fast to evolve but slow to reflect those evolutions — risk becomes latent debt.

---

## Reasoning trail

**Origin:**  

Formulated in response to repeated architectural compromises without consultation, despite accountability being assigned after the fact (see: [Architectural Integrity Manifesto]({{< relref "manifesto.md">}}), *Feature Drift*).

**Trigger context:**

- Sensitive data introduced via features without cryptographic modeling  
- New responsibilities informally assigned through CRs  
- Risk mitigation retrofitted after incident instead of designed preemptively

> **Core insight:** Architectural clarity isn’t a one-time deliverable — it’s an active contract between roles.

**Related artifacts:**

- CTO thinking paradox
- Decision record: when master system is no longer trustworthy
- Human-centric error budget charter

**Likely evolution:**

- Will shape role alignment models in *Capability-based ownership design*
- Applies to incident command structures and resilience reviews

---

If you design for scale, design for safety.  
If you assign responsibility, assign agency with it.
