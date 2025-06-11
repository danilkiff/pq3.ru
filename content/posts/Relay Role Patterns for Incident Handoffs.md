---
date: '2016-04-01'
title: 'Relay role patterns for incident handoffs'
---

## Why it matters
In critical incident response, time and context are everything. When incidents cross shift boundaries, poor handoffs create massive risks: duplicated effort, missed signals, inconsistent assumptions. Establishing a clear *Relay Role* can dramatically stabilize incident handling across shifts, reducing downtime and cognitive overload.

---

## **Core idea**
The *Relay* is a designated participant during an incident handoff whose primary duty is not to solve the problem, but to **transfer the full operational context** to the incoming team.  
The relay acts as a "living bridge" for continuity, minimizing context decay under stress.

---

## **Practical applications**
- **During Incident Handoff:**
  - Relay participates in the last hour of the outgoing shift.
  - Collects structured incident information (timeline, symptoms, actions taken, hypotheses).
  - Prepares a handoff summary and delivers it synchronously to the incoming team.

- **When Designing Shift Rotations:**
  - Include explicit *relay windows* (e.g., 60 minutes overlap).
  - Assign relay responsibilities rotationally to prevent burnout.

- **For Complex Incidents:**
  - Assign both a Relay and a Shadow (observer) to capture deeper patterns.
  - Relays may stay available for 30–60 minutes post-handoff in a passive standby mode.

---

## **Common pitfalls**
| Pitfall                         | How to Avoid                      |
|----------------------------------|-----------------------------------|
| Relay over-engages in troubleshooting | Strictly limit relay duties to information transfer |
| Relay improvises the handoff structure | Use a predefined checklist and templates |
| No formal ownership of the relay role | Explicitly assign and acknowledge the relay during shift planning |
| Incoming team ignores relay data | Make relay input mandatory for incident ownership transfer |

---

## **Reasoning trail**
- Derived from **critical incident response protocols** in aviation, medicine, and military.
- Synthesized with **resilience engineering** practices for shift-based systems (e.g., SRE handoffs).
- Inspired by the **shadow mode and overlap models** in 24/7 operations.

**Connections:**
- Cross-links with articles on *Resilient Evolution*, *Self-Aligning Systems*, and *Trustworthy Change*.
- Foundation for further work on *Cognitive Load Management during Incidents*.

