#!/bin/bash

# Cascade Skills Installation Script
# This script copies all workflow files to the global Cascade/Windsurf directory

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Determine the global Windsurf directory for workflows
# Global workflows must be in ~/.codeium/windsurf/global_workflows/
GLOBAL_WORKFLOWS_DIR="$HOME/.codeium/windsurf/global_workflows"

# Create the directory if it doesn't exist
if [ ! -d "$GLOBAL_WORKFLOWS_DIR" ]; then
    echo -e "${YELLOW}Creating global workflows directory at $GLOBAL_WORKFLOWS_DIR${NC}"
    mkdir -p "$GLOBAL_WORKFLOWS_DIR"
fi

WINDSURF_DIR="$HOME/.codeium/windsurf"

# Create workflows directory if it doesn't exist
WORKFLOWS_DIR="$GLOBAL_WORKFLOWS_DIR"
if [ ! -d "$WORKFLOWS_DIR" ]; then
    echo -e "${YELLOW}Creating workflows directory at $WORKFLOWS_DIR${NC}"
    mkdir -p "$WORKFLOWS_DIR"
fi

# Get the script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LOCAL_WORKFLOWS_DIR="$SCRIPT_DIR/workflows"

# Check if local workflows directory exists
if [ ! -d "$LOCAL_WORKFLOWS_DIR" ]; then
    echo -e "${RED}Error: Local workflows directory not found at $LOCAL_WORKFLOWS_DIR${NC}"
    exit 1
fi

# Copy all workflow files
echo -e "${GREEN}Copying workflow files to $WORKFLOWS_DIR${NC}"
cp -v "$LOCAL_WORKFLOWS_DIR"/*.md "$WORKFLOWS_DIR/"

# Count copied workflow files
WORKFLOW_COPIED_COUNT=$(ls -1 "$LOCAL_WORKFLOWS_DIR"/*.md 2>/dev/null | wc -l)

echo -e "${GREEN}Successfully copied $WORKFLOW_COPIED_COUNT workflow file(s)${NC}"

# Create docs directory if it doesn't exist
DOCS_DIR="$WINDSURF_DIR/docs"
if [ ! -d "$DOCS_DIR" ]; then
    echo -e "${YELLOW}Creating docs directory at $DOCS_DIR${NC}"
    mkdir -p "$DOCS_DIR"
fi

LOCAL_DOCS_DIR="$SCRIPT_DIR/docs"

# Check if local docs directory exists
if [ -d "$LOCAL_DOCS_DIR" ]; then
    # Copy all docs files
    echo -e "${GREEN}Copying docs files to $DOCS_DIR${NC}"
    cp -rv "$LOCAL_DOCS_DIR"/* "$DOCS_DIR/"

    # Count copied docs files
    DOCS_COPIED_COUNT=$(find "$LOCAL_DOCS_DIR" -type f | wc -l)

    echo -e "${GREEN}Successfully copied $DOCS_COPIED_COUNT docs file(s)${NC}"
else
    echo -e "${YELLOW}No local docs directory found, skipping docs installation${NC}"
fi

echo -e "${GREEN}Installation complete!${NC}"
echo -e "${YELLOW}You can now use the skills in Cascade AI.${NC}"
echo -e "${YELLOW}Note: You may need to restart Windsurf for the skills to appear.${NC}"
