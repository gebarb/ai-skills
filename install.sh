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
            local option="${options[$i]}"
            local is_header=false
            
            # Check if this is a header (starts with "HEADER:")
            if [[ "$option" == "HEADER:"* ]]; then
                is_header=true
                option="${option#HEADER:}"
            fi
            
            local is_selected=false
            for idx in "${selected_indices[@]}"; do
                if [ "$idx" -eq "$i" ]; then
                    is_selected=true
                    break
                fi
            done

            if [ "$is_header" = true ]; then
                # Render header
                echo -e "${YELLOW}${BOLD}--- $option ---${NC}"
            elif [ "$multi_select" = "true" ]; then
                if [ $i -eq $selected ]; then
                    if [ "$is_selected" = true ]; then
                        echo -e "${CYAN}${BOLD}► ✓ ${option}${NC}"
                    else
                        echo -e "${CYAN}${BOLD}►   ${option}${NC}"
                    fi
                else
                    if [ "$is_selected" = true ]; then
                        echo "  ✓ ${option}"
                    else
                        echo "    ${option}"
                    fi
                fi
            else
                if [ $i -eq $selected ]; then
                    echo -e "${CYAN}${BOLD}● ${option}${NC}"
                else
                    echo "  ○ ${option}"
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
                        # Skip headers
                        while [[ "${options[$selected]}" == "HEADER:"* ]]; do
                            ((selected--))
                            if [ $selected -lt 0 ]; then
                                selected=$((num_options - 1))
                                break
                            fi
                        done
                        ;;
                    '[B') # Down arrow
                        ((selected++))
                        if [ $selected -ge $num_options ]; then
                            selected=0
                        fi
                        # Skip headers
                        while [[ "${options[$selected]}" == "HEADER:"* ]]; do
                            ((selected++))
                            if [ $selected -ge $num_options ]; then
                                selected=0
                                break
                            fi
                        done
                        ;;
                esac
                ;;
            ' ') # Space key (for multi-select)
                if [ "$multi_select" = "true" ]; then
                    # Don't allow selecting headers
                    if [[ "${options[$selected]}" != "HEADER:"* ]]; then
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
    select_option "true" "" "ALL" "Windsurf" "Claude"
    local selected_indices=($SELECT_OPTION_RESULT)
    
    SELECTED_AGENTS=()
    AGENT_NAMES=()
    
    # Check if "ALL" was selected (index 0)
    local all_selected=false
    for idx in "${selected_indices[@]}"; do
        if [ "$idx" -eq 0 ]; then
            all_selected=true
            break
        fi
    done
    
    if [ "$all_selected" = true ]; then
        # Select all agents
        SELECTED_AGENTS=("windsurf" "claude")
        AGENT_NAMES=("Windsurf" "Claude")
    else
        # Select only the chosen agents
        for idx in "${selected_indices[@]}"; do
            case $idx in
                1)
                    SELECTED_AGENTS+=("windsurf")
                    AGENT_NAMES+=("Windsurf")
                    ;;
                2)
                    SELECTED_AGENTS+=("claude")
                    AGENT_NAMES+=("Claude")
                    ;;
            esac
        done
    fi
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

