---
date: '2016-04-01'
title: 'R&D Prioritization Stack'
---

In R&D environments, prioritization is not just about value and effort — it’s about **risk**, **learning**, and **strategic irreversibility**.

This post outlines a multi-layered stack for evaluating what to build next when product certainty is low and architectural decisions are high-stakes.

---

## 🧱 Why R&D Is Different

Most prioritization frameworks (RICE, MoSCoW, WSJF) assume:

- You know your users
- Value can be estimated
- Success can be measured

In R&D, those assumptions often collapse.  
Instead, you’re working with:

- Incomplete context  
- Evolving constraints  
- Unknown interactions  
- Weak or delayed feedback loops

---

## 🧰 The R&D Prioritization Stack

Each layer answers a different kind of question.

### 1. **Hypothesis-driven framing**
> What belief are we testing?  
> What would invalidate this idea?

Use tools from Lean Startup, JTBD, and evidence mapping.  
Every request should be backed by an explicit assumption.

---

### 2. **Irreversibility analysis**
> What are the architectural or strategic costs of being wrong?

Borrowed from Amazon’s “one-way door” framing.  
If a decision is hard to undo (e.g., storage model, public API), treat it with elevated scrutiny.

---

### 3. **Downstream impact lens**
> If we build this, what complexity do we introduce?

This includes:
- Integrations
- Tech debt
- Stakeholder dependency loops
- Feedback silos

Track **non-obvious costs** — not just engineering effort.

---

### 4. **Bias-aware evaluation**
> Are we reacting to a distortion in perception?

Reinforces the *Bias-Aware Prioritization Framework*.  
Check for over-weighted complaints, single-point anecdotes, or political noise.

---

### 5. **Strategic alignment**
> Does this change unlock future work?  
> Is it in tension with our 12–18 month architecture?

Draws from Capability Mapping and Portfolio Thinking.  
Every prioritized item should ladder up to future system leverage.

---

## 📋 Example Question Flow

1. What is the hypothesis?  
2. How would we know it's wrong?  
3. What architecture does it force us into?  
4. What do we have to give up?  
5. Who benefits — and who doesn’t?  
6. What’s the opportunity cost?  
7. What **complexity debt** are we likely to incur?

---

## 🧭 Reasoning Trail

**Origin:**  
Arises from misfit between classic prioritization models and R&D reality (see: *Bias-aware Prioritization Framework*, *No Hypothesis Culture*).

**Trigger context:**  
- Product backlog filled with features, but no upstream reasoning  
- Architecture constantly shifting due to myopic request sequencing  
- Lack of alignment between short-term validation and long-term system shape

**Core insight:**  
→ *R&D work must be prioritized not only by value, but by **learning speed, reversal cost, and system impact.***

**Related artifacts:**  
- `Feature Drift & Responsibility Transfer`  
- `Thinking Rituals for Strategic Decomposition`  
- `Organizational Capability Map`

**Likely evolution:**  
- Will integrate with future models of **Dynamic Strategy Loop**  
- Could serve as an input for `Architectural Investment Reviews`

---

In R&D, building the wrong thing is expensive.  
But building the right thing too early is worse.
