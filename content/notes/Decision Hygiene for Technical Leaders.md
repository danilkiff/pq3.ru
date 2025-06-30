---
title: Decision hygiene
summary: Strong decisions reduce fragility. Technical leaders must design thinking habits that resist bias, drift, and premature lock-in.
---

## Decision hygiene for technical leaders

In complex systems, most failures come not from incompetence, but from flawed decisions made under pressure or without structure. Decision hygiene is the discipline that prevents this drift.

## What is decision hygiene

Decision hygiene means structuring your thinking to:

- reduce cognitive bias  
- delay commitment until constraints are known  
- expose trade-offs clearly  
- maintain decision reversibility  
- separate signal from noise

The aim is not certainty. It is to lower the cost of wrong calls and avoid cascading fragility.

## Signs of poor decision hygiene

- Choosing architectures before understanding business needs  
- Prioritizing speed over long-term adaptability  
- Making hard-to-reverse decisions without firm ground  
- Reacting to urgency without assessing importance  
- Assuming alignment without verification

## Core practices

- **Context before options**: define constraints, risks, and impact before picking a path  
- **Premortems**: simulate failure before committing, not just after delivery  
- **Reversibility framing**: know which choices are cheap to undo and which are not  
- **Slow the first step**: initial structures often shape the hardest constraints  
- **Document criteria**: record why this decision was made, what was rejected, and when to revisit

  - See: [Architectural compromise ledger](../notes/Architectural%20Compromise%20Ledger.md)

## Quick audit

- Is the problem framed independently of the proposed solution?  
- What cognitive biases may distort this decision?  
- How will this decision hold under future shifts?  
- What guidance would I leave for the next team facing this same choice?

## Cross-links

- [Architectural compromise ledger](../notes/Architectural%20Compromise%20Ledger.md)  
- [Alignment time](../notes/Alignment%20time.%20The%20hidden%20cost%20in%20product%20development.md)  
- [Resilience feedback loop design](../notes/Building%20resilience%20through%20decision%20feedback%20loops.md)  
- [Systemic decision debt](../notes/Reasoning%20debt%20-%20the%20invisible%20risk%20behind%20system%20fragility.md)
