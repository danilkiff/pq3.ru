---
title: Capability mapping
summary: Trustworthy systems depend on observable, repeatable capabilities. Capability mapping makes that trust visible and maintainable.
---

## Capability mapping for trustworthy systems

Trust is not an intention. It emerges from demonstrated, repeatable system behaviors. Capability mapping replaces assumptions with evidence. It shows where trust is built -- and where it is missing.

## What is a capability

A capability is a system’s consistent ability to deliver under both normal and adverse conditions. It is not a feature or a tool.

- **Input**: when and why the capability is needed  
- **Process**: how the system responds  
- **Output**: measurable result confirming the action worked

Capabilities are shown through use, not declared in design.

## Why map capabilities

Mapping reveals where resilience is real and where it is assumed. It enables teams to:

- expose gaps in reliability and trust  
- align investment with actual system needs  
- focus on resilience instead of feature expansion  
- detect early signs of capability decay

If a capability cannot be observed or measured, it cannot be improved.

## Capability mapping steps

1. Identify trust anchors -- what parts of the system must never lose integrity  
2. Define critical capabilities -- what the system must reliably do under pressure  
3. Assess maturity -- look for working evidence, not stated intentions  
4. Plan capability growth -- treat each one as an asset under development

Focus on the capabilities that, if missing, would introduce systemic failure.

## Example: trustworthy capability

**Automated recovery**  
The system restores service after known failures without human intervention.

- *Metric*: mean time to autonomous recovery (MTAR)

## Continuous capability evolution

Capabilities degrade if not maintained. Systems evolve, and expectations shift.

- New risks demand new responses  
- Old weaknesses harden into structural fragility if left unchecked

Resilience requires continuous review and upgrade of core abilities.

## Metrics for capability health

- **Capability drift rate**: deviation from original function  
- **Fragility index**: observed failure frequency under load  
- **Development velocity**: time from gap discovery to capability update

## Cross-links

- [Architectural integrity manifesto](../essays/architectural-integrity/Architectural%20integrity%20manifesto.md)  
- [Trustworthy evolution](../systems-under-drift/Trustworthy%20evolution.md)  
- [Capability drift](../notes/Capability%20drift.%20The%20hidden%20risk%20in%20long-lived%20systems.md)  
- [Resilience loops](../systems-under-drift/Resilience%20loops.md)
