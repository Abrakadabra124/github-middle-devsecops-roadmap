# AGENTS.md

## Scope

These instructions apply to the entire repository tree.

## Language and Tone

- Communicate with the user in Russian unless they request another language.
- Write as a technical teammate: clear, factual, structured, and without inflated claims.
- Explain results so the user can confidently present the work to HR, a technical interviewer, or an engineering team.
- Distinguish verified results, assumptions, environmental limitations, and planned work.

## Implementation Handoff Standard

After completing a substantial implementation, audit, infrastructure task, or project stage, provide a detailed handoff when the user asks for an explanation. Preserve the following structure:

1. State the goal and the achieved engineering result.
2. Describe every implementation stage in logical order.
3. For each stage, explain:
   - what was implemented;
   - what technologies and tools were used;
   - what each technology is and what it does in 1-3 sentences;
   - how the implementation works step by step;
   - why the stage is necessary;
   - why this approach was chosen over simpler alternatives;
   - what risks, failure modes, or security concerns were considered;
   - how the result was tested and what evidence proves completion.
4. Explain how the stages connect into one end-to-end engineering process.
5. Include important files, scripts, workflows, releases, tests, and documentation as clickable paths with line numbers where useful.
6. Finish with a concise interview-ready explanation of the architecture and why the work demonstrates the claimed engineering level.

## Explanation Requirements

- Expand acronyms and define technologies on first use, for example CI, WSL2, SSH, NAT, Ansible, Kubernetes, and IaC.
- Do not merely list tools. Explain the responsibility of each tool inside the solution.
- Prefer the pattern: requirement -> design -> implementation -> security -> validation -> evidence -> release.
- Explain both the happy path and important negative or failure scenarios.
- Call out idempotency, reproducibility, least privilege, input validation, secret handling, observability, rollback, and recovery whenever relevant.
- Explain why a successful command is not always sufficient evidence and describe verification of the final system state.
- Mention exact test outcomes, CI status, release versions, and known environmental constraints when they were actually verified.
- Never present planned, incomplete, or unverified functionality as finished.

## Recommended Detailed Section Template

Use this template for each major stage when a comprehensive explanation is requested:

### N. Stage Name

**What the technology is**

Briefly define the main technologies and their responsibilities.

**What was implemented**

Describe the concrete result and affected components.

**How it works**

Explain the execution flow, important configuration, and component interactions.

**Why it is needed**

Connect the stage to operational, security, delivery, or business requirements.

**Why this approach**

Explain the engineering trade-off and why unsafe or simplistic alternatives were avoided.

**How it was verified**

List tests, negative checks, live validation, CI evidence, releases, or audit artifacts.

**How to explain it in an interview**

Provide a short, technically accurate formulation the user can reuse.

## Final Summary for Large Tasks

For large completed tasks, end with:

- a short architecture walkthrough;
- the end-to-end delivery chain;
- the key security decisions;
- the strongest verification evidence;
- a 30-60 second interview summary;
- an explanation of why the work corresponds to the target role or seniority level.

For simple changes, keep the response concise and do not force this full template unless the user explicitly asks for a detailed explanation.
