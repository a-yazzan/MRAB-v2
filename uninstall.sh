#!/bin/bash
set -euo pipefail

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

CAPABILITY_DIR="/etc/inputplumber/capability_maps.d"
ATOMIC_DIR="/etc/atomic-update.conf.d"
HOTKEY_MAP="${CAPABILITY_DIR}/mrab_v2_hotkeys.yaml"
ATOMIC_FILE="${ATOMIC_DIR}/mrab_v2.conf"
STATE_DIR="/var/lib/mrab_v2"

echo -e "${YELLOW}=========================================="
echo " MRAB-v2 - Desinstalación"
echo "==========================================${NC}"
echo

if [ "$EUID" -ne 0 ]; then
  echo -e "${RED}Error: este script necesita permisos de root (sudo).${NC}"
  exit 1
fi

rm -f "$HOTKEY_MAP" "$ATOMIC_FILE"
rm -rf "$STATE_DIR"

if systemctl cat inputplumber.service >/dev/null 2>&1; then
  echo -e "${YELLOW}Reiniciando InputPlumber...${NC}"
  systemctl restart inputplumber.service
fi

echo
echo -e "${GREEN}Desinstalación completada.${NC}"
echo "Se restauró el mapeo por defecto de InputPlumber."
echo
