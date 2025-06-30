---
title: Predictable failure
summary: Resilient systems do not prevent all failure -- they shape how failure occurs. Visibility, containment, and recovery must be designed.
---

## Engineering for predictable failure

In complex systems, failure is a given. What matters is how failure behaves. Predictable failure means errors occur within known boundaries, are quickly detected, and can be recovered without system-wide damage.

## Why predictable failure matters

Predictability changes the nature of failure:

- **Incident impact**: from cascading to contained  
- **Diagnosis speed**: from ambiguous to directional  
- **Recovery cost**: from variable to planned  
- **Team morale**: from erosion to reinforcement

## Anatomy of trustworthy failure

- **Visibility**: failures are easy to detect and diagnose  
- **Localization**: errors stay confined to defined areas  
- **Degradation**: reduced service continues safely  
- **Recoverability**: restoration paths are designed and rehearsed

## Patterns for predictable failure

- **Fail fast, not fragile**: stop early rather than corrupt silently  
- **Degradation modes**: document and design partial service intentionally  
- **Tight error contracts**: make failure handling part of your interface  
- **Controlled chaos**: validate assumptions with structured failure tests

## From robustness to resilience

Robust systems try to prevent failure. Resilient systems expect it and recover.

- **Robustness**: static defense, assumes known threats  
- **Resilience**: adaptive design, accepts unknown conditions

## Engineering signals to track

- Time to detect vs. time to recover (TTD/TTR)  
- Percentage of systems with clear degradation plans  
- Frequency of recovery drills and chaos tests

## Cross-links

- [Building resilience through decision feedback loops](../notes/Building%20resilience%20through%20decision%20feedback%20loops.md)  
- [Capability mapping for trustworthy systems](../notes/Capability%20Mapping%20for%20Trustworthy%20Systems.md)  
- [Resilience loops](../systems-under-drift/Resilience%20loops.md)  
- [Trustworthy evolution](../systems-under-drift/Trustworthy%20evolution.md)
