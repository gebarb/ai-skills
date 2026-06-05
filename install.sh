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

# Global variable for multi-select result
SELECT_OPTION_RESULT=""

# Arrow key navigation menu function
select_option() {
    local multi_select="$1"
    local context="$2"
    shift 2
    local options=("$@")
    local num_options=${#options[@]}
    local selected=0
    local key
    local -a selected_indices=()

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
        if [ "$multi_select" = "true" ]; then
            echo -e "${YELLOW}Use ↑/↓ arrows to navigate, Space to select/deselect, Enter to submit${NC}"
        else
            echo -e "${YELLOW}Use ↑/↓ arrows to navigate, Enter to select${NC}"
        fi
        echo ""

        for i in "${!options[@]}"; do
            local is_selected=false
            for idx in "${selected_indices[@]}"; do
                if [ "$idx" -eq "$i" ]; then
                    is_selected=true
                    break
                fi
            done

            if [ "$multi_select" = "true" ]; then
                if [ $i -eq $selected ]; then
                    if [ "$is_selected" = true ]; then
                        echo -e "${CYAN}${BOLD}► ✓ ${options[$i]}${NC}"
                    else
                        echo -e "${CYAN}${BOLD}►   ${options[$i]}${NC}"
                    fi
                else
                    if [ "$is_selected" = true ]; then
                        echo "  ✓ ${options[$i]}"
                    else
                        echo "    ${options[$i]}"
                    fi
                fi
            else
                if [ $i -eq $selected ]; then
                    echo -e "${CYAN}${BOLD}● ${options[$i]}${NC}"
                else
                    echo "  ○ ${options[$i]}"
                fi
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
            ' ') # Space key (for multi-select)
                if [ "$multi_select" = "true" ]; then
                    local already_selected=false
                    for idx in "${!selected_indices[@]}"; do
                        if [ "${selected_indices[$idx]}" -eq "$selected" ]; then
                            unset 'selected_indices[idx]'
                            already_selected=true
                            break
                        fi
                    done
                    if [ "$already_selected" = false ]; then
                        selected_indices+=("$selected")
                    fi
                fi
                ;;
            '') # Enter key
                # Show cursor and restore terminal
                tput cnorm
                if [ -n "$old_stty" ]; then
                    stty "$old_stty" 2>/dev/null
                fi
                echo ""
                if [ "$multi_select" = "true" ]; then
                    if [ ${#selected_indices[@]} -eq 0 ]; then
                        echo -e "${RED}No selection made. Please select at least one option.${NC}"
                        tput civis
                        continue
                    fi
                    echo -e "${GREEN}Selected: ${#selected_indices[@]} option(s)${NC}"
                    # Set global variable with selected indices
                    SELECT_OPTION_RESULT="${selected_indices[*]}"
                    return 0
                else
                    echo -e "${GREEN}Selected: ${options[$selected]}${NC}"
                    return $selected
                fi
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
    select_option "true" "" "Windsurf" "Claude"
    local selected_indices=($SELECT_OPTION_RESULT)
    
    SELECTED_AGENTS=()
    AGENT_NAMES=()
    
    for idx in "${selected_indices[@]}"; do
        case $idx in
            0)
                SELECTED_AGENTS+=("windsurf")
                AGENT_NAMES+=("Windsurf")
                ;;
            1)
                SELECTED_AGENTS+=("claude")
                AGENT_NAMES+=("Claude")
                ;;
        esac
    done
}

# Function to prompt for installation location
select_install_location() {
    set +e  # Disable exit on error for this function
    local agent_list="${AGENT_NAMES[*]}"
    select_option "false" "Agents: $agent_list" "Global AI directories (recommended for use across all projects)" "Specific repository (for use in a single project)"
    location_choice=$?

    case $location_choice in
        0)
            INSTALL_TYPE="global"
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
                    REPO_PATH="$repo_path"
                    echo -e "${GREEN}Installing to repository: $repo_path${NC}"
                    break
                else
                    echo -e "${RED}Invalid path: $repo_path does not exist. Please try again.${NC}"
                fi
            done
            ;;
    esac
    set -e  # Re-enable exit on error
}

# Function to install for a specific agent
install_for_agent() {
    local agent="$1"
    local agent_name=$(get_agent_config "$agent" name)
    
    echo ""
    echo -e "${BLUE}${BOLD}=== Installing for $agent_name ===${NC}"
    
    if [ "$INSTALL_TYPE" = "global" ]; then
        BASE_DIR=$(get_agent_config "$agent" base_dir)
    else
        if [ "$agent" = "windsurf" ]; then
            BASE_DIR="$REPO_PATH/.codeium/windsurf"
        else
            BASE_DIR="$REPO_PATH/.claude"
        fi
    fi
    
    WORKFLOWS_SUBDIR=$(get_agent_config "$agent" workflows_subdir)
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
    
    echo -e "${GREEN}Installation complete for $agent_name!${NC}"
}

# Select agent
select_agent

# Select installation location
select_install_location

# Get the script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Install for each selected agent
for agent in "${SELECTED_AGENTS[@]}"; do
    install_for_agent "$agent"
done

echo ""
echo -e "${GREEN}${BOLD}=== All installations complete! ===${NC}"
echo -e "${YELLOW}You can now use the skills in: ${AGENT_NAMES[*]}${NC}"
echo -e "${YELLOW}Note: You may need to restart the agent(s) for the skills to appear.${NC}"
