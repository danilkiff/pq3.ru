---
date: 2017-04-01
title: R&D prioritization stack
summary: R&D prioritization must weigh risk, learning, irreversibility, bias, and alignment—not just value—to avoid costly mistakes and guide high-stakes architectural decisions.
categories:
  - Prioritization
tags:
  - prioritization
  - hypothesis
  - irreversibility
  - architecture
  - bias
  - alignment
  - learning
---

In R&D environments, prioritization is not just about value and effort — it’s about **risk**, **learning**, and **strategic irreversibility**.

This post outlines a multi-layered stack for evaluating what to build next when product certainty is low and architectural decisions are high-stakes.

---

## Why R&D is different

Most [prioritization frameworks](https://en.wikipedia.org/wiki/Requirement_prioritization) (RICE, MoSCoW, WSJF) assume:

- You know your users
- Value can be estimated
- Success can be measured

In R&D, those assumptions often collapse. Instead, you’re working with:

- Incomplete context  
- Evolving constraints  
- Unknown interactions  
- Weak or delayed feedback loops

---

## The R&D prioritization stack

Each layer answers a different kind of question.

**Hypothesis-driven framing**

- What belief are we testing?  
- What would invalidate this idea?

Use tools from Lean Startup, JTBD, and evidence mapping. Every request should be backed by an explicit assumption.

**Irreversibility analysis**

- What are the architectural or strategic costs of being wrong? 

Borrowed from Amazon’s “one-way door” framing. 
If a decision is hard to undo (e.g., storage model, public API), give it extra attention.

**Downstream impact lens**

* If we build this, what complexity do we introduce?

This includes:
- Integrations
- Tech debt
- Stakeholder dependency loops
- Feedback silos

Track **non-obvious costs** — not just engineering effort.

**Bias-aware evaluation**

- Are we reacting to a distortion in perception?

Reinforces the [[Bias-aware prioritization framework]]. 

**Strategic alignment**

- Does this change unlock future work?  
- Is it in tension with our 12–18 month architecture?

Draws from Capability Mapping and Portfolio Thinking. Every prioritized item should ladder up to future system leverage.

---

## Example Question Flow

- What is the hypothesis?  
- How would we know it's wrong?  
- What architecture does it force us into?  
- What do we have to give up?  
- Who benefits — and who doesn’t?  
- What’s the opportunity cost?  
- What **complexity debt** are we likely to incur?

---

## Reasoning Trail

**Origin:**

Arises from misfit between classic prioritization models and R&D reality (see: [[Bias-aware prioritization framework]], [[Organizational blind spot - no hypothesis culture]]).

**Trigger context:**

- Product backlog filled with features, but no upstream reasoning  
- Architecture constantly shifting due to myopic request sequencing  
- Lack of alignment between short-term validation and long-term system shape

> **Core insight:** *R&D work must be prioritized not only by value, but by **learning speed, reversal cost, and system impact.**

**Related artifacts:**

- [[Feature drift & responsibility transfer]]
- **TBD:** Thinking Rituals for Strategic Decomposition
- **TBD:** Organizational Capability Map

**Likely evolution:**

- Will integrate with future models of `Dynamic Strategy Loop`  
- Could serve as an input for `Architectural Investment Reviews`

---

In R&D, building the wrong thing is expensive. But building the right thing too early is worse.
