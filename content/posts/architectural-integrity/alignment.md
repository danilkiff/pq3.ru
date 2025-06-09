---
title: CR alignment metrics
date: 2017-01-04
summary: Defines CR workflow statuses to enable TFA, TTS, TTM, LT metrics—clarifying bottlenecks, readiness, and delivery discipline in product engineering.
categories:
    - Process
tags:
    - change request
    - workflow
    - metrics
    - TFA
    - TTS
    - TTM
    - LT
    - ticket statuses
    - product maturity
---

## Purpose

Establish a status-driven model for Change Request tickets to enable actionable metrics on product maturity and delivery cycle: 

- TFA (time from idea to alignment), 
- TTS (time to scheduling), 
- TTM (time to market), 
- LT (lead time). 

The model defines explicit statuses, readiness/done criteria, metric checkpoints, and workflow transitions.

---

## Statuses and definitions

### 1. Draft

Idea captured; not yet introduced to the team.

- **Definition of Ready:** N/A
- **Definition of Done:** N/A  

_Excluded from all cycle metrics. Serves as a personal TODO for the product owner._

### 2. In Alignment

Business and systems analysis in progress; clarifying objectives and constraints.

- **Definition of Ready:** Idea formally described; initial business need identified.
- **Definition of Done:** Agreed scope, constraints, and rationale documented.

_Metric: TFA (time from idea to alignment) = Draft → Alignment Done_

### 3. Alignment Done

Idea formalized; ready for planning and decomposition.

- **Definition of Ready:** Scope approved for estimation.
- **Definition of Done:** Transitioned to estimation funnel.

_Metric: TTS (time to scheduling) = Alignment Done → Ready for Estimation_

### 4. Ready for Estimation

Accepted into the team's prioritized estimation queue.

- **Definition of Ready:** Clear scope and success criteria available.
- **Definition of Done:** Estimation completed and scheduled.

_Metric: TTM (time to market) **starts here**_

### 5. In Progress

Change Request actively in development.

- **Definition of Ready:** Team assigned, work breakdown created.
- **Definition of Done:** Development completed, changes ready for release.

_Metric: LT (lead time) **starts here**_

### 6. Done

CR shipped; changes deployed to production.

- **Definition of Ready:** N/A
- **Definition of Done:** Changes validated in production.

_Metric: LT (lead time) = In Progress → Done_  
_Metric: TTM (time to market) = Ready for Estimation → Done_

---

## Metrics overview

| Metric | Calculation                           | Description                                  |
| ------ | ------------------------------------- | -------------------------------------------- |
| TFA    | Draft → Alignment Done                | Time from idea capture to completed analysis |
| TTS    | Alignment Done → Ready for Estimation | Delay until prioritized for planning         |
| TTM    | Ready for Estimation → Done           | True time to market                          |
| LT     | In Progress → Done                    | Development lead time                        |

---

## Additional statuses

* **Blocked:** (any stage) — Requires re-alignment or external input
* **Cancelled:** (by analyst/architect) — Dropped from workflow
* **Deferred:** (not prioritized) — Idea on hold, not moving forward

---

## Key takeaways

* This workflow distinguishes **raw idea streams** from mature, actionable requests.
* Metrics expose bottlenecks long before development starts.
* Performance is measured not just by speed, but by structural discipline and clarity in product decision-making.

Use this model to move from reactive “ticket handling” to a structured, metric-driven product engineering process.

