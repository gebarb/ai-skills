#!/bin/bash

# Cascade Skills Installation Script
# This script copies all workflow files to the global Cascade/Windsurf directory

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Determine the global .windsurf directory
# Common locations for .windsurf directory
POSSIBLE_DIRS=(
    "$HOME/.windsurf"
    "$HOME/.config/windsurf"
    "$HOME/Library/Application Support/windsurf"
)

WINDSURF_DIR=""

for dir in "${POSSIBLE_DIRS[@]}"; do
    if [ -d "$dir" ]; then
        WINDSURF_DIR="$dir"
        break
    fi
done

# If not found in common locations, ask user
if [ -z "$WINDSURF_DIR" ]; then
    echo -e "${YELLOW}Could not find .windsurf directory in common locations.${NC}"
    echo -e "${YELLOW}Please enter the path to your .windsurf directory:${NC}"
    read -r WINDSURF_DIR
fi

# Validate the directory exists
if [ ! -d "$WINDSURF_DIR" ]; then
    echo -e "${RED}Error: Directory $WINDSURF_DIR does not exist.${NC}"
    exit 1
fi

# Create workflows directory if it doesn't exist
WORKFLOWS_DIR="$WINDSURF_DIR/workflows"
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

# Check if running from within a project directory
CURRENT_DIR="$(pwd)"
PROJECT_WINDSURF_DIR="$CURRENT_DIR/.windsurf"

if [ -d "$PROJECT_WINDSURF_DIR" ]; then
    echo -e "${YELLOW}Detected project-specific .windsurf directory at $PROJECT_WINDSURF_DIR${NC}"
    echo -e "${YELLOW}Would you like to also install to this project directory? (y/n)${NC}"
    read -r INSTALL_TO_PROJECT

    if [ "$INSTALL_TO_PROJECT" = "y" ] || [ "$INSTALL_TO_PROJECT" = "Y" ]; then
        # Create project workflows directory if it doesn't exist
        PROJECT_WORKFLOWS_DIR="$PROJECT_WINDSURF_DIR/workflows"
        if [ ! -d "$PROJECT_WORKFLOWS_DIR" ]; then
            echo -e "${YELLOW}Creating project workflows directory at $PROJECT_WORKFLOWS_DIR${NC}"
            mkdir -p "$PROJECT_WORKFLOWS_DIR"
        fi

        # Copy workflow files to project directory
        echo -e "${GREEN}Copying workflow files to $PROJECT_WORKFLOWS_DIR${NC}"
        cp -v "$LOCAL_WORKFLOWS_DIR"/*.md "$PROJECT_WORKFLOWS_DIR/"

        # Create project docs directory if it doesn't exist
        PROJECT_DOCS_DIR="$PROJECT_WINDSURF_DIR/docs"
        if [ ! -d "$PROJECT_DOCS_DIR" ]; then
            echo -e "${YELLOW}Creating project docs directory at $PROJECT_DOCS_DIR${NC}"
            mkdir -p "$PROJECT_DOCS_DIR"
        fi

        # Copy docs files to project directory
        if [ -d "$LOCAL_DOCS_DIR" ]; then
            echo -e "${GREEN}Copying docs files to $PROJECT_DOCS_DIR${NC}"
            cp -rv "$LOCAL_DOCS_DIR"/* "$PROJECT_DOCS_DIR/"
        fi

        echo -e "${GREEN}Successfully installed to project directory${NC}"
    fi
fi

echo -e "${GREEN}Installation complete!${NC}"
echo -e "${YELLOW}You can now use the skills in Cascade AI.${NC}"
echo -e "${YELLOW}Note: You may need to restart Windsurf for the skills to appear.${NC}"
