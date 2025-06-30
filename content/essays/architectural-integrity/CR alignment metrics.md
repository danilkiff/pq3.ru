---
title: CR alignment metrics
summary: Defines a status-driven model to track TFA, TTS, TTM, and LT metrics across product workflows, exposing delays and improving delivery clarity.
---

## Purpose

This model structures Change Request (CR) workflows around clear status definitions to enable four critical metrics:

- **TFA**  --  Time from idea to alignment  
- **TTS**  --  Time to scheduling  
- **TTM**  --  Time to market  
- **LT**  --  Development lead time  

Each status has explicit readiness and completion criteria. Transitions between statuses anchor metric checkpoints and clarify workflow discipline.

## Status definitions

### 1. Draft

The idea exists but has not been introduced to the team.  
- No readiness or completion criteria  
- Not counted in cycle metrics  
- Used as a personal backlog for product owners

### 2. In Alignment

Objectives, constraints, and context are under analysis.  
- **Ready:** Idea described with a business rationale  
- **Done:** Agreed scope and trade-offs documented  
- **Metric anchor:** TFA = Draft → Alignment Done

### 3. Alignment Done

Idea is shaped and ready for prioritization.  
- **Ready:** Approved for estimation  
- **Done:** Added to estimation funnel  
- **Metric anchor:** TTS = Alignment Done → Ready for Estimation

### 4. Ready for Estimation

Prioritized for sizing and planning.  
- **Ready:** Scope and success criteria are clear  
- **Done:** Estimated and scheduled  
- **Metric anchor:** TTM starts here

### 5. In Progress

Active implementation of the request.  
- **Ready:** Team assigned, work decomposed  
- **Done:** Feature complete and ready to release  
- **Metric anchor:** LT starts here

### 6. Done

CR is released and validated in production.  
- **Metric completion:**  
  - LT = In Progress → Done  
  - TTM = Ready for Estimation → Done  

## Metric summary

| Metric | Range                             | Tracks                           |
|--------|-----------------------------------|----------------------------------|
| TFA    | Draft → Alignment Done            | Idea shaping time                |
| TTS    | Alignment Done → Ready for Estimation | Time to prioritization        |
| TTM    | Ready for Estimation → Done       | Time to market after readiness   |
| LT     | In Progress → Done                | Time spent in development        |

## Additional statuses

- **Blocked**  --  External input or alignment missing; temporary pause  
- **Cancelled**  --  Dropped from workflow intentionally  
- **Deferred**  --  Not prioritized; paused without active status

## Key takeaways

- Clarifies the boundary between raw ideas and actionable requests  
- Surfaces delivery bottlenecks before development begins  
- Measures decision maturity, not just implementation speed

Use this model to shift from reactive execution to deliberate, traceable product delivery.
