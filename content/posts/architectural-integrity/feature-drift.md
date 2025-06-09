---
date: '2017-02-01'
title: 'Feature drift & responsibility transfer'
---

You planned a feature. You scoped it. You reviewed it. Two months later, the feature is still shipping — but what’s being built no longer resembles the original intent.

You’re facing **feature drift**. Worse, you’re blamed for the outcome — even though you never owned the decision.

---

## What is feature drift?

Feature drift occurs when:

- **The implementation diverges** from the original intent  
- **No one notices** until delivery or postmortem  
- **Responsibility is transferred retroactively** to someone who wasn’t in the loop

This is not just a process flaw. It’s a **cultural indicator** that strategic alignment is broken.

---

## Typical pattern

- Backlog item added by product or leadership — often under-specified
- Analyst fills in the blanks, sometimes missing deeper context
- Engineering implements "as specified", even when signals suggest misalignment
- Result disappoints, root cause is **traced backward**, often unfairly

> This creates the illusion of continuous delivery — while actual product value regresses.

---

## Structural causes

- Misuse of backlog as a **todo list** instead of a hypothesis funnel
- Lack of **definition of alignment** or review checkpoints
- **Separation of role and responsibility** (e.g., architect accountable but not consulted)
- Absence of **status traceability** from idea → alignment → analysis → estimate

---

## Cultural red flags

- “Just follow the spec” mindset  
- Stakeholders skipping grooming and relying on documentation alone  
- Engineering penalized for implementing the written word, not the intended outcome  
- **Retrospective justification**: “You should have spoken up sooner”

---

## How to prevent it

**Formalize alignment as a change request status**. 

Status = `In Alignment`, with explicit Definition of Done

**Link change requests to origin and risk**.

Tie tech debt to its originating decision. Make drift visible.

**Create dual traceability**.

From strategic objective to feature. From implementation to owner of intent.

**Refuse decoupled accountability**

No one is “responsible” without decision-making input

---

## Reasoning trail

**Origin:**  

Synthesized from real-world product and architecture conflicts in which engineers executed tasks that diverged from initial vision (see: [CTO thinking paradox]({{<relref "paradox.md">}}), [Architectural integrity manifesto]({{<relref "manifesto.md">}})).

**Trigger context:**

- Architect asked to explain delays caused by last-minute feature redirection  
- Team shipped work based on spec, then blamed when value was unclear  
- No shared understanding of what “done” meant across roles

> **Core insight:** Feature drift happens when alignment is shallow and responsibility is late.

**Related artifacts:** 

- [Architectural Risk Drift & Role Safety Protocol]({{<relref "risk-drift.md">}})
- `Thinking Rituals for Incident Coordination`  
- `Capability Map: Feature Delivery System`

**Likely evolution:** 

- This will be extended into `Ticket Status Design for Alignment Tracking`  
- Influences future models of `Strategic Feedback Compression`

---

You can’t own outcomes if you never owned the upstream choices. And you shouldn’t be asked to.
