#!/bin/bash

# AI Agent Skills Installation Script
# This script copies skills, rules, and workflows to the global directory for the selected AI agent

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Agent configuration
# Function to get agent configuration
get_agent_config() {
    local agent=$1
    local config_type=$2

    case $agent in
        windsurf)
            case $config_type in
                name) echo "Windsurf" ;;
                base_dir) echo "$HOME/.codeium/windsurf" ;;
                workflows_subdir) echo "global_workflows" ;;
            esac
            ;;
        claude)
            case $config_type in
                name) echo "Claude" ;;
                base_dir) echo "$HOME/.claude" ;;
                workflows_subdir) echo "workflows" ;;
            esac
            ;;
    esac
}

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

    AGENT_NAME=$(get_agent_config "$SELECTED_AGENT" name)
    echo -e "${GREEN}Selected: $AGENT_NAME${NC}"
}

# Select agent
select_agent

# Set directories based on selected agent
BASE_DIR=$(get_agent_config "$SELECTED_AGENT" base_dir)
WORKFLOWS_SUBDIR=$(get_agent_config "$SELECTED_AGENT" workflows_subdir)

WORKFLOWS_DIR="$BASE_DIR/$WORKFLOWS_SUBDIR"

# Create the workflows directory if it doesn't exist
if [ ! -d "$WORKFLOWS_DIR" ]; then
    echo -e "${YELLOW}Creating workflows directory at $WORKFLOWS_DIR${NC}"
    mkdir -p "$WORKFLOWS_DIR"
fi

# Get the script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Copy skills directory
LOCAL_SKILLS_DIR="$SCRIPT_DIR/skills"
if [ -d "$LOCAL_SKILLS_DIR" ]; then
    echo -e "${GREEN}Copying skills directory to $WORKFLOWS_DIR${NC}"
    cp -r "$LOCAL_SKILLS_DIR"/* "$WORKFLOWS_DIR/"
    SKILL_COPIED_COUNT=$(ls -1 "$LOCAL_SKILLS_DIR"/*/ 2>/dev/null | wc -l)
    echo -e "${GREEN}Successfully copied $SKILL_COPIED_COUNT skill(s)${NC}"
else
    echo -e "${YELLOW}No local skills directory found, skipping skills installation${NC}"
fi

# Copy rules directory
LOCAL_RULES_DIR="$SCRIPT_DIR/rules"
if [ -d "$LOCAL_RULES_DIR" ] && [ "$(ls -A "$LOCAL_RULES_DIR" 2>/dev/null)" ]; then
    echo -e "${GREEN}Copying rules directory to $BASE_DIR${NC}"
    cp -r "$LOCAL_RULES_DIR"/* "$BASE_DIR/"
    RULES_COPIED_COUNT=$(ls -1 "$LOCAL_RULES_DIR" 2>/dev/null | wc -l)
    echo -e "${GREEN}Successfully copied $RULES_COPIED_COUNT rule(s)${NC}"
else
    echo -e "${YELLOW}No local rules directory found or empty, skipping rules installation${NC}"
fi

# Copy workflows directory
LOCAL_WORKFLOWS_DIR="$SCRIPT_DIR/workflows"
if [ -d "$LOCAL_WORKFLOWS_DIR" ] && [ "$(ls -A "$LOCAL_WORKFLOWS_DIR" 2>/dev/null)" ]; then
    echo -e "${GREEN}Copying workflows directory to $WORKFLOWS_DIR${NC}"
    cp -r "$LOCAL_WORKFLOWS_DIR"/* "$WORKFLOWS_DIR/"
    WORKFLOWS_COPIED_COUNT=$(ls -1 "$LOCAL_WORKFLOWS_DIR" 2>/dev/null | wc -l)
    echo -e "${GREEN}Successfully copied $WORKFLOWS_COPIED_COUNT workflow file(s)${NC}"
else
    echo -e "${YELLOW}No local workflows directory found or empty, skipping workflows installation${NC}"
fi

echo -e "${GREEN}Installation complete!${NC}"
echo -e "${YELLOW}You can now use the skills in $AGENT_NAME.${NC}"
echo -e "${YELLOW}Note: You may need to restart $AGENT_NAME for the skills to appear.${NC}"
