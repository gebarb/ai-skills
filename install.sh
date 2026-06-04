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
                docs_subdir) echo "docs" ;;
            esac
            ;;
        claude)
            case $config_type in
                name) echo "Claude" ;;
                base_dir) echo "$HOME/.claude" ;;
                workflows_subdir) echo "workflows" ;;
                docs_subdir) echo "docs" ;;
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
DOCS_SUBDIR=$(get_agent_config "$SELECTED_AGENT" docs_subdir)

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

# Copy all workflow files and replace placeholders
echo -e "${GREEN}Copying workflow files to $WORKFLOWS_DIR${NC}"
for file in "$LOCAL_WORKFLOWS_DIR"/*.md; do
    if [ -f "$file" ]; then
        # Replace {{DOCS_DIR}} placeholder with actual docs directory
        sed "s|{{DOCS_DIR}}|$DOCS_DIR|g" "$file" > "$WORKFLOWS_DIR/$(basename "$file")"
    fi
done

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
    # Copy all docs files and replace placeholders
    echo -e "${GREEN}Copying docs files to $DOCS_DIR${NC}"
    
    # Create a temporary directory for processing
    TEMP_DOCS_DIR=$(mktemp -d)
    
    # Copy docs to temp directory
    cp -r "$LOCAL_DOCS_DIR"/* "$TEMP_DOCS_DIR/"
    
    # Replace {{DOCS_DIR}} placeholder in all markdown files
    find "$TEMP_DOCS_DIR" -type f -name "*.md" -exec sed -i '' "s|{{DOCS_DIR}}|$DOCS_DIR|g" {} \;
    
    # Copy processed docs to destination
    cp -r "$TEMP_DOCS_DIR"/* "$DOCS_DIR/"
    
    # Clean up temp directory
    rm -rf "$TEMP_DOCS_DIR"
    
    # Count copied docs files
    DOCS_COPIED_COUNT=$(find "$LOCAL_DOCS_DIR" -type f | wc -l)

    echo -e "${GREEN}Successfully copied $DOCS_COPIED_COUNT docs file(s)${NC}"
else
    echo -e "${YELLOW}No local docs directory found, skipping docs installation${NC}"
fi

echo -e "${GREEN}Installation complete!${NC}"
echo -e "${YELLOW}You can now use the skills in Cascade AI.${NC}"
echo -e "${YELLOW}Note: You may need to restart $AGENT_NAME for the skills to appear.${NC}"
