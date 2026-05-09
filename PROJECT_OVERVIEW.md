# Project: Backcountry Safety Engine
**Status:** Initializing Prototype (Step 1)
**Location:** Sweden (Primary focus: Naturvårdsverket & SMHI data)

## Core Architecture
- **Safety Engine:** Hybrid backend. Deterministic logic (EAWAS/EAWS rules) + Experimental AI (Historical pattern matching).
- **Consumer UI:** 2D/3D Mapbox-based mobile interface with "AI Guide" assistant.
- **Corporate UI:** Expert dashboard for professional forecasters to analyze trends and input observations.

## Tech Stack
- **Backend:** Google Cloud (Vertex AI, Cloud Run), BigQuery, Firebase.
- **Frontend:** Flutter (Consumer) & Next.js (Corporate).
- **Mapping:** Mapbox GL with 2m LiDAR slope/aspect grid overlays.