#!/bin/bash

# Cascade Skills Installation Script
# This script copies all workflow files to the global directory for the selected AI agent

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Agent configuration
# Each agent defines: base_dir, workflows_subdir, docs_subdir (relative to base_dir)
# To add a new agent, add a new entry in the select_agent() function and update the prompt
declare -A AGENT_BASE_DIR
declare -A AGENT_WORKFLOWS_SUBDIR
declare -A AGENT_DOCS_SUBDIR
declare -A AGENT_NAME

# Configure Windsurf
AGENT_NAME["windsurf"]="Windsurf"
AGENT_BASE_DIR["windsurf"]="$HOME/.codeium/windsurf"
AGENT_WORKFLOWS_SUBDIR["windsurf"]="global_workflows"
AGENT_DOCS_SUBDIR["windsurf"]="docs"

# Configure Claude
AGENT_NAME["claude"]="Claude"
AGENT_BASE_DIR["claude"]="$HOME/.claude"
AGENT_WORKFLOWS_SUBDIR["claude"]="skills"
AGENT_DOCS_SUBDIR["claude"]="docs"

# Function to prompt user for agent selection
select_agent() {
    echo -e "${BLUE}Select AI agent to install skills for:${NC}"
    echo "1) Windsurf"
    echo "2) Claude"
    read -p "Enter choice [1-2]: " choice

    case $choice in
        1)
            SELECTED_AGENT="windsurf"
            ;;
        2)
            SELECTED_AGENT="claude"
            ;;
        *)
            echo -e "${RED}Invalid choice. Defaulting to Windsurf.${NC}"
            SELECTED_AGENT="windsurf"
            ;;
    esac

    echo -e "${GREEN}Selected: ${AGENT_NAME[$SELECTED_AGENT]}${NC}"
}

# Select agent
select_agent

# Set directories based on selected agent
BASE_DIR="${AGENT_BASE_DIR[$SELECTED_AGENT]}"
WORKFLOWS_SUBDIR="${AGENT_WORKFLOWS_SUBDIR[$SELECTED_AGENT]}"
DOCS_SUBDIR="${AGENT_DOCS_SUBDIR[$SELECTED_AGENT]}"

WORKFLOWS_DIR="$BASE_DIR/$WORKFLOWS_SUBDIR"
DOCS_DIR="$BASE_DIR/$DOCS_SUBDIR"

# Create the workflows directory if it doesn't exist
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
echo -e "${YELLOW}Note: You may need to restart ${AGENT_NAME[$SELECTED_AGENT]} for the skills to appear.${NC}"
