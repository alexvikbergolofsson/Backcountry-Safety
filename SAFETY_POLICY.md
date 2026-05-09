# Safety & Liability Guardrails

## 1. The "Safe" Ban
- The word "Safe" (or "Säker") must NEVER be used in UI strings or AI responses regarding terrain.
- Required phrasing: "Lower Likelihood of Incident," "Within Forecast Parameters," or "Terrain matches historical stability."

## 2. Confidence Scoring
- All AI-generated advice must display a Confidence Score: [High | Medium | Low].
- Logic: If data is >24hrs old or grid resolution is >2m, confidence cannot be "High."

## 3. Separation of Concerns
- Experimental Engine data (Pattern Recognition) is for Corporate/Professional use ONLY.
- It must not be exposed to the Consumer API.

## 4. Scale Standards
- All risk assessments must align with the European Avalanche Danger Scale (1-5).