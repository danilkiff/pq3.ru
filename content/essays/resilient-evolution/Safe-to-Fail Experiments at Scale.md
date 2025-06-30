---
title: Safe-to-fail experiments
summary: How to design experiments that fail safely, detect early, and build system resilience through controlled risk.
---

## Why it matters

Resilient systems do not aim to eliminate failure. They engineer it in controlled ways. Safe-to-fail experiments create space to learn, improve, and adapt without triggering large-scale harm.

## What defines a safe-to-fail experiment

- **Small-scale**: Designed with strict blast radius limits.
- **Observable**: Instrumented for fast signal detection.
- **Reversible**: Includes tested rollback paths.
- **Hypothesis-driven**: Framed with clear criteria for success and failure.

Failure in this context produces actionable information, not damage.

## Practices that support safe-to-fail culture

- **Fail small**: Use feature flags, dark launches, and shadow traffic to limit exposure.
- **Fail early**: Instrument deployments with tight feedback loops.
- **Fail transparently**: Share outcomes openly, regardless of result.
- **Fail with learning**: Focus postmortems on what was revealed, not just what happened.

## Techniques in use

- **Chaos engineering** introduces controlled failures to test system response.
- **Canary deployments** limit exposure by releasing to small groups first.
- **Dark launches** deploy inactive code to observe impact before activation.
- **Synthetic traffic** simulates real load in safe environments.

These methods allow testing at scale without uncontrolled risk.

## Unsafe experimentation patterns

Common failure modes include:

- Shipping large, untested changes directly to production.
- Operating without pre-validated rollback paths.
- Ignoring alerts during low-risk phases.
- Treating experiments as validations rather than discovery tools.

These patterns erode confidence and raise system risk over time.

## Metrics for healthy experimentation

- **Time to detect experiment impact** shows observability quality.
- **Rollback success rate** reflects recovery readiness.
- **Learnings per experiment** reveals how well failure is being used to improve.

Monitoring these helps reinforce the feedback loop between design and outcome.

## Guardrails for operating at scale

- Define blast radius budgets in advance.
- Use shadow error budgets to contain experiment risk.
- Increase monitoring intensity during live tests.
- Set expiration windows for experimental code paths.

These constraints maintain safety without blocking experimentation.

## Reasoning trail

Built from practices in chaos engineering, safety science, and post-incident learning. Structured for systems where experimentation is needed but must avoid compounding fragility.

Referenced indirectly:

- *Chaos Engineering* by Basiri, Rosenthal, Allspaw  
- *Site Reliability Engineering* by Beyer et al.  
- *Drift into Failure* by Sidney Dekker
