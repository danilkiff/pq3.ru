---
title: R&D prioritization stack
summary: R&D prioritization requires framing around risk, learning, and irreversibility -- not just value and effort.
---

## Why it matters

Traditional prioritization frameworks assume known value, stable constraints, and reliable feedback. R&D work violates all three. In uncertain environments, prioritization must account for risk exposure, learning potential, and the long-term consequences of architectural decisions.

## Why R&D is different

Common frameworks like RICE or MoSCoW rely on:

- Clear knowledge of user needs  
- Measurable value  
- Short feedback loops

R&D work often involves:

- Incomplete context  
- Fluid or emerging constraints  
- High-impact architectural commitments  
- Delayed or weak feedback loops

These conditions require a different lens.

## The R&D prioritization stack

A layered approach helps teams evaluate decisions through multiple perspectives:

### 1. Hypothesis framing

Ask:

- What belief are we testing?  
- What would invalidate it?

Use tools like assumption mapping or lean hypothesis templates. Every request must be anchored in a testable assumption.

### 2. Irreversibility analysis

Identify:

- What becomes difficult or costly to undo?

Apply the “one-way door” heuristic. Architectural choices such as API design or storage models need extra scrutiny due to their long-term lock-in.

### 3. Downstream impact lens

Evaluate:

- What complexity does this introduce?

Account for hidden costs:

- Integration overhead  
- Cross-team dependencies  
- Tech debt  
- Feedback silos

Surface long-tail complexity early.

### 4. Bias-aware evaluation

Check:

- Are we reacting to anecdotal or distorted inputs?

Integrate with bias-detection patterns to reduce perception-based errors in roadmap planning.

### 5. Strategic alignment

Ask:

- Does this enable future capabilities?  
- Is it coherent with long-term architecture?

Prioritize based on system leverage and alignment with 12–18 month trajectories.

## Example question flow

- What’s the hypothesis behind this feature?  
- How will we know it failed?  
- What architectural posture does it impose?  
- What trade-offs or delays will it create elsewhere?  
- Who gains, who absorbs the cost?  
- What kind of debt are we accumulating?

## Reasoning trail

This stack emerged from repeated mismatches between standard prioritization models and the real constraints of R&D work. Roadmaps filled with under-framed features caused architectural churn and value misalignment.

Referenced works:

- *Working Backwards* by Colin Bryar and Bill Carr  
- *The Lean Startup* by Eric Ries  
- *Escaping the Build Trap* by Melissa Perri

The core insight: R&D prioritization is about learning fast, avoiding irreversible mistakes, and preserving system adaptability. 
