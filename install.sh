#!/bin/bash

# AI Agent Skills Installation Script
# This script copies skills, rules, and workflows to the global directory for the selected AI agent

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m' # No Color

# Arrow key navigation menu function
select_option() {
    local context="$1"
    shift
    local options=("$@")
    local num_options=${#options[@]}
    local selected=0
    local key

    # Save terminal settings
    local old_stty=$(stty -g 2>/dev/null)

    # Hide cursor
    tput civis

    while true; do
        # Clear screen and redraw menu
        clear
        if [ -n "$context" ]; then
            echo -e "${BLUE}${BOLD}$context${NC}"
            echo ""
        fi
        echo -e "${BLUE}${BOLD}Select an option:${NC}"
        echo ""
        echo -e "${YELLOW}Use ↑/↓ arrows to navigate, Enter to select${NC}"
        echo ""

        for i in "${!options[@]}"; do
            if [ $i -eq $selected ]; then
                echo -e "${CYAN}${BOLD}● ${options[$i]}${NC}"
            else
                echo "  ○ ${options[$i]}"
            fi
        done

        # Read single character
        IFS= read -rsn1 key

        # Handle arrow keys
        case $key in
            $'\x1b') # Escape sequence
                read -rsn2 key
                case $key in
                    '[A') # Up arrow
                        ((selected--))
                        if [ $selected -lt 0 ]; then
                            selected=$((num_options - 1))
                        fi
                        ;;
                    '[B') # Down arrow
                        ((selected++))
                        if [ $selected -ge $num_options ]; then
                            selected=0
                        fi
                        ;;
                esac
                ;;
            '') # Enter key
                # Show cursor and restore terminal
                tput cnorm
                if [ -n "$old_stty" ]; then
                    stty "$old_stty" 2>/dev/null
                fi
                echo ""
                echo -e "${GREEN}Selected: ${options[$selected]}${NC}"
                return $selected
                ;;
        esac
    done
}

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
    select_option "" "Windsurf" "Claude"
    choice=$?

    case $choice in
        0)
            SELECTED_AGENT="windsurf"
            ;;
        1)
            SELECTED_AGENT="claude"
            ;;
    esac

    AGENT_NAME=$(get_agent_config "$SELECTED_AGENT" name)
}

# Function to prompt for installation location
select_install_location() {
    set +e  # Disable exit on error for this function
    select_option "Agent: $AGENT_NAME" "Global AI directories (recommended for use across all projects)" "Specific repository (for use in a single project)"
    location_choice=$?

    case $location_choice in
        0)
            INSTALL_TYPE="global"
            BASE_DIR=$(get_agent_config "$SELECTED_AGENT" base_dir)
            WORKFLOWS_SUBDIR=$(get_agent_config "$SELECTED_AGENT" workflows_subdir)
            echo -e "${GREEN}Installing to global directories${NC}"
            ;;
        1)
            INSTALL_TYPE="repository"
            # Show cursor before prompting
            tput cnorm 2>/dev/null || true
            echo ""
            echo -e "${BLUE}Enter the repository path:${NC}"
            while true; do
                read repo_path
                # Expand ~ to home directory
                repo_path="${repo_path/#\~/$HOME}"
                
                if [ -d "$repo_path" ]; then
                    # Add agent-specific prefix for repository installs
                    if [ "$SELECTED_AGENT" = "windsurf" ]; then
                        BASE_DIR="$repo_path/.codeium/windsurf"
                    else
                        BASE_DIR="$repo_path/.claude"
                    fi
                    WORKFLOWS_SUBDIR=$(get_agent_config "$SELECTED_AGENT" workflows_subdir)
                    echo -e "${GREEN}Installing to repository: $BASE_DIR${NC}"
                    break
                else
                    echo -e "${RED}Invalid path: $repo_path does not exist. Please try again.${NC}"
                fi
            done
            ;;
    esac
    set -e  # Re-enable exit on error
}

# Select agent
select_agent

# Select installation location
select_install_location

WORKFLOWS_DIR="$BASE_DIR/$WORKFLOWS_SUBDIR"
SKILLS_DIR="$BASE_DIR/skills"
RULES_DIR="$BASE_DIR/rules"

# Create the directories if they don't exist
for dir in "$WORKFLOWS_DIR" "$SKILLS_DIR" "$RULES_DIR"; do
    if [ ! -d "$dir" ]; then
        echo -e "${YELLOW}Creating directory at $dir${NC}"
        mkdir -p "$dir"
    fi
done

# Get the script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Copy skills directory
LOCAL_SKILLS_DIR="$SCRIPT_DIR/skills"
if [ -d "$LOCAL_SKILLS_DIR" ]; then
    echo -e "${GREEN}Copying skills directory to $SKILLS_DIR${NC}"
    cp -r "$LOCAL_SKILLS_DIR"/* "$SKILLS_DIR/"
    SKILL_COPIED_COUNT=$(ls -1 "$LOCAL_SKILLS_DIR"/*/ 2>/dev/null | wc -l)
    echo -e "${GREEN}Successfully copied $SKILL_COPIED_COUNT skill(s)${NC}"
else
    echo -e "${YELLOW}No local skills directory found, skipping skills installation${NC}"
fi

# Copy rules directory
LOCAL_RULES_DIR="$SCRIPT_DIR/rules"
if [ -d "$LOCAL_RULES_DIR" ] && [ "$(ls -A "$LOCAL_RULES_DIR" 2>/dev/null)" ]; then
    echo -e "${GREEN}Copying rules directory to $RULES_DIR${NC}"
    cp -r "$LOCAL_RULES_DIR"/* "$RULES_DIR/"
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
