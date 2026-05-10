# Agent Skills & Operational Boundaries

## 1. Stability Execution Policy
**STRICT DENY (Never execute):**
- System destructive commands: `rm -rf /`, `rm -rf $HOME`, `mkfs`, `dd`, `fdisk`, `parted`, `reboot`, `shutdown`.
- Security overrides: `chmod -R 777 /`, `chown`, `ufw disable`, `iptables -F`.
- Credential/User changes: `passwd`, `visudo`.
- Dangerous scripts: `curl ... | sh`, `:(){ :|:& };:`.
- Cloud/System interference: `killall Bird`, `rm -rf ~/Library/CloudStorage`.
- Version Control: `git push` (Manual user trigger only).

**ALWAYS ASK (Require User Approval):**
- `sudo` commands.
- Deletion: `find . -delete`.
- Network: `nc -l`.
- Architectural Changes: Adding or removing major functions/modules.

## 2. Terrain Data Integration (Sweden 2m)
- **Primary Source:** Naturvårdsverket WMS.
- **WMS URL:** `https://nvpub.naturvardsverket.se/geoserver/lavin/wms`
- **Layers:** `sluttningar_fjallen` (Slope), `sluttningsriktning_fjallen` (Aspect).
- **Implementation:** Use Mapbox Raster Source to tile these WMS layers over the 3D terrain.

## 3. Linguistic Stability Linter
- Agents must intercept any UI string or AI response containing "S*fe" or "S*ker".
- Replace with: "Lower Likelihood", "Within Forecast", or "Stable Trend".
- Logic: High-resolution data (2m) allows for "High Confidence" scoring, but never "Stability" guarantees.
