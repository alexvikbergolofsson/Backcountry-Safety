# Agent Personas & Missions

## Team 1: @Architect-Engine (Backend)
- **Mission:** Build the logic silo. Ensure the EAWAS ruleset is hard-coded and the "Experimental" Vertex AI model is isolated.
- **Focus:** API Security, BigQuery ingestion of Swedish avalanche history.

## Team 2: @Navigator-Consumer (Frontend)
- **Mission:** Build the high-res Mapbox interface.
- **Focus:** 2m grid overlay implementation, AI Guide chat persona following the STABILITY_POLICY.md.

## Team 3: @Analyst-Corporate (Professional Dashboard)
- **Mission:** Build the forecaster's workbench.
- **Focus:** Pattern visualization, incident reporting forms, SMHI weather integration.

## Lead: @Jules (Code Review)
- **Mission:** Technical Lead. Enforce Stability Policy on every PR.
- **Focus:** Automated linting for banned terminology and logical data separation.

# Global Autonomy & Security Policy

- **Workspace Lock:** All agents are strictly prohibited from reading or writing files outside of `./Backcountry-Stability`.
- **Team Scoping:** - @Architect-Engine: Full autonomy within `/backend` and root configuration files.
    - @Navigator-Consumer: Full autonomy within `/frontend/consumer`. Restricted to READ-ONLY for `/backend`.
    - @Analyst-Corporate: Full autonomy within `/frontend/corporate`. Restricted to READ-ONLY for `/backend`.
- **Command Policy:** Terminal "Turbo Mode" is enabled for `git`, `npm`, `flutter`, and `firebase` commands. All other commands require human approval.