# Function to prompt for component selection
select_components() {
    # Get the script directory
    SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    
    # Collect all items from each category
    local -a menu_items=()
    local -a item_categories=()
    local -a item_names=()
    local -a menu_to_item_index=()  # Maps menu index to item index (skips headers)
    
    local has_skills=false
    local has_rules=false
    local has_workflows=false
    local item_index=0
    
    # Add ALL option at the top
    menu_items+=("ALL")
    menu_to_item_index+=(-2)  # -2 indicates ALL option
    
    # Skills
    if [ -d "$SCRIPT_DIR/skills" ]; then
        has_skills=true
        menu_items+=("HEADER:Skills")
        menu_to_item_index+=(-1)  # -1 indicates header
        for item in "$SCRIPT_DIR/skills"/*/; do
            if [ -d "$item" ]; then
                local item_name=$(basename "$item")
                menu_items+=("$item_name")
                item_categories+=("skills")
                item_names+=("$item_name")
                menu_to_item_index+=($item_index)
                ((item_index++))
            fi
        done
    fi
    
    # Rules
    if [ -d "$SCRIPT_DIR/rules" ]; then
        has_rules=true
        menu_items+=("HEADER:Rules")
        menu_to_item_index+=(-1)  # -1 indicates header
        for item in "$SCRIPT_DIR/rules"/*; do
            if [ -f "$item" ] || [ -d "$item" ]; then
                local item_name=$(basename "$item")
                menu_items+=("$item_name")
                item_categories+=("rules")
                item_names+=("$item_name")
                menu_to_item_index+=($item_index)
                ((item_index++))
            fi
        done
    fi
    
    # Workflows
    if [ -d "$SCRIPT_DIR/workflows" ]; then
        has_workflows=true
        menu_items+=("HEADER:Workflows")
        menu_to_item_index+=(-1)  # -1 indicates header
        for item in "$SCRIPT_DIR/workflows"/*; do
            if [ -f "$item" ] || [ -d "$item" ]; then
                local item_name=$(basename "$item")
                menu_items+=("$item_name")
                item_categories+=("workflows")
                item_names+=("$item_name")
                menu_to_item_index+=($item_index)
                ((item_index++))
            fi
        done
    fi
    
    # If no items found, default to all
    if [ ${#menu_items[@]} -eq 0 ]; then
        echo -e "${YELLOW}No items found in skills, rules, or workflows directories. Installing all available items.${NC}"
        INSTALL_SKILLS=true
        INSTALL_RULES=true
        INSTALL_WORKFLOWS=true
        return
    fi
    
    # Show menu with all items
    local context="Agents: ${AGENT_NAMES[*]}"
    if [ "$INSTALL_TYPE" = "global" ]; then
        context="$context | Location: Global"
    else
        context="$context | Location: Repository ($REPO_PATH)"
    fi
    select_option "true" "$context" "${menu_items[@]}"
    local selected_indices=($SELECT_OPTION_RESULT)
    
    # Initialize arrays for selected items
    SELECTED_SKILLS=()
    SELECTED_RULES=()
    SELECTED_WORKFLOWS=()
    
    # Parse selections using the menu_to_item_index mapping
    local all_selected=false
    for menu_idx in "${selected_indices[@]}"; do
        local item_idx="${menu_to_item_index[$menu_idx]}"
        
        # Check if ALL was selected (marked with -2)
        if [ "$item_idx" -eq -2 ]; then
            all_selected=true
            break
        fi
    done
    
    if [ "$all_selected" = true ]; then
        # Select all items from all categories
        for i in "${!item_categories[@]}"; do
            local category="${item_categories[$i]}"
            local item_name="${item_names[$i]}"
            
            case "$category" in
                skills)
                    SELECTED_SKILLS+=("$item_name")
                    ;;
                rules)
                    SELECTED_RULES+=("$item_name")
                    ;;
                workflows)
                    SELECTED_WORKFLOWS+=("$item_name")
                    ;;
            esac
        done
    else
        # Select only the chosen items
        for menu_idx in "${selected_indices[@]}"; do
            local item_idx="${menu_to_item_index[$menu_idx]}"
            
            # Skip headers (marked with -1)
            if [ "$item_idx" -eq -1 ]; then
                continue
            fi
            
            local category="${item_categories[$item_idx]}"
            local item_name="${item_names[$item_idx]}"
            
            case "$category" in
                skills)
                    SELECTED_SKILLS+=("$item_name")
                    ;;
                rules)
                    SELECTED_RULES+=("$item_name")
                    ;;
                workflows)
                    SELECTED_WORKFLOWS+=("$item_name")
                    ;;
            esac
        done
    fi
    
    # Set flags based on selections
    INSTALL_SKILLS=$([ ${#SELECTED_SKILLS[@]} -gt 0 ] && echo true || echo false)
    INSTALL_RULES=$([ ${#SELECTED_RULES[@]} -gt 0 ] && echo true || echo false)
    INSTALL_WORKFLOWS=$([ ${#SELECTED_WORKFLOWS[@]} -gt 0 ] && echo true || echo false)
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
    
    # Copy selected skills
    if [ ${#SELECTED_SKILLS[@]} -gt 0 ]; then
        LOCAL_SKILLS_DIR="$SCRIPT_DIR/skills"
        if [ -d "$LOCAL_SKILLS_DIR" ]; then
            local copied_count=0
            for skill in "${SELECTED_SKILLS[@]}"; do
                if [ -d "$LOCAL_SKILLS_DIR/$skill" ]; then
                    echo -e "${GREEN}Copying skill: $skill${NC}"
                    cp -r "$LOCAL_SKILLS_DIR/$skill" "$SKILLS_DIR/"
                    ((copied_count++))
                fi
            done
            echo -e "${GREEN}Successfully copied $copied_count skill(s)${NC}"
        else
            echo -e "${YELLOW}No local skills directory found, skipping skills installation${NC}"
        fi
    else
        echo -e "${YELLOW}Skipping skills installation (none selected)${NC}"
    fi
    
    # Copy selected rules
    if [ ${#SELECTED_RULES[@]} -gt 0 ]; then
        LOCAL_RULES_DIR="$SCRIPT_DIR/rules"
        if [ -d "$LOCAL_RULES_DIR" ]; then
            local copied_count=0
            for rule in "${SELECTED_RULES[@]}"; do
                if [ -e "$LOCAL_RULES_DIR/$rule" ]; then
                    echo -e "${GREEN}Copying rule: $rule${NC}"
                    cp -r "$LOCAL_RULES_DIR/$rule" "$RULES_DIR/"
                    ((copied_count++))
                fi
            done
            echo -e "${GREEN}Successfully copied $copied_count rule(s)${NC}"
        else
            echo -e "${YELLOW}No local rules directory found, skipping rules installation${NC}"
        fi
    else
        echo -e "${YELLOW}Skipping rules installation (none selected)${NC}"
    fi
    
    # Copy selected workflows
    if [ ${#SELECTED_WORKFLOWS[@]} -gt 0 ]; then
        LOCAL_WORKFLOWS_DIR="$SCRIPT_DIR/workflows"
        if [ -d "$LOCAL_WORKFLOWS_DIR" ]; then
            local copied_count=0
            for workflow in "${SELECTED_WORKFLOWS[@]}"; do
                if [ -e "$LOCAL_WORKFLOWS_DIR/$workflow" ]; then
                    echo -e "${GREEN}Copying workflow: $workflow${NC}"
                    cp -r "$LOCAL_WORKFLOWS_DIR/$workflow" "$WORKFLOWS_DIR/"
                    ((copied_count++))
                fi
            done
            echo -e "${GREEN}Successfully copied $copied_count workflow file(s)${NC}"
        else
            echo -e "${YELLOW}No local workflows directory found, skipping workflows installation${NC}"
        fi
    else
        echo -e "${YELLOW}Skipping workflows installation (none selected)${NC}"
    fi
    
    echo -e "${GREEN}Installation complete for $agent_name!${NC}"
}

# Select agent
select_agent

# Select installation location
select_install_location

# Select components to install
select_components

# Install for each selected agent
for agent in "${SELECTED_AGENTS[@]}"; do
    install_for_agent "$agent"
done

echo ""
echo -e "${GREEN}${BOLD}=== All installations complete! ===${NC}"
echo -e "${YELLOW}You can now use the skills in: ${AGENT_NAMES[*]}${NC}"
echo -e "${YELLOW}Note: You may need to restart the agent(s) for the skills to appear.${NC}"
