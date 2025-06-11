---
date: '2016-04-01'
title: 'Systemic decision-making'
---

Not all technical debt comes from code. Some comes from **bad decisions fossilized into systems**. When a misaligned decision is shipped, it doesn’t just "cause problems later" -- it **becomes architecture**. 

This is **systemic decision debt**.

Systemic decision debt = the accumulation of misaligned, rushed, or unconscious decisions embedded in:

- Data models
- Interfaces
- Boundaries
- Team structures
- Governance processes

Unlike code debt, it’s **invisible** until high-stress moments — when you realize the system can't adapt without breaking itself.

---

## How systemic decision debt forms

| Phase | Misstep |
|-------|---------|
| Discovery | Incomplete framing of constraints and goals |
| Alignment | False consensus or unspoken dissent |
| Implementation | Cutting corners without documenting compromises |
| Operation | Normalizing workarounds instead of addressing root decisions |

---

## Symptoms of high decision debt

- Fragile integrations that nobody wants to touch
- Core entities (e.g., "user", "order") with bloated or incoherent models
- Features that are "easy to ship, impossible to change"
- Project estimations wildly off because hidden complexity is unaccounted for

---

## Managing decision debt proactively

### 1. **Architectural compromise ledger**
Track intentional compromises. Make them discoverable and revisitable.

---

### 2. **Alignment time metrics**
Measure and optimize not just building speed, but *understanding speed*.

---

### 3. **Decision hygiene reviews**
Periodically review critical decisions:
- Still valid?
- Assumptions still true?
- New contexts emerged?

---

### 4. **Cultural buffers against drift**
- Normalize raising concerns early.
- Reward identifying misalignment, not just delivering features.
- Train leaders to **detect decision drift** as early signals of fragility.

---

## Metrics to watch

| Metric | Signal |
|--------|--------|
| Fragility Density | How many areas break with minor change? |
| Decision Drift Ratio | % of shipped features with undocumented critical trade-offs |
| Alignment Failure Rate | % of major initiatives needing mid-flight pivots |

---

If you don't manage your decisions, your architecture will manage you.
