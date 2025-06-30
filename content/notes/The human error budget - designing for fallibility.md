---
title: Human error budget
summary: Designing systems that absorb human mistakes as predictably as hardware or software faults.
---

## Why it matters

Systems are built to handle server crashes and network failures. They rarely account for human mistakes. Yet human error is constant. Designing for it is essential for operational stability.

## Core idea

A human error budget accepts that people make mistakes and treats those mistakes as a design parameter. The focus shifts from avoidance to absorption. Key design questions become:

- What level of cognitive load is sustainable?
- How does the system behave when a human missteps?
- Where are the organizational buffers too narrow for error?

## Practical applications

**Budget allocation**

- Include expected human error in risk models and rollout plans.
- Plan recovery for procedural slips and mental overload, not just infrastructure faults.

**Design strategies**

- Default to safe failure rather than brittle prevention.
- Use architectures that allow rollback, isolation, and validation without blocking progress.
- Identify latent risks through walkthroughs and dry runs before incidents occur.

**Cultural practices**

- Shift from blame to system-level inquiry when failures happen.
- Track and learn from near-misses as signs of detection mechanisms working.

## Common pitfalls

Many teams respond to human error with misplaced precision. Four common traps:

- Punishing mistakes instead of reinforcing fault tolerance.
- Designing as if humans were deterministic components.
- Ignoring the cognitive effects of stress during incident handling.
- Applying identical safeguards to all engineers regardless of experience level.

These are avoided by building guardrails that align with real human behavior, not idealized models.

## Reasoning trail

The idea builds on safety engineering and human factors research. It extends the SRE concept of error budgets from systems into people. Errors are treated as signals, not exceptions.

Referenced indirectly:

- *Field Guide to Understanding Human Error* by Sidney Dekker
- *Resilience Engineering* by Erik Hollnagel et al.
- *The Design of Everyday Things* by Don Norman
