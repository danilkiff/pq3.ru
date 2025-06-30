---
title: Human-centric error budgets
summary: Couple system reliability with human resilience -- budget recovery for both machines and people to reduce burnout and hidden operational debt.
---

## Why it matters

Systems fail. People make mistakes. Reliability efforts that ignore the human dimension accumulate invisible debt. A human-centric error budget treats technical uptime and team resilience as interdependent constraints. Both require deliberate protection.

## Traditional error budgets

Standard SRE models define acceptable failure windows (e.g. uptime targets) and throttle delivery when exceeded. These budgets help manage trade-offs between velocity and stability.

What they miss:

- Team cognitive load  
- Fatigue from frequent or high-pressure incidents  
- Psychological and operational recovery costs

## Why human-centric matters

Technical failure often overlaps with:

- Alert fatigue  
- Ambiguous handoffs  
- Cognitive overload  
- Loss of psychological safety

Without budgeting for human factors, teams erode quietly -- even when systems appear stable.

## Charter principles

1. **Failure tolerance must include people**  
   Teams should be allowed a margin of error without fear of blame. Reliability must include behavioral safety.

2. **Error budgets must include recovery time**  
   Allocate time for reflection, decompression, and learning -- not just patching and analysis.

3. **Feedback loops are a right**  
   Anyone involved in incidents should be able to challenge unclear roles, request coaching, or prompt system/process changes.

4. **Incident signals must trigger team support**  
   When failure rates rise, investigate team load and coordination -- not just system logs.

## Human-centric metrics

- Post-incident cognitive load assessments  
- Recovery duration by role or function  
- Psychological safety pulses after major events  
- On-call fatigue indicators

These metrics reveal the human cost of reliability and help sustain long-term operational health.

## Tactical practices

- Use **relay engineers** or **incident buddies** during critical recovery  
- Designate **resilience weeks** to slow down and reinforce fundamentals  
- Simulate incidents with **human error modes**, not just technical ones

These shifts reduce reactivity and strengthen team readiness.

## Reasoning trail

This approach emerged from operational patterns where teams absorbed failure beyond system thresholds -- without visibility or relief. On-call reluctance, post-incident fatigue, and coordination breakdowns revealed gaps in how reliability was defined and managed.

Referenced works:

- *Site Reliability Engineering* by Beyer et al.  
- *The Field Guide to Understanding Human Error* by Sidney Dekker  
- *Resilience Engineering* by Hollnagel et al.

The core insight: budgeting only for technical failure leads to system fatigue and team attrition. Reliability is a shared surface -- both mechanical and human.
