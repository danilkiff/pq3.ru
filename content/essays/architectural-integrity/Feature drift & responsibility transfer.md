---
title: Feature drift
summary: Feature drift occurs when implementation diverges from intent and accountability shifts to those without decision-making input.
---

## Why it matters

A feature begins with a clear intent. Over time, scope shifts, assumptions decay, and by the time it ships, the outcome no longer reflects the original goal. This is feature drift. It often ends with retroactive blame placed on people who never had upstream influence.

## What is feature drift

Feature drift is marked by three failure conditions:

- The implementation diverges from the intended purpose  
- No one detects the misalignment during delivery  
- Responsibility is reassigned after the fact, often unfairly

It reflects more than process flaws  --  it signals cultural gaps in alignment, ownership, and traceability.

## Typical failure pattern

1. Product or leadership adds a loosely scoped item to the backlog  
2. Analyst fills in detail based on assumption, not shared understanding  
3. Engineers build the ticket as written, despite unclear signals  
4. Final delivery disappoints, and responsibility is traced backward to delivery teams

This creates a delivery illusion  --  movement without clarity.

## Structural causes

- Backlog used as a todo queue rather than a hypothesis funnel  
- No formal checkpoints for strategic alignment  
- Disconnect between responsibility and actual decision-making  
- No clear trace from idea through analysis to implementation

These factors erode the reliability of product execution.

## Cultural red flags

- “Just follow the spec” replaces active alignment  
- Stakeholders disengage from grooming and expect full fidelity from documentation  
- Engineers penalized for faithful delivery of flawed inputs  
- Retrospectives assign blame without acknowledging process gaps

These signs indicate a lack of shared responsibility for meaning.

## Prevention strategies

1. **Formalize alignment as a status**  
   Use `In Alignment` as a required phase with clear definition of done.

2. **Trace decisions to origin**  
   Tie each feature to its initiating context and owner. Make drift visible and attributable.

3. **Enable dual traceability**  
   Connect features to both business intent and implementation responsibility.

4. **Reject decoupled accountability**  
   No one should be accountable for outcomes they had no voice in shaping.

These moves align execution with decision ownership and make systemic misalignment visible before delivery.

## Reasoning trail

This model emerged from repeated product failures where implementation followed direction but missed intent. Blame was assigned to delivery roles without addressing gaps in strategic alignment or decision clarity.

Referenced works:

- *The Lean Product Playbook* by Dan Olsen  
- *Turn the Ship Around!* by L. David Marquet  
- *Thinking in Systems* by Donella Meadows

The key insight: shallow alignment leads to downstream misfires. Responsibility must follow influence, not just implementation.
