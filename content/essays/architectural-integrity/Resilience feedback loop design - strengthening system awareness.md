---
title: Resilience feedback loops
summary: Resilient systems rely on strong, fast, and cumulative feedback loops -- without them, learning lags behind failure.
---

## Why it matters

Resilient systems don’t just react -- they adapt. Feedback loops enable that adaptation. Every incident, regression, or performance dip is a potential input for improvement. Without structured feedback, systems decay instead of evolve.

## What makes a feedback loop

A complete loop has five parts:

- **Signal**  --  A meaningful event triggers attention (e.g., error spike, escalation, degraded performance)
- **Pathway**  --  The signal travels through tools and rituals (e.g., alerts, incident reviews)
- **Receiver**  --  Someone must hear it -- and be empowered to act
- **Response**  --  A decision is made: fix, ignore, escalate, or capture
- **Learning storage**  --  The outcome is documented or lost

A loop that misses any of these steps weakens over time.

## How to measure feedback strength

Assess using four criteria:

- **Latency**  --  How quickly does the signal reach those who can act?
- **Accuracy**  --  Does it reflect the true state of the system or user?
- **Empowerment**  --  Can the receiver respond with impact?
- **Amplification**  --  Does the response reinforce future behavior or resilience?

Strong loops are fast, relevant, actionable, and cumulative. Weak loops are slow, unclear, disempowered, and forgettable.

## Design patterns

1. **Human-aware error budget reviews**  
   Include human contributors -- not just SLO breaches. Track alert fatigue, unclear ownership, and procedural erosion.

2. **Postmortems with memory pathways**  
   Ensure incident lessons update:
   - Capability playbooks  
   - System design guides  
   - Onboarding material  
   - Observability tooling

3. **Real-time incident relays**  
   Use structured shadowing or relay roles to:
   - Preserve incident context across shifts  
   - Catch fragile handoffs  
   - Record emergent design gaps

4. **Engineering health signals**  
   Monitor signals beyond incidents:
   - PR latency  
   - Bounce between ticket and implementation  
   - Rework frequency  
   - Misalignments caught during code review

These patterns shift feedback from reactive patching to structural learning.

## Reasoning trail

The approach emerged from incident reviews where the same mistakes repeated. Dashboards showed no alarms. Teams disengaged. Organizational memory was shallow. Feedback existed -- but was fragmented, late, or unactioned.

Referenced works:

- *How Complex Systems Fail* by Richard Cook  
- *Site Reliability Engineering* by Beyer et al.  
- *Drift into Failure* by Sidney Dekker

The core insight: resilient systems don’t just resist failure -- they learn faster than they break.

