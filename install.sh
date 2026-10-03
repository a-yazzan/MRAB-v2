#!/bin/bash
set -euo pipefail

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

CAPABILITY_DIR="/etc/inputplumber/capability_maps.d"
ATOMIC_DIR="/etc/atomic-update.conf.d"
HOTKEY_MAP="${CAPABILITY_DIR}/ally_type1.yaml"
ATOMIC_FILE="${ATOMIC_DIR}/mrab_v2.conf"
STATE_DIR="/var/lib/mrab_v2"

echo -e "${YELLOW}=========================================="
echo " MRAB-v2 - Make Rog Ally Better (Paddle Swap)"
echo "==========================================${NC}"
echo

if [ "$EUID" -ne 0 ]; then
  echo -e "${RED}Error: este script necesita permisos de root (sudo).${NC}"
  exit 1
fi

if ! command -v inputplumber >/dev/null 2>&1; then
  echo -e "${RED}Error: InputPlumber no está instalado.${NC}"
  exit 1
fi

mkdir -p "$CAPABILITY_DIR" "$ATOMIC_DIR" "$STATE_DIR"

# Limpiamos posibles archivos viejos de versiones anteriores
rm -f "${CAPABILITY_DIR}/mrab_v2_hotkeys.yaml" 2>/dev/null || true

cat > "$HOTKEY_MAP" << 'EOF'
# Managed by MRAB-v2
# Overrides the stock aly1 map
# Paddles → Guide + QuickAccess
# AC / CC → Paddles
version: 1
kind: CapabilityMap
name: Ally Type 1
id: aly1

mapping:
  - name: Left Paddle to Guide
    source_events:
      - keyboard: KeyF14
    target_event:
      gamepad:
        button: Guide

  - name: Right Paddle to QuickAccess
    source_events:
      - keyboard: KeyF15
    target_event:
      gamepad:
        button: QuickAccess

  - name: Control Center to Left Paddle
    source_events:
      - keyboard: KeyF16
    target_event:
      gamepad:
        button: LeftPaddle1

  - name: Armory Crate to Right Paddle
    source_events:
      - keyboard: KeyProg1
    target_event:
      gamepad:
        button: RightPaddle1

  - name: Armory Crate F19 to Right Paddle
    source_events:
      - keyboard: KeyF19
    target_event:
      gamepad:
        button: RightPaddle1

  - name: CC Long to Left Paddle
    source_events:
      - keyboard: KeyF20
    target_event:
      gamepad:
        button: LeftPaddle1

  - name: AC Long to Right Paddle
    source_events:
      - keyboard: KeyF17
    target_event:
      gamepad:
        button: RightPaddle1

filtered_events: []
EOF

cat > "$ATOMIC_FILE" << EOF
# Managed by MRAB-v2 - keep config across SteamOS updates
${HOTKEY_MAP}
EOF

echo -e "${YELLOW}Reiniciando InputPlumber...${NC}"
systemctl restart inputplumber.service

echo
echo -e "${GREEN}=========================================="
echo " Instalación completada"
echo "==========================================${NC}"
echo
echo "Layout aplicado:"
echo "  M1 (Left Paddle)  → Guide (Steam)"
echo "  M2 (Right Paddle) → Quick Access"
echo "  CC                → Left Paddle"
echo "  AC                → Right Paddle"
echo
echo "Reiniciá el Ally o salí/volvé a Gaming Mode para que Steam tome los cambios."
echo
