#!/data/data/com.termux/files/usr/bin/bash

# ==============================================================================
# SCRIPT: universal_exec.sh
# DESCRIPTION: Universal project launcher for Termux & Total Commander
# PURPOSE: Bypasses Android 16 (SDK 36) execution restrictions (Error 405)
#          and handles dynamic path resolution from external apps.
# ==============================================================================

# Color configuration for terminal output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

TARGET="$1"

clear
echo -e "${BLUE}========================================${NC}"
echo -e "${GREEN}       UNIVERSAL PROJECT LAUNCHER       ${NC}"
echo -e "${BLUE}========================================${NC}"
echo -e "Target: ${NC}$TARGET"
echo -e "${BLUE}----------------------------------------${NC}"

# 1. Check if the target file exists
if [ ! -f "$TARGET" ]; then
    echo -e "${RED}[ERROR] File not found.${NC}"
    echo -e "Received Path: \"$TARGET\""
    echo -e "${BLUE}----------------------------------------${NC}"
    echo "Process finished. Press Enter to exit."
    read
    exit 1
fi

# 2. Detect file extension and execute accordingly
case "$TARGET" in
    *.sh)
        echo -e "${GREEN}[EXEC] Bash script detected...${NC}"
        bash "$TARGET"
        ;;
    *.py)
        echo -e "${GREEN}[EXEC] Python script detected...${NC}"
        python "$TARGET"
        ;;
    *.js)
        echo -e "${GREEN}[EXEC] Node.js script detected...${NC}"
        node "$TARGET"
        ;;
    *)
        echo -e "${YELLOW}[WARNING] Unsupported file type.${NC}"
        echo "Attempting to run as a generic shell script..."
        sh "$TARGET"
        ;;
esac

echo -e "${BLUE}----------------------------------------${NC}"
echo "Execution finished. Press Enter to close."
read